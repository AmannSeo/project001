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

import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class MemberDAOTest {
	private static final Logger logger =
			LoggerFactory.getLogger(MemberDAOTest.class);
	
	@Autowired
	private MemberDAO dao;
	
	@Test
	public void testDAO() throws Exception {
//		testInsert();
//		testMemberIdChk();
//		testLogin();
		testSelect();
	}

	// 회원가입
	private void testInsert() {
		MemberVO vo = new MemberVO();
		
		int result = dao.insert(vo);
		
		if(result == 1) {
			logger.info("insert success");
		} else {
			logger.info("insert fail");
		}
	}

	// 아이디 중복 검사
	private void testMemberIdChk() throws Exception{
		String id = "test1"; // 존재하는 아이디
		String id2 = "test"; // 존재하지 않는 아이디
		dao.idCheck(id);
		dao.idCheck(id2);
		
	}
	
	// login
	private void testLogin() throws Exception{
		
		MemberVO vo = new MemberVO(); // MemberVO 변수 선언 및 초기화
		
		// 올바른 아이디 비번 입력 경우
		vo.setMemberId("test");
		vo.setMemberPw("1234");
		
		dao.login(vo);
		logger.info(("결과 값 : " + dao.login(vo)));
		
	}
	
	// 회원 정보 보기
	private void testSelect() {
		MemberVO vo = dao.select(1);
		logger.info(vo.toString());
	}


	
}

















