package edu.spring.p01.domain;

import java.util.Date;

public class CartVO {
	private int cartNo; // 주문번호
	private String memberName; // 구매자(회원명)
	private String productName; // 상품명
	private int cartAmount; // 구매 수량
	private int cartPrice; // 구매 가격
	private Date cartDate; // 주문 날짜 

	public CartVO() {
		super();
	}

	public CartVO(int cartNo, String memberName, String productName, int cartAmount, int cartPrice, Date cartDate) {
		super();
		this.cartNo = cartNo;
		this.memberName = memberName;
		this.productName = productName;
		this.cartAmount = cartAmount;
		this.cartPrice = cartPrice;
		this.cartDate = cartDate;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	public Date getCartDate() {
		return cartDate;
	}

	public void setCartDate(Date cartDate) {
		this.cartDate = cartDate;
	}

	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", memberName=" + memberName + ", productName=" + productName
				+ ", cartAmount=" + cartAmount + ", cartPrice=" + cartPrice + ", cartDate=" + cartDate + "]";
	}
	
	
}
