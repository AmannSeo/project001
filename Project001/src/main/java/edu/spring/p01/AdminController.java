package edu.spring.p01;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.p01.domain.HelpVO;
import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.pageutil.PageMaker;
import edu.spring.p01.service.HelpService;
import edu.spring.p01.service.ProductService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	private static final Logger logger =
			LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private ProductService productService;
	
	
	// 관리자 페이지 이동
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public void adminPageGET() {
		logger.info("adminPageGET() Call");
	}
	
	// 상품 등록 페이지 이동
	@GetMapping(value="/productReg")
	public void productRegGET() {
		logger.info("productRegGET() Call");
	}
	
	// 상품 등록
	@PostMapping(value="/productReg")
	public String productRegPOST(ProductVO product, RedirectAttributes reAttr) throws Exception{
		logger.info("productRegPOST() Call");
		logger.info("product : " + product.toString());
		int result = productService.insert(product);
		logger.info(result + "상품 등록");
		if(result == 1) {
			logger.info("상품 등록 성공");
			reAttr.addFlashAttribute("insert_result",product.getProductName());
			return "redirect:/admin/productList";
		} else {
			logger.info("상품 등록 실패");
			reAttr.addFlashAttribute("insert_result",product.getProductName());
			return "redirect:/admin/productReg";
		}
	}
	
	// 상품 목록 페이지 이동
	// 검색 키워드를 보내주고 받아와야 함. jsp에서 보내준 데이터를 못 받으며 검색이 되지 않음
	@GetMapping(value="/productList")
	public void productListGET(Model model, Integer page, Integer numsPerPage, String keyword) throws Exception {
		logger.info("productListGET() Call");
		logger.info("page = " + page + ", numsPerPage = " + numsPerPage);
		logger.info("keyword : " + keyword);
		// Paging
		PageCriteria criteria = new PageCriteria();
		if(page != null) {
			criteria.setPage(page);
		}
		
		if(numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
		
		if(keyword != null) {
			criteria.setKeyword(keyword);
		}
		
		
		List<ProductVO> list = productService.selectAll(criteria);
		if(!list.isEmpty()) {
			model.addAttribute("list", list); // 상품 존재
		} else {
			model.addAttribute("listCheck", "empty"); // 상품 존재 안 할 경우
		}
		
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(productService.getTotalNumsOfRecords(criteria));
		pageMaker.setPageData();
		logger.info("getTotalNumsOfRecords : " + productService.getTotalNumsOfRecords(criteria));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	// 상품 상세 페이지 이동
	@GetMapping("/productDetail")
	public void productDetail(Model model, Integer productNo, Integer page) {
		logger.info("productDetail() Call : productNo : " + productNo);
		ProductVO product = productService.read(productNo);
		
		// 상품 정보
		model.addAttribute("product", product);
		
		// 상품 정보 페이지
		model.addAttribute("page", page);
	}
	
	// 상품 정보 수정 GET
	@GetMapping("/productUpdate")
	public void productUpdateGET(Model model, Integer productNo, Integer page) {
		logger.info("productUpdateGET() Call");
		logger.info("(Get)product No : " + productNo);
		ProductVO product = productService.read(productNo);
		model.addAttribute("product", product);
		model.addAttribute("page", page);
	}
	
	// 상품 정보 수정 POST
	@PostMapping("/productUpdate")
	public String productUpdatePOST(ProductVO product, Integer page) {
		logger.info("productUpdatePOST() Call");
		logger.info("(Post)product No : " + product);
		int result = productService.update(product);
		if(result == 1) {
			logger.info("product update success");
			return "redirect:/admin/producDetail?productNo=" + product.getProductNo();
		} else {
			logger.info("product update fail");
			return "redirect:/admin/productUpdate?productNo=" + product.getProductNo();
		}
		
	}
	
	// 상품 삭제
	@GetMapping("/productDelete")
	public String productDeleteGET(Integer productNo) {
		logger.info("delete() Call");
		logger.info("delete product No : " + productNo);
		int result = productService.delete(productNo);
		if(result == 1) {
			logger.info("delete Success");
			return "redirect:/admin/productList";
		} else {
			logger.info("delete Fail");
			return "redirect:/admin/productDetail?productNo=" + productNo;
		}
	}
	
	// 상품 이미지 첨부
	/* 첨부 파일 업로드 */
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		logger.info("uploadAjaxActionPOST() Call");
		
		// 향상된 for
		for(MultipartFile multipartFile : uploadFile) {
			logger.info("-----------------------------------------------");
			logger.info("파일 이름 : " + multipartFile.getOriginalFilename());
			logger.info("파일 타입 : " + multipartFile.getContentType());
			logger.info("파일 크기 : " + multipartFile.getSize());			
		}
		
		//기본 for
		for(int i = 0; i < uploadFile.length; i++) {
			logger.info("-----------------------------------------------");
			logger.info("파일 이름 : " + uploadFile[i].getOriginalFilename());
			logger.info("파일 타입 : " + uploadFile[i].getContentType());
			logger.info("파일 크기 : " + uploadFile[i].getSize());			
		}
	}
	
	
	// 회원 관리 페이지 이동
	@RequestMapping(value="/memberManage", method = RequestMethod.GET)
	public void memberManageGET() {
		logger.info("memberManageGET() Call");
	}
	
	// 상품 문의 페이지 이동
	@RequestMapping(value="/productFaq", method = RequestMethod.GET)
	public void productFaqGET() {
		logger.info("productFaqGET() Call");
	}
	
	// 상품평 페이지 이동
	@RequestMapping(value="/productComment", method = RequestMethod.GET)
	public void productCommentGET() {
		logger.info("productCommentGET() Call");
	}
	
	
	/* ------------------------------- */

	
	
	
	/* ------------------------------- */

	// 공지사항 게시판 관리 이동
	@GetMapping(value="/noticeList")
	public void noticeListGET() {
		logger.info("noticeListGET() Call");
	}
}





















