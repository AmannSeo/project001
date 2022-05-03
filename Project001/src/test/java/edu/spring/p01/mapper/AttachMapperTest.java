package edu.spring.p01.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.p01.persistence.AttachDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class AttachMapperTest {

	@Autowired
	private AttachDAO dao;
	
	/* 이미지 정보 반환 */
	@Test
	public void getAttachListTest() {
		int porductNo =  113;
		
		System.out.println("이미지 정보 : " + dao.getAttachList(porductNo));
	}
}
