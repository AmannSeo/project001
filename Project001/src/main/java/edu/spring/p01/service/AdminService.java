package edu.spring.p01.service;

import java.util.List;

import edu.spring.p01.domain.AttachImageVO;
import edu.spring.p01.domain.CateVO;
import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;

public interface AdminService {

	// 상품 등록
	void insert(ProductVO product);
	
	// 상품 전체보기
	List<ProductVO> readAll(PageCriteria criteria);
	
	// 상품 리스트
	List<ProductVO> selectAll(PageCriteria criteria) throws Exception;
	
	// 상품 전체 숫자 읽기
	int getTotalNumsOfRecords(PageCriteria criteria);
	
	// 상품 보기
	ProductVO read(int productNo);
	
	// 상품 수정
	int update(ProductVO product);
	
	// 상품 삭제
	int delete(int pNo);
	
	// 카테고리 리스트
	List<CateVO> cateList();
	
	// 지정 상품 이미지 정보 얻기
	public List<AttachImageVO> getAttachInfo(int productNo);
	

}
