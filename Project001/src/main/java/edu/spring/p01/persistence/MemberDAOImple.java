package edu.spring.p01.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.p01.domain.MemberVO;

@Repository
public class MemberDAOImple implements MemberDAO{
	private static final Logger logger =
			LoggerFactory.getLogger(MemberDAOImple.class);
	private static final String NAMESPACE =
			"edu.spring.p01.MemberMapper";
	
	@Autowired
	public SqlSession sqlSession;

	
	// 회원가입
	@Override
	public int insert(MemberVO vo) {
		logger.info("insert() Call");
		logger.info("insert info : " + vo.toString());
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) {
		logger.info("MemberDAOImple login Call()");
		logger.info("login info : " + vo);
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}

	// 회원 정보 보기
	@Override
	public MemberVO select(String memberId) {
		logger.info("select() Call");
		return sqlSession.selectOne(NAMESPACE + ".select_by_memberId", memberId);
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

	// 아이디 중복 확인
	@Override
	public int idCheck(String memberId) throws Exception{
		logger.info("idCheck() Call" + memberId);
		return sqlSession.selectOne(NAMESPACE + ".idCheck", memberId);
	}

	

	
	
}
