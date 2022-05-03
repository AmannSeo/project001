package edu.spring.p01.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.OrderVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.persistence.MemberDAO;
import edu.spring.p01.persistence.OrderDAO;

@Service
public class OrderServiceImple implements OrderService{
	private static final Logger logger =
			LoggerFactory.getLogger(OrderServiceImple.class);
	
	@Autowired
	private OrderDAO orderDao;
	
	@Autowired
	private MemberDAO memberDao;
	
	// 상품 주문
	@Override
	public int order(OrderVO order) {
		// 상품을 주문하면
		// 회원의 포인트가 상품을 주문한 포인트 만큼 깍임
		// pro01_order table에 insert가 되면
		// pro01_member table에 update가 된다
		logger.info("order() Call");
		logger.info("order : " + order);
		orderDao.order(order);
		logger.info("주문 성공");
		
		memberDao.updatePoint(order.getOrderPrice(), order.getMemberNo());
		logger.info("결제 완료");
		return 1;
		
	}

	// 상품 주문 리스트(전체목록)
	@Override
	public List<OrderVO> orderAll(PageCriteria criteria) {
		logger.info("orderAll() Call");
		return orderDao.orderAll(criteria);
	}

	// 상품 주문 리스트(paging)
	@Override
	public List<OrderVO> orderList(PageCriteria criteria) {
		logger.info("orderList() Call");
		return orderDao.orderList(criteria);
	}

	// 상품 주문 상세 내역
	@Override
	public OrderVO view(int orderNo) {
		logger.info("view() Call");
		logger.info("orderNp : " + orderNo);
		return orderDao.view(orderNo);
	}

	// 상품 주문 전체 페이징
	@Override
	public int getTotalOrderList(PageCriteria criteria) {
		logger.info("getTotalOrderList() Call");
		return orderDao.getTotalOrderList(criteria);
	}
}








