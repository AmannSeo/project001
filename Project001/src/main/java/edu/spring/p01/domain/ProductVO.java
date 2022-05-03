package edu.spring.p01.domain;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class ProductVO {
	
	private int productNo; // 상품 번호
	private String productName; // 상품명
	private int productPrice; // 상품 가격
	private int productAmount; // 상품 수량
	private String productIntro; // 상품 소개
	private Date productRegDate; // 상품 등록 날짜
	private Date productModDate; // 상품 수정 날자
	
	private String cateCode; // 카테고리 코드
	private String cateName; // 카테고리 이름
	
	/* 이미지 정보 */
//	ProductVO 클래스가 여러개의 이미지 정보를 담을 수 있도록
//	List 자료구조를 활용
	private List<AttachImageVO> imageList;
	
	
	public ProductVO() {
		super();
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


	public Date getProductModDate() {
		return productModDate;
	}


	public void setProductModDate(Date productModDate) {
		this.productModDate = productModDate;
	}


	public String getCateCode() {
		return cateCode;
	}


	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}


	public String getCateName() {
		return cateName;
	}


	public void setCateName(String cateName) {
		this.cateName = cateName;
	}


	public List<AttachImageVO> getImageList() {
		return imageList;
	}


	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}


	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productAmount=" + productAmount + ", productIntro=" + productIntro + ", productRegDate="
				+ productRegDate + ", productModDate=" + productModDate + ", cateCode=" + cateCode + ", cateName="
				+ cateName + ", imageList=" + imageList + "]";
	}





	
	
	
	
}
