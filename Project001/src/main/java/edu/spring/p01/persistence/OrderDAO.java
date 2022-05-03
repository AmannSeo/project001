package edu.spring.p01.persistence;

import java.util.List;

import edu.spring.p01.domain.OrderVO;
import edu.spring.p01.pageutil.PageCriteria;

public interface OrderDAO {
	// 상품 주문
	int order(OrderVO order);
	
	// 상품 주문 취소
	
	// 상품 주문 수정
	
	// 상품 주문 리스트(전체목록)
	List<OrderVO> orderAll(PageCriteria criteria);
	
	// 상품 주문 리스트(paging)
	List<OrderVO> orderList(PageCriteria criteria);
	
	// 상품 주문 상세 내역
	OrderVO view(int orderNo);
	
	// 상품 주문 전체
	int getTotalOrderList(PageCriteria criteria);

}
