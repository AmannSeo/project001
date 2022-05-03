package edu.spring.p01.persistence;

import java.util.List;

import edu.spring.p01.domain.HelpVO;
import edu.spring.p01.pageutil.PageCriteria;

public interface HelpDAO {
	
	// 질문 작성
	int insert(HelpVO help);
	
	// 전체 질문 리스트 읽기
	List<HelpVO> readAll(PageCriteria criteria);
	
	// 전체 질문 리스트 불러오기
	List<HelpVO> selectAll(PageCriteria criteria);
	
	// 전체 질문 총 개수
	int getTotalNumsOfRecords(PageCriteria criteria);
	
	// 질문 보기
	HelpVO read(int helpNo);
	
	// 질문 수정
	int update(HelpVO help);
	
	// 질문 삭제
	int delete(int HelpNo);
	

}












