package edu.spring.p01.domain;

import java.util.Date;

public class ProductVO {
	
	private int productNo; // 상품 번호
	private String productName; // 상품명
	private String productCategory; // 상품 카테고리
	private int productPrice; // 상품 가격
	private int productAmount; // 상품 수량
	private String productIntro; // 상품 소개
	private Date productRegDate; // 상품 등록 날짜
	
	public ProductVO() {
		super();
	}

	public ProductVO(int productNo, String productName, String productCategory, int productPrice, int productAmount,
			String productIntro, Date productRegDate) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productCategory = productCategory;
		this.productPrice = productPrice;
		this.productAmount = productAmount;
		this.productIntro = productIntro;
		this.productRegDate = productRegDate;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	public String getProductIntro() {
		return productIntro;
	}

	public void setProductIntro(String productIntro) {
		this.productIntro = productIntro;
	}

	public Date getProductRegDate() {
		return productRegDate;
	}

	public void setProductRegDate(Date productRegDate) {
		this.productRegDate = productRegDate;
	}

	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", productCategory="
				+ productCategory + ", productPrice=" + productPrice + ", productAmount=" + productAmount
				+ ", productIntro=" + productIntro + ", productRegDate=" + productRegDate + "]";
	}

	
	
}
