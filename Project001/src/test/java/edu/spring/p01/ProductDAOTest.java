package edu.spring.p01;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class ProductDAOTest {
	private static final Logger logger =
			LoggerFactory.getLogger(ProductDAOTest.class);
	
	@Autowired
	private ProductDAO dao;
	
	@Test
	public void testDAO() throws Exception{
//		testInsert();
//		testPage();
//		testTotalPage();
//		testUpdate();
//		testSelect();
		testDelete();
		
	}





	// 상품 등록
	private void testInsert() {
		ProductVO vo = new ProductVO(0, "상품", "테스트", 10000, 10, "테스트", null);
		
		int result = dao.insert(vo);
		
		if(result == 1) {
			logger.info("insert success");
		} else {
			logger.info("insert fail");
		}
	}
	
	// 상품 목록
	private void testPage() {
		PageCriteria criteria = new PageCriteria(1, 5);
		logger.info("testStart");
		criteria.setKeyword("테스트");
		
		List<ProductVO> list = dao.readAll(criteria);
		
		for(int i = 0; i < list.size(); i++) {
			logger.info("list" + i + " : " + list.get(i));
		}
		
	}
	

	private void testTotalPage() {
		PageCriteria criteria = new PageCriteria();
		criteria.setKeyword("테스트");
		
		int total = dao.getTotalNumsOfRecords(criteria);
	
		logger.info("Total : " + total);
		
		
	}
	
	
	// 상품 정보 수정
	private void testUpdate() {
		ProductVO product = new ProductVO(2, "test2", "Test2", 222, 222, "testest", null);
		int result = dao.update(product);
		if(result == 1) {
			logger.info("update success");
		} else {
			logger.info("update fail");
		}
		
	}
	
	// 상품 선택
	private void testSelect() {
		ProductVO product = dao.read(2);
		logger.info(product.toString());
		
	}
	
	// 상품 삭제
	private void testDelete() {
		int result = dao.delete(3);
		if(result == 1) {
			logger.info("delete success");
		} else {
			logger.info("delete fail");
		}
	}


}










