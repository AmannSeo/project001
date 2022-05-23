package edu.spring.p01.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class ProductDaoTest {

	@Autowired
	private ProductDAO dao;
	
	/*
	 * @Test public void imageEnrollTest() { AttachImageVO vo = new AttachImageVO();
	 * 
	 * vo.setProductNo(107); vo.setFileName("test1");
	 * vo.setUploadPath("test Path1"); vo.setUuid("test uuid1");
	 * 
	 * dao.imageEnroll(vo); }
	 */
	
	/*
	 * @Test public void getGoodsListTest() {
	 * 
	 * PageCriteria cri = new PageCriteria(); String type = "T"; // String keyword =
	 * String keyword = "없음"; String catecode = "";
	 * 
	 * System.out.println("=================================");
	 * 
	 * cri.setType(type); cri.setKeyword(keyword); cri.setCateCode(catecode);
	 * List<ProductVO> list = dao.getProductList(cri);
	 * 
	 * System.out.println("=================================");
	 * System.out.println("cri : " + cri); System.out.println("list : " + list);
	 * 
	 * }
	 * 
	 * 
	 * @Test public void getGoodsListTest2() {
	 * 
	 * PageCriteria cri = new PageCriteria(); String type = "TC"; String keyword =
	 * "none"; String catecode = "101001";
	 * 
	 * System.out.println("=================================");
	 * 
	 * cri.setType(type); cri.setKeyword(keyword); cri.setCateCode(catecode);
	 * List<ProductVO> list = dao.getProductList(cri);
	 * 
	 * System.out.println("=================================");
	 * System.out.println("cri : " + cri); System.out.println("list : " + list);
	 * 
	 * }
	 */
	@Test
	public void getGoodsInfo() {
		int productNo = 2;
		ProductVO productInfo = dao.getProductInfo(productNo);
		System.out.println("=================================");
		System.out.println(productInfo);
		System.out.println("=================================");
	}
	
}
