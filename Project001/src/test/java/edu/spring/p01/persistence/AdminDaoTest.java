package edu.spring.p01.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.p01.domain.AttachImageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class AdminDaoTest {

	@Autowired
	private AdminDAO dao;
	
	/*
	 * @Test public void imageEnrollTest() { AttachImageVO vo = new AttachImageVO();
	 * 
	 * vo.setProductNo(107); vo.setFileName("test1");
	 * vo.setUploadPath("test Path1"); vo.setUuid("test uuid1");
	 * 
	 * dao.imageEnroll(vo); }
	 */
	
	/*
	 * @Test public void getAttachInfoTest() { int productNo = 2;
	 * 
	 * List<AttachImageVO> list = dao.getAttchInfo(productNo);
	 * 
	 * System.out.println("list : " + list); }
	 */

	/* 카테고리 리스트 */
	@Test
	public void cateListTest() throws Exception{
		
		System.out.println("cateList()..........." + dao.cateList());
		
	}
}
