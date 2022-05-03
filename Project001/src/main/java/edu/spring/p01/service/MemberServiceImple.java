package edu.spring.p01.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.pageutil.PageCriteria;
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
		logger.info("(member)insert : " + vo.toString());
		return dao.insert(vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		logger.info("(member)MemberServiceImple login Call");
		logger.info("login info : " + vo);
		return dao.login(vo);
	}
	
	// 회원 정보 보기
	@Override
	public MemberVO select(int memberNo) {
		logger.info("(member)select() Call : " + memberNo);
		return dao.select(memberNo);
	}

	@Override
	public int update(MemberVO vo) {
		logger.info("memberService update() Call" + vo);
		return dao.update(vo);
	}

	@Override
	public int delete(int memberNo) {
		logger.info("memberService delete() Call" + memberNo);
		return dao.delete(memberNo);
	}

	// 아이디 중복
	@Override
	public int idCheck(String memberId) throws Exception {
		logger.info("(member)idCheck() Call");
		return dao.idCheck(memberId);
	}

	// 전체 회원 읽기
	@Override
	public List<MemberVO> readAll(PageCriteria criteria) {
		logger.info("(member)readAll() Call");
		return dao.readAll(criteria);
	}

	// 전체 회원 불러오기
	@Override
	public List<MemberVO> selectAll(PageCriteria criteria) {
		logger.info("(member)selectAll() Call");
		return dao.selectAll(criteria);
	}

	// 회원 전체 개수
	@Override
	public int getTotalNumsOfRecords(PageCriteria criteria) {
		logger.info("(member)getTotalNumsOfRecords() Call");
		return dao.getTotalNumsOfRecords(criteria);
	}

	
	

}
