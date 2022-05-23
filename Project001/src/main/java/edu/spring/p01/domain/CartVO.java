package edu.spring.p01.domain;

import java.util.Date;

public class CartVO {
	private int cartId;
	private String memberId;
	private int productNo;
	private int productCount;
	
	// product
	private String productName;
	private int productPrice;
	
	
	
	public int getCartId() {
		return cartId;
	}



	public void setCartId(int cartId) {
		this.cartId = cartId;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public int getProductNo() {
		return productNo;
	}



	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}



	public int getProductCount() {
		return productCount;
	}



	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public int getProductPrice() {
		return productPrice;
	}



	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}



	@Override
	public String toString() {
		return "CartVO [cartId=" + cartId + ", memberId=" + memberId + ", productNo=" + productNo + ", productCount="
				+ productCount + ", productName=" + productName + ", productPrice=" + productPrice + "]";
	}
	
	
	
}
