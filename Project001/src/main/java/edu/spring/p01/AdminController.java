package edu.spring.p01;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.spring.p01.domain.AttachImageVO;
import edu.spring.p01.domain.CateVO;
import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.pageutil.PageMaker;
import edu.spring.p01.service.AdminService;
import edu.spring.p01.service.MemberService;
import edu.spring.p01.util.UploadFileUtils;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;

	@Autowired
	private MemberService memberService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 관리자 페이지 이동
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void adminPageGET() {
		logger.info("adminPageGET() Call >>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("................................................");
	}

	// 상품 등록 페이지 이동
	@GetMapping(value = "/productReg")
	public void productRegGET(Model model) throws Exception {
		logger.info("productRegGET() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>");

		// ObjectMapper 클래스를 인스턴스화 하여 사용
		// 인스턴스화 : 클래스 내의 객체에 대한 특정한 변형을 정의하고
		// 이름을 붙인 다음, 그것을 물리적인 어떤 장소에 위치시키는 등의
		// 작업을 통해 인스턴스를 하는 것을 의미
		ObjectMapper objm = new ObjectMapper();

		// 카테고리 리스트 데이터를 담고 있는 객체 'list'
		// 해당 객체를 JSON형식의 String 데이터로 변환
		List<CateVO> list = adminService.cateList();

		// writeValueAsString : Java 객체를 String 타입의 JSON형식 데이터로 변환해 줌
		String cateList = objm.writeValueAsString(list);

		// 뷰(view)로 데이터를 넘겨주기 위해서 url매핑 메서드의 파라미터에
		// Model를 부텨해준 후 addAttribute()를 사용하여
		// "cateList" 속성에 Stirng타입의 'cateList' 변수의 값을 저장시킴
		model.addAttribute("cateList", cateList);

		logger.info("변경 전 >> " + list);
		logger.info("................................................");
		
		logger.info("변경 후 >> " + cateList);
		logger.info("................................................");
	}

	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		logger.info("uploadAjaxActionPOST..........");
		logger.info("................................................");
		
		/* 이미지 파일 체크 */
		/* MIME TYPE 체크 */
		/* 전달 받은 파일이 이미지 인지 아닌지 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
			
		}// for
		
		String uploadFolder = "c:\\upload";

		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		// 기본 for
		for (int i = 0; i < uploadFile.length; i++) {
			logger.info("---------------------------------------------------");
			logger.info("파일 이름 : " + uploadFile[i].getOriginalFilename());
			logger.info("파일 타입 : " + uploadFile[i].getContentType());
			logger.info("파일 크기 : " + uploadFile[i].getSize());
		}
		
		/* 이미지 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();

		// 향상된 for
		for (MultipartFile multipartFile : uploadFile) {
			logger.info("---------------------------------------------------");
			logger.info("파일 이름 : " + multipartFile.getOriginalFilename());
			logger.info("파일 타입 : " + multipartFile.getContentType());
			logger.info("파일 크기 : " + multipartFile.getSize());
			
			/* 이미지 정보 객체 */
			AttachImageVO vo = new AttachImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 이름 저장 */
			try {
				multipartFile.transferTo(saveFile);

				/* 썸네일 생성(imageIO) */
				/*
				 * File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				 * 
				 * BufferedImage bo_image = ImageIO.read(saveFile);
				 * 
				 * 비율 double ratio = 3; 
				 * 넓이 높이 int width = (int) (bo_image.getWidth() / ratio);
				 * int height = (int) (bo_image.getHeight() / ratio);
				 * 
				 * 
				 * BufferedImage bt_image = new BufferedImage(width, height,
				 * BufferedImage.TYPE_3BYTE_BGR);
				 * 
				 * Graphics2D graphic = bt_image.createGraphics();
				 * 
				 * graphic.drawImage(bo_image, 0, 0,width,height, null);
				 * 
				 * ImageIO.write(bt_image, "jpg", thumbnailFile);
				 */
				
				/* 방법 2 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
					// 비율
					double ratio = 3;
					// 넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);
					
				Thumbnails.of(saveFile)
				.size(width, height)
				.toFile(thumbnailFile);
		
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			list.add(vo);

		} // for
		
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>> (list, HttpStatus.OK);
		
		return result;

	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("deleteFile() Call..............");
		logger.info("................................................");
		
		File file = null;
		
		try {
			
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			logger.info("originFileName : " + originFileName);
			logger.info("................................................");
			
			file = new File(originFileName);
			
			file.delete();
			
					
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	// 상품 등록
	@PostMapping(value = "/productReg")
	public String productRegPOST(ProductVO product, RedirectAttributes reAttr) throws Exception{
		// RedirectAttributes
		// - 재경로 위치에 속성값을 전송하는 객체
		logger.info("productRegPOST() Call................." + product);
		logger.info("product : " + product.toString());
		logger.info("................................................");
		
		adminService.insert(product);
		
		reAttr.addFlashAttribute("product_result", product.getProductName());
		
		return "redirect:/admin/productList";

	}

	// 상품 목록 페이지 이동
	// 검색 키워드를 보내주고 받아와야 함. jsp에서 보내준 데이터를 못 받으며 검색이 되지 않음
	@GetMapping(value = "/productList")
	public void productListGET(Model model, Integer page, Integer numsPerPage, String keyword) throws Exception {
		logger.info("productListGET() Call....................................");
		logger.info("page = " + page + ", numsPerPage = " + numsPerPage);
		logger.info("keyword : " + keyword);
		logger.info("................................................");
		
		// Paging
		PageCriteria criteria = new PageCriteria();
		if (page != null) {
			criteria.setPage(page);
		}

		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}

		if (keyword != null) {
			criteria.setKeyword(keyword);
		}

		List<ProductVO> product = adminService.selectAll(criteria);
		if (!product.isEmpty()) {
			model.addAttribute("list", product); // 상품 존재
		} else {
			model.addAttribute("listCheck", "empty"); // 상품 존재 안 할 경우
			return;
		}

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(adminService.getTotalNumsOfRecords(criteria));
		pageMaker.setPageData();
		logger.info("getTotalNumsOfRecords : " + adminService.getTotalNumsOfRecords(criteria));
		logger.info("................................................");
		
		model.addAttribute("pageMaker", pageMaker);
	}

	// 상품 상세 페이지 이동
	@GetMapping("/productDetail")
	public void productDetail(Model model, Integer productNo, Integer page) {
		logger.info("productDetail() Call : productNo : " + productNo);
		logger.info("................................................");
		
		ProductVO product = adminService.read(productNo);

		// 상품 정보
		model.addAttribute("product", product);

		// 상품 정보 페이지
		model.addAttribute("page", page);
	}

	// 상품 정보 수정 GET
	@GetMapping("/productUpdate")
	public void productUpdateGET(Model model, Integer productNo) {
		logger.info("productUpdateGET() Call >>>>>>>>>>>>>>>>>>>>>");
		logger.info("(Get)product No : " + productNo);
		logger.info("................................................");
		
		ProductVO product = adminService.read(productNo);
		model.addAttribute("product", product);
	}

	// 상품 정보 수정 POST
	@PostMapping("/productUpdate")
	public String productUpdatePOST(ProductVO product, Integer productNo)
			throws Exception {
		logger.info("productUpdatePOST() Call");
		logger.info("(Post)product No : " + product);
		logger.info("................................................");
		
		int result = adminService.update(product);
		if (result == 1) {
			logger.info("product update success");
			return "redirect:/admin/productDetail?productNo=" + product.getProductNo();
		} else {
			logger.info("product update fail");
			return "redirect:/admin/productUpdate?productNo=" + product.getProductNo();
		}

	}

	// 상품 삭제
	@GetMapping("/productDelete")
	public String productDeleteGET(Integer productNo) {
		logger.info("delete() Call................................");
		logger.info("delete product No : " + productNo);
		logger.info("................................................");
		
		List<AttachImageVO> fileList = adminService.getAttachInfo(productNo);
		
		if(fileList != null) {
			
			List<Path> pathList = new ArrayList();
			
			fileList.forEach(vo ->{
				
				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
				
				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
				pathList.add(path);
				
			});
			
			pathList.forEach(path ->{
				path.toFile().delete();
			});
			
		}
		
		int result = adminService.delete(productNo);
		
		if (result == 1) {
			logger.info("delete Success");
			return "redirect:/admin/productList";
		} else {
			logger.info("delete Fail");
			return "redirect:/admin/productDetail?productNo=" + productNo;
		}
	}

	// 회원 관리 페이지 이동
	@GetMapping("/memberManage")
	public void memberManageGET(Model model, Integer page, Integer numsPerPage) {
		logger.info("memberManageGET() Call");
		logger.info("page = " + page + ", numsPerPage = " + numsPerPage);
		// Paging
		PageCriteria cri = new PageCriteria();
		if (page != null) {
			cri.setPage(page);
		}

		if (numsPerPage != null) {
			cri.setNumsPerPage(numsPerPage);
		}

		List<MemberVO> vo = memberService.selectAll(cri);
		if (!vo.isEmpty()) {
			model.addAttribute("vo", vo); // 회원 존재
		} else {
			model.addAttribute("listCheck", "empty"); // 회원 존재 안 할 경우
		}

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(memberService.getTotalNumsOfRecords(cri));
		pageMaker.setPageData();
		logger.info("getTotalNumsOfRecords : " + memberService.getTotalNumsOfRecords(cri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 회원 정보 이동
	@GetMapping("/memberInfo")
	public void memberInfo(Model model, int memberNo, Integer page) {
		logger.info("memberInfo() Call : memberNo : " + memberNo);
		MemberVO vo = memberService.select(memberNo);

		// 회원 정보
		model.addAttribute("vo", vo);

		// 회원 정보 페이지
		model.addAttribute("page", page);
	}

	// 상품 문의 페이지 이동
	@RequestMapping(value = "/productFaq", method = RequestMethod.GET)
	public void productFaqGET() {
		logger.info("productFaqGET() Call");
	}

	// 상품평 페이지 이동
	@RequestMapping(value = "/productComment", method = RequestMethod.GET)
	public void productCommentGET() {
		logger.info("productCommentGET() Call");
	}

}
