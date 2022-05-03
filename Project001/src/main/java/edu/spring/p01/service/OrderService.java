package edu.spring.p01.service;

import java.util.List;

import edu.spring.p01.domain.OrderVO;
import edu.spring.p01.pageutil.PageCriteria;

public interface OrderService {
	// 상품 주문
	int order(OrderVO order);
	
	// 상품 주문 리스트(전체목록)
	List<OrderVO> orderAll(PageCriteria criteria);
	
	// 상품 주문 리스트(paging)
	List<OrderVO> orderList(PageCriteria criteria);
	
	// 상품 주문 상세 내역
	OrderVO view(int orderNo);
	
	// 상품 주문 전체
	int getTotalOrderList(PageCriteria criteria);
}
