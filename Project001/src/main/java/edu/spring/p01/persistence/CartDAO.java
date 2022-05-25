package edu.spring.p01.persistence;

import java.util.List;

import edu.spring.p01.domain.CartVO;

public interface CartDAO {
	/* 카트 추가 */
	int addCart(CartVO cart);
	
	/* 카트 삭제 */
	int deleteCart(int cartId);
	
	/* 카트 수량 수정 */
	int modifyCount(CartVO cart);
	
	/* 카트 목록 */
	List<CartVO> getCart(String memberId);	
	
	/* 카트 확인 */
	CartVO checkCart(CartVO cart);
}
