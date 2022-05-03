package edu.spring.p01.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.p01.domain.OrderVO;
import edu.spring.p01.pageutil.PageCriteria;

@Repository
public class OrderDAOImple implements OrderDAO{
	private static final Logger logger =
			LoggerFactory.getLogger(OrderDAOImple.class);
	private static final String NAMESPACE =
			"edu.spring.p01.OrderMapper";
	
	@Autowired
	private SqlSession sqlSession;

	// 상품 주문
	@Override
	public int order(OrderVO order) {
		logger.info("order() Call");
		return sqlSession.insert(NAMESPACE + ".order", order);
	}
	
	// 상품 주문 리스트
	@Override
	public List<OrderVO> orderAll(PageCriteria criteria) {
		logger.info("orderAll() Call");
		return sqlSession.selectList(NAMESPACE + ".order_all", criteria);
	}

	// 상품 주문 리스트(paging)
	@Override
	public List<OrderVO> orderList(PageCriteria criteria) {
		logger.info("orderList() Call");
		return sqlSession.selectList(NAMESPACE + ".order_list", criteria);
	}

	// 상품 주문 상세 내역
	@Override
	public OrderVO view(int orderNo) {
		logger.info("view() Call");
		logger.info("orderNo : " + orderNo);
		return sqlSession.selectOne(NAMESPACE + ".view", orderNo);
	}

	// 상품 주문 전체
	@Override
	public int getTotalOrderList(PageCriteria criteria) {
		logger.info("getTotalOrderList() Call" + criteria);
		return sqlSession.selectOne(NAMESPACE + ".order_total_count");
	}

	

}
