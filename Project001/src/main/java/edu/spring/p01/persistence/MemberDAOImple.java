package edu.spring.p01.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.pageutil.PageCriteria;

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
		logger.info("(member)insert() Call");
		logger.info("insert info : " + vo.toString());
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) {
		logger.info("(member)MemberDAOImple login Call()");
		logger.info("login info : " + vo);
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}

	// 회원 정보 보기
	@Override
	public MemberVO select(int memberNo) {
		logger.info("(member)select() Call");
		return sqlSession.selectOne(NAMESPACE + ".select_by_memberNo", memberNo);
	}

	@Override
	public int update(MemberVO vo) {
		logger.info("memberId update() Call");
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	@Override
	public int delete(int memberNo) {
		logger.info("member No delete() Call" + memberNo);
		return sqlSession.delete(NAMESPACE + ".delete", memberNo);
	}

	// 아이디 중복 확인
	@Override
	public int idCheck(String memberId) throws Exception{
		logger.info("(member)idCheck() Call" + memberId);
		return sqlSession.selectOne(NAMESPACE + ".idCheck", memberId);
	}

	// 전체 회원 리스트 읽기
	@Override
	public List<MemberVO> readAll(PageCriteria criteria) {
		logger.info("(member)readAll() Call - criteria : " + criteria);
		return sqlSession.selectList(NAMESPACE + ".member_read_all");
	}

	// 전체 회원 리스트 불러오기
	@Override
	public List<MemberVO> selectAll(PageCriteria criteria) {
		logger.info("(member)selectAll() call + PageCriteria = " + criteria);
		return sqlSession.selectList(NAMESPACE + ".member_select_all", criteria);
	}

	// 전체 회원 총 개수
	@Override
	public int getTotalNumsOfRecords(PageCriteria criteria) {
		logger.info("(member)getTotalNumsOfRecords() Call");
		logger.info("criteria : " + criteria.getKeyword());
		return sqlSession.selectOne(NAMESPACE + ".member_total_count");
	}

	// 회원 구매
	// 구매와 동시에 포인트 차감
	// 구매 테이블에 insert
	// 회원 테이블에 update
	@Override
	public int updatePoint(int point, int memberNo) {
		// 따로따로 있는 걸 같이 사용할 경우 map을 사용함 Map<key(이름), value(값)> 
		// 모든 걸 다 잡을 수 있는 키워드 : object(하지만 범위 너무 넒음)
		Map<String, Integer> args = new HashMap<String, Integer>();
		args.put("point", point);
		logger.info("point : " + point);
		args.put("memberNo", memberNo);
		logger.info("no : " + memberNo);
		return sqlSession.update(NAMESPACE + ".update_point", args);
	}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	

	
	
}
