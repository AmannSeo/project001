package edu.spring.p01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.spring.p01.domain.CartVO;
import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.service.CartService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	
	/* 장바구니 추가 */
	/**
	 * 0: 등록 실패
	 * 1: 등록 성공
	 * 2: 등록된 데이터 존재
	 * 5: 로그인 필요
	 * 
	 */
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPOST(CartVO cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		if(mvo == null) {
			return "5";
		}
		
		// 카트 등록
		
		int result = cartService.addCart(cart);
		
		return result + "";
	}
	
}
















