package edu.spring.p01.persistence;

import java.util.List;

import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.pageutil.PageCriteria;

public interface MemberDAO {
	
	int insert(MemberVO vo); // 가입
	
	MemberVO login(MemberVO vo); // 로그인
	
	MemberVO select(int memberNo); // 보기 
	
	int update(MemberVO vo); // 수정
	
	int delete(int memberNo); // 탈퇴
	
	int idCheck(String memberId) throws Exception; // 아이디 중복 확인
	
	// 전체 회원 리스트 읽기
	List<MemberVO> readAll(PageCriteria criteria);
	
	// 전체 회원 리스트 불러오기
	List<MemberVO> selectAll(PageCriteria criteria);
	
	// 전체 회원 총 개수
	int getTotalNumsOfRecords(PageCriteria criteria);
	
	// 회원 구매
	// 구매와 동시에 포인트 차감
	// 구매 테이블에 insert
	// 회원 테이블에 update
	int updatePoint(int point, int memberNo);
	

}
