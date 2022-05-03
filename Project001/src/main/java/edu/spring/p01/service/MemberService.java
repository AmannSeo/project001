package edu.spring.p01.service;

import edu.spring.p01.domain.MemberVO;

public interface MemberService {
	
	int insert(MemberVO vo); // 가입
	MemberVO login(MemberVO vo) throws Exception; // 로그인
	MemberVO select(String memberId); // 정보 보기
	int update(MemberVO vo); // 정보 수정
	int delete(String memberId); // 회원 탈퇴
	
	int idCheck(String memberId) throws Exception; // 아이디 중복 검사
}


