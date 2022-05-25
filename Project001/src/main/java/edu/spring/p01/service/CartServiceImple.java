package edu.spring.p01.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.CartVO;
import edu.spring.p01.persistence.CartDAO;

@Service
public class CartServiceImple implements CartService{
	
	@Autowired
	private CartDAO cartDao;

	@Override
	public int addCart(CartVO cart) {
		// 장바구니 데이터 체크
		CartVO checkCart = cartDao.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartDao.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}

}
