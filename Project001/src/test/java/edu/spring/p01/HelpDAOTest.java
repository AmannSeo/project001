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

import edu.spring.p01.domain.HelpVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.persistence.HelpDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class HelpDAOTest {
	private static final Logger logger =
	         LoggerFactory.getLogger(HelpDAOTest.class);
	
	@Autowired
	private HelpDAO dao;
	
	@Test
	public void testDAO() {
//		testHelpInsert();
//		testHelpSelectAll();
//		testHelpSelect();
		testHelpUpdate();
//		testHelpDelete();
	}
	
	private void testHelpInsert() {
		HelpVO board = new HelpVO(0, "test1", "test1", "test1", null);
		int result = dao.insert(board);
		if(result == 1) {
			logger.info("insert Success");
		} else {
			logger.info("insert Fail");
		}
		
	}

	private void testHelpSelectAll() {
		PageCriteria criteria = new PageCriteria();
		criteria.setKeyword("테스트");
		
		int total = dao.getTotalNumsOfRecords(criteria);
	
		logger.info("Total : " + total);
		
	}

	private void testHelpSelect() {
		HelpVO help = dao.read(2);
		logger.info(help.toString());
	}

	private void testHelpUpdate() {
		HelpVO help = new HelpVO(2, "test55", "test3", "test3", null);
		int result = dao.update(help);
		if(result == 1) {
			logger.info("update success");
		} else {
			logger.info("update fail");
		}
		
	}

	private void testHelpDelete() {
		int result = dao.delete(3);
		if(result == 1) {
			logger.info("delete success");
		} else {
			logger.info("delete fail");
		}
		
	}

	
	
	
	
	
}
