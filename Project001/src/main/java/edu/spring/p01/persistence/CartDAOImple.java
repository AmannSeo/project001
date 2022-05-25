package edu.spring.p01.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.p01.domain.CartVO;

@Repository
public class CartDAOImple implements CartDAO{
	private static final Logger logger =
			LoggerFactory.getLogger(CartDAOImple.class);
	private static final String NAMESPACE =
			"edu.spring.p01.CartMapper";

	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public int addCart(CartVO cart){
		logger.info("addCart() Call : " + cart);
		return sqlSession.insert(NAMESPACE + ".addCart", cart);
	}

	@Override
	public int deleteCart(int cartId) {
		logger.info("delete() Call : " + cartId);
		return sqlSession.delete(NAMESPACE + ".deleteCart", cartId);
	}

	@Override
	public int modifyCount(CartVO cart) {
		logger.info("modifyCount() Call : " + cart);
		return sqlSession.update(NAMESPACE + ".modifyCount", cart);
	}

	@Override
	public List<CartVO> getCart(String memberId) {
		logger.info("getCart() Call : " + memberId);
		return sqlSession.selectList(NAMESPACE + ".getCart", memberId);
	}

	@Override
	public CartVO checkCart(CartVO cart) {
		logger.info("checkCart() Call : " + cart);
		return sqlSession.selectOne(NAMESPACE + ".checkCart", cart);
	}

}
