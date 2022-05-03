package edu.spring.p01;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class ProductServiceTest {
	private static final Logger logger =
			LoggerFactory.getLogger(ProductServiceTest.class);
	
	@Autowired
	private ProductService service;
	
	@Test
	public void testService() throws Exception{
		testInsert();
		
	}

	private void testInsert() throws Exception {
		ProductVO vo = new ProductVO(0, "test2", "test2", 100, 10, "test1", null);
		
		int result = service.insert(vo);
		
		if(result == 1) {
			logger.info("insert success");
		} else {
			logger.info("insert fail");
		}
		
	}
	
	


}
