package edu.spring.p01.service;

import java.util.List;

import edu.spring.p01.domain.NoticeVO;
import edu.spring.p01.pageutil.PageCriteria;

public interface NoticeService {
	// 질문 등록
	int insert(NoticeVO notice); 
	
	// 질문 읽기
	NoticeVO read(int noticeNo); 
	
	// 질문 수정
	int update(NoticeVO notice); 
	
	// 질문 삭제
	int delete(int noticeNo); 
	
	// 전체 질문 읽기
	List<NoticeVO> readAll(PageCriteria criteria); 
	
	// 전체 질문 불러오기
	List<NoticeVO> selectAll(PageCriteria criteria);
	
	// 질문 전체 개수
	int getTotalNumsOfRecords(PageCriteria criteria); 

}
