package edu.spring.p01;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.p01.domain.AttachImageVO;
import edu.spring.p01.domain.HelpVO;
import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.pageutil.PageMaker;
import edu.spring.p01.persistence.AttachDAO;
import edu.spring.p01.service.AdminService;
import edu.spring.p01.service.HelpService;
import edu.spring.p01.service.ProductService;

@Controller
public class MainController {
	private static final Logger logger =
			LoggerFactory.getLogger(MainController.class);
	
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private HelpService helpService;
	
	@Autowired
	private AttachDAO attachDao;
	
	// main page
	@RequestMapping(value= "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) {
		logger.info("mainGET() Call");
		
		model.addAttribute("cate1_1", productService.getCateCode1_1());
		model.addAttribute("cate1_2", productService.getCateCode1_2());
		model.addAttribute("cate1_3", productService.getCateCode1_3());
		
		model.addAttribute("cate2_1", productService.getCateCode2_1());
		model.addAttribute("cate2_2", productService.getCateCode2_2());
		model.addAttribute("cate2_3", productService.getCateCode2_3());
		
		model.addAttribute("cate3_1", productService.getCateCode3_1());
		model.addAttribute("cate3_2", productService.getCateCode3_2());
		model.addAttribute("cate3_3", productService.getCateCode3_3());
		model.addAttribute("cate3_4", productService.getCateCode3_4());
	}
	

	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int productNo){
		
		logger.info("getAttachList() Call............." + productNo);
		
		return new ResponseEntity<List<AttachImageVO>>(attachDao.getAttachList(productNo), HttpStatus.OK);
	}
	
	/* 이미지 출력 */
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		logger.info("getImage()........" + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	/* 상품 상세 */
	@GetMapping("/detail/{productNo}")
	public String detailGET(@PathVariable("productNo")int productNo, Model model) throws Exception {
		
		logger.info("detailGET() Call : productNo : " + productNo);
		
		// 상품 정보
		model.addAttribute("productInfo", productService.getProductInfo(productNo));
		
		return "/detail";
		
	}
	
	// 상품 검색
	@GetMapping("search")
	public String searchProductGET(PageCriteria criteria, Model model) throws Exception {
		logger.info("criteria : " + criteria);
		
		
		List<ProductVO> list = productService.getProductList(criteria);
		
		logger.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);
		} else {
			model.addAttribute("listCheck", "empty");
			return "search";
		}
		
		return "search";
	}
	
	// fine-fragrances 페이지 이동
	@GetMapping(value="/fine-fragrances")
	public void fineFragrancesGET(Model model, Integer page, Integer numsPerPage, String keyword) throws Exception {
		logger.info("productListGET() Call");
		
		model.addAttribute("cate1_1", productService.getCateCode1_1());
		model.addAttribute("cate1_2", productService.getCateCode1_2());
		model.addAttribute("cate1_3", productService.getCateCode1_3());
		
		model.addAttribute("cate2_1", productService.getCateCode2_1());
		model.addAttribute("cate2_2", productService.getCateCode2_2());
		model.addAttribute("cate2_3", productService.getCateCode2_3());
		
		model.addAttribute("cate3_1", productService.getCateCode3_1());
		model.addAttribute("cate3_2", productService.getCateCode3_2());
		model.addAttribute("cate3_3", productService.getCateCode3_3());
		model.addAttribute("cate3_4", productService.getCateCode3_4());
	}
	
	// home creations 페이지 이동
	@GetMapping(value="/home-creations")
	public void homeCreationsGET(Model model, Integer page, Integer numsPerPage, String keyword) {
		logger.info("homeCreationsGET() Call");
		
		model.addAttribute("cate1_1", productService.getCateCode1_1());
		model.addAttribute("cate1_2", productService.getCateCode1_2());
		model.addAttribute("cate1_3", productService.getCateCode1_3());
		
		model.addAttribute("cate2_1", productService.getCateCode2_1());
		model.addAttribute("cate2_2", productService.getCateCode2_2());
		model.addAttribute("cate2_3", productService.getCateCode2_3());
		
		model.addAttribute("cate3_1", productService.getCateCode3_1());
		model.addAttribute("cate3_2", productService.getCateCode3_2());
		model.addAttribute("cate3_3", productService.getCateCode3_3());
		model.addAttribute("cate3_4", productService.getCateCode3_4());
	}
	
	// body-hair-face 페이지 이동
	@GetMapping(value="/body-hair-face")
	public void bodyHairFaceGET(Model model, Integer page, Integer numsPerPage, String keyword) {
		logger.info("bodyHairFaceGET() Call");
		
		model.addAttribute("cate1_1", productService.getCateCode1_1());
		model.addAttribute("cate1_2", productService.getCateCode1_2());
		model.addAttribute("cate1_3", productService.getCateCode1_3());
		
		model.addAttribute("cate2_1", productService.getCateCode2_1());
		model.addAttribute("cate2_2", productService.getCateCode2_2());
		model.addAttribute("cate2_3", productService.getCateCode2_3());
		
		model.addAttribute("cate3_1", productService.getCateCode3_1());
		model.addAttribute("cate3_2", productService.getCateCode3_2());
		model.addAttribute("cate3_3", productService.getCateCode3_3());
		model.addAttribute("cate3_4", productService.getCateCode3_4());
	}
	
	// GROOMING 페이지 이동
	@GetMapping(value="/grooming")
	public void groomingGET() {
		logger.info("groomingGET() Call");
	}
	
	// ABOUT US Page
	@GetMapping(value="/about-us")
	public void aboutUsGET(Model model, Integer page, Integer numsPerPage, String keyword) {
		logger.info("aboutUs() Call");
		
		model.addAttribute("cate1_1", productService.getCateCode1_1());
		model.addAttribute("cate1_2", productService.getCateCode1_2());
		model.addAttribute("cate1_3", productService.getCateCode1_3());
		
		model.addAttribute("cate2_1", productService.getCateCode2_1());
		model.addAttribute("cate2_2", productService.getCateCode2_2());
		model.addAttribute("cate2_3", productService.getCateCode2_3());
		
		model.addAttribute("cate3_1", productService.getCateCode3_1());
		model.addAttribute("cate3_2", productService.getCateCode3_2());
		model.addAttribute("cate3_3", productService.getCateCode3_3());
		model.addAttribute("cate3_4", productService.getCateCode3_4());
	}
	
	// FAQ Page
	@GetMapping(value="/help")
	public void helpGET(Model model, Integer page, Integer numsPerPage) {
		logger.info("helpGET() Call");
		logger.info("list page = " + page + ", list numsPerPage =" + numsPerPage);
		
		model.addAttribute("cate1_1", productService.getCateCode1_1());
		model.addAttribute("cate1_2", productService.getCateCode1_2());
		model.addAttribute("cate1_3", productService.getCateCode1_3());
		
		model.addAttribute("cate2_1", productService.getCateCode2_1());
		model.addAttribute("cate2_2", productService.getCateCode2_2());
		model.addAttribute("cate2_3", productService.getCateCode2_3());
		
		model.addAttribute("cate3_1", productService.getCateCode3_1());
		model.addAttribute("cate3_2", productService.getCateCode3_2());
		model.addAttribute("cate3_3", productService.getCateCode3_3());
		model.addAttribute("cate3_4", productService.getCateCode3_4());
		
		// Paging 처리
		PageCriteria criteria = new PageCriteria();
		if(page != null) {
			criteria.setPage(page);
		}
		
		if(numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
		
		List<HelpVO> helpList = helpService.readAll(criteria);
		if(!helpList.isEmpty()) {
			model.addAttribute("helpList", helpList); // 상품 존재
		} else {
			model.addAttribute("listCheck", "empty"); // 상품 존재 안 할 경우
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(helpService.getTotalNumsOfRecords(criteria));
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
	}
	
}
