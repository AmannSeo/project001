package edu.spring.p01.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.persistence.MemberDAO;

@Service
public class MemberServiceImple implements MemberService{
	private static final Logger logger =
			LoggerFactory.getLogger(MemberServiceImple.class);
	
	@Autowired
	private MemberDAO dao;

	// 회원가입
	@Override
	public int insert(MemberVO vo) {
		logger.info("insert : " + vo.toString());
		return dao.insert(vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		logger.info("MemberServiceImple login Call");
		logger.info("login info : " + vo);
		return dao.login(vo);
	}
	
	// 회원 정보 보기
	@Override
	public MemberVO select(String memberId) {
		logger.info("(Service)select() Call : " + memberId);
		return dao.select(memberId);
	}

	@Override
	public int update(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 아이디 중복
	@Override
	public int idCheck(String memberId) throws Exception {
		logger.info("idCheck() Call");
		return dao.idCheck(memberId);
	}

	
	

}
