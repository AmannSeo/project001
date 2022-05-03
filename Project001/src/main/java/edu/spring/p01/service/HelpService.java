package edu.spring.p01.service;

import java.util.List;

import edu.spring.p01.domain.HelpVO;
import edu.spring.p01.pageutil.PageCriteria;

public interface HelpService {
	// 질문 등록
	int insert(HelpVO help); 
	
	// 질문 읽기
	HelpVO read(int helpNo); 
	
	// 질문 수정
	int update(HelpVO help); 
	
	// 질문 삭제
	int delete(int helpNo); 
	
	// 전체 질문 읽기
	List<HelpVO> readAll(PageCriteria criteria); 
	
	// 전체 질문 불러오기
	List<HelpVO> selectAll(PageCriteria criteria);
	
	// 질문 전체 개수
	int getTotalNumsOfRecords(PageCriteria criteria); 

}
