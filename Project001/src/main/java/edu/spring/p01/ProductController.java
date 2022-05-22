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

import edu.spring.p01.domain.AttachImageVO;
import edu.spring.p01.domain.PageDTO;
import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.pageutil.PageMaker;
import edu.spring.p01.persistence.AttachDAO;
import edu.spring.p01.service.AdminService;
import edu.spring.p01.service.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	private static final Logger logger =
			LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AttachDAO attachDao;
	
	@GetMapping("/index")
	public void indexGET(Model model, Integer page, Integer numsPerPage, String keyword) throws Exception {
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
		
		
		List<ProductVO> product = adminService.selectAll(criteria);
		if(!product.isEmpty()) {
			model.addAttribute("product", product); // 상품 존재
		} else {
			model.addAttribute("listCheck", "empty"); // 상품 존재 안 할 경우
			return;
		}
		
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(adminService.getTotalNumsOfRecords(criteria));
		pageMaker.setPageData();
		logger.info("getTotalNumsOfRecords : " + adminService.getTotalNumsOfRecords(criteria));
		model.addAttribute("pageMaker", pageMaker);
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
	
	// 회원 구매내역
	@GetMapping("/order")
	public void orderGET() {
		logger.info("orderGET() Call");
	}
	
	/* 상품 검색 */
	@GetMapping("search")
	public String searchProductGet(PageCriteria cri, Model model) {
		
		logger.info("searchProductGet() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("cri : " + cri);
		
		List<ProductVO> list = productService.getProductList(cri);
		
		logger.info("pre list : " + list);
		logger.info("==========================================================");
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);
			logger.info("==========================================================");
		} else {
			model.addAttribute("listCheck", "empty");
			
			return "search";
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, productService.productGetTotal(cri)));
		
		
		return "search";
	}

}
