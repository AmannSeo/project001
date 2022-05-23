package edu.spring.p01.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import edu.spring.p01.domain.CartVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartServiceTest {
	
	@Autowired
	private CartService service;
	
	//등록 테스트
	@Test
	public void addCartTest() {
		//given
			String memberId = "admin";
			int productNo = 2;
			int count = 5;
			
			CartVO cart = new CartVO(); 
			cart.setMemberId(memberId);
			cart.setProductNo(productNo);;
			cart.setProductCount(count);
		
		//when
			int result = service.addCart(cart);
		
		//then
			System.out.println("** result : " + result);
		
		
	}

}
