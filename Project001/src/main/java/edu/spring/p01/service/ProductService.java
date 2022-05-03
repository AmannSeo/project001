package edu.spring.p01.service;

import java.util.List;

import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;

public interface ProductService {

	// 상품 등록
	int insert(ProductVO product) throws Exception;
	
	// 상품 전체보기
	List<ProductVO> readAll(PageCriteria criteria);
	
	// 상품 목록
	List<ProductVO> selectAll(PageCriteria criteria) throws Exception;
	
	// 상품 전체 숫자 읽기
	int getTotalNumsOfRecords(PageCriteria criteria);
	
	// 상품 목록에서 상품명 선택
//	List<ProductVO> select(String productName);
	
	// 상품 보기
	ProductVO read(int productNo);
	
	// 상품 수정
	int update(ProductVO product);
	
	// 상품 삭제
	int delete(int pNo);
	

}
