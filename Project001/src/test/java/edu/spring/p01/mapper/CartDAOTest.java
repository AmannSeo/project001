package edu.spring.p01.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.p01.domain.CartVO;
import edu.spring.p01.persistence.CartDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class CartDAOTest {
	
	@Autowired
	private CartDAO cartDao;
	
	// 카트 생성
	
	/*
	 * @Test public void addCart() { String memberId = "admin"; int productNo = 2;
	 * int count = 2;
	 * 
	 * CartVO cart = new CartVO(); cart.setMemberId(memberId);
	 * cart.setProductNo(productNo); cart.setProductCount(count);
	 * 
	 * int result = 0; result = cartDao.addCart(cart);
	 * 
	 * System.out.println("결과 : " + result);
	 * 
	 * }
	 */
	 
	
	// 카트 삭제
	/*
	 * @Test public void deleteCartTest() { int cartId = 1;
	 * 
	 * cartDao.deleteCart(cartId); }
	 */
	
	// 카트 수량 수정
	/*
	 * @Test public void modifyCartTest() {
	 * 
	 * int cartId = 2; int count = 5;
	 * 
	 * CartVO cart = new CartVO(); cart.setCartId(cartId);
	 * cart.setProductCount(count);
	 * 
	 * cartDao.modifyCount(cart); }
	 */
	
	// 카트 목록
	
	  @Test public void getCartTest() { 
		  String memberId = "admin";
	  
		  List<CartVO> list = cartDao.getCart(memberId); 
			  for(CartVO cart : list) {
			  System.out.println(cart); 
		  } 
	  }
	 
	
	// 카트 확인
	/*
	 * @Test public void checkCartTest() { String memberId = "admin"; int productNo
	 * = 2;
	 * 
	 * CartVO cart = new CartVO(); cart.setMemberId(memberId);
	 * cart.setProductNo(productNo);
	 * 
	 * CartVO resultCart = cartDao.checkCart(cart); System.out.println("결과 : " +
	 * resultCart); }
	 */
	 
	 
	
}
