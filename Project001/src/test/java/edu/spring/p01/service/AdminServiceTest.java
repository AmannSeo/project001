package edu.spring.p01.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.p01.domain.AttachImageVO;
import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class AdminServiceTest {
	private static final Logger log =
			LoggerFactory.getLogger(NoticeServiceImple.class);

	@Autowired
	private AdminService service;
	
	@Autowired
	private NoticeService noticeService;
	
	/* 상품 등록 & 상품 이미지 등록 테스트 */
	/*
	 * @Test public void productEnrollTests() { ProductVO product = new ProductVO();
	 * 
	 * // 상품 정보 product.setProductName("service test02");
	 * product.setCateCode("2020"); product.setProductPrice(222);
	 * product.setProductAmount(333); product.setProductIntro("test1");
	 * 
	 * // 이미지 정보 List<AttachImageVO> imageList = new ArrayList<AttachImageVO>();
	 * 
	 * AttachImageVO image1 = new AttachImageVO(); AttachImageVO image2 = new
	 * AttachImageVO();
	 * 
	 * image1.setFileName("test Image 1"); image1.setUploadPath("test image 1");
	 * image1.setUuid("test1111");
	 * 
	 * image2.setFileName("test Image 2"); image2.setUploadPath("test image 2");
	 * image2.setUuid("test2222");
	 * 
	 * imageList.add(image1); imageList.add(image2);
	 * 
	 * // productEnroll() 메서드 호출 service.insert(product);
	 * 
	 * System.out.println("등록된 product : " + product); }
	 */
	
}










