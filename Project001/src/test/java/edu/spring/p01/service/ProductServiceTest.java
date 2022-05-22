package edu.spring.p01.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.p01.domain.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class ProductServiceTest {
	
	@Autowired
	private ProductService service;
	
	@Test
	public void productInfoTest() {
		int productNo = 2;
		
		ProductVO productInfo = service.getProductInfo(productNo);
		
		System.out.println("=======================");
		System.out.println("전체 : " + productInfo);
		System.out.println("productNo : " + productInfo.getProductNo());
		System.out.println("imageInfo : " + productInfo.getImageList().isEmpty());
	}

}
