package edu.spring.p01.persistence;

import edu.spring.p01.domain.MemberVO;

public interface MemberDAO {
	
	int insert(MemberVO vo); // 가입
	
	MemberVO login(MemberVO vo); // 로그인
	
	MemberVO select(String memberId); // 보기 
	
	int update(MemberVO vo); // 수정
	
	int delete(String memberId); // 탈퇴
	
	int idCheck(String memberId) throws Exception; // 아이디 중복 확인

}
