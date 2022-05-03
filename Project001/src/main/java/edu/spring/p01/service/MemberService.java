package edu.spring.p01.service;

import java.util.List;

import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.pageutil.PageCriteria;

public interface MemberService {
	
	int insert(MemberVO vo); // 가입
	MemberVO login(MemberVO vo) throws Exception; // 로그인
	
	MemberVO select(int memberNo); // 정보 보기
	
	int update(MemberVO vo); // 정보 수정
	
	int delete(int memberNo); // 회원 탈퇴
	
	int idCheck(String memberId) throws Exception; // 아이디 중복 검사
	
	// 전체 회원 읽기
	List<MemberVO> readAll(PageCriteria criteria); 
	
	// 전체 회원 불러오기
	List<MemberVO> selectAll(PageCriteria criteria);
	
	// 회원 전체 개수
	int getTotalNumsOfRecords(PageCriteria criteria); 
}


