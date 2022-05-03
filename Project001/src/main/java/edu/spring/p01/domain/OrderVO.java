package edu.spring.p01.domain;

import java.util.Date;

public class OrderVO {
	private int orderNo; // 주문번호
	private int memberNo;
	private String memberId; // 구매자(Id)
	private String productName; // 상품명
	private int orderAmount; // 구매 수량
	private int orderPrice; // 구매 가격
	private Date orderDate; // 주문 날짜
	
	public OrderVO() {
		super();
	}

	public OrderVO(int orderNo, int memberNo, String memberId, String productName, int orderAmount, int orderPrice,
			Date orderDate) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.productName = productName;
		this.orderAmount = orderAmount;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", memberNo=" + memberNo + ", memberId=" + memberId + ", productName="
				+ productName + ", orderAmount=" + orderAmount + ", orderPrice=" + orderPrice + ", orderDate="
				+ orderDate + "]";
	}

	
	
	

}
