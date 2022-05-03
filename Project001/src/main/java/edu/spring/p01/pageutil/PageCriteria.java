package edu.spring.p01.pageutil;

import java.util.Arrays;

// 브라우저에서 보여질 페이지 번호와
// 한 페이지에서 보여질 게시글의 개수를 저장하는 클래스
// -> paging 처리에 필요한 start와 end 번호를 알 수 있음
public class PageCriteria {
	private int page; // 현재 페이지 번호
	private int numsPerPage; // 한 페이지의 게시글 개수
	private int skip; // 페이지 스킵
	private String type; // 검색 타입
	private String keyword; // 검색 키워드
	private String[] productArr; // 상품 리스트
	
	public PageCriteria() {
		this.page = 1;
		this.numsPerPage = 5;
	}
	
	// 검색 타입 데이터 배열 변환
	public String[] getTypeArr() {
        return type == null? new String[] {}:type.split("");
    }
 
	public PageCriteria(int page, int numsPerPage) {
		this.page = page;
		this.numsPerPage = numsPerPage;
		this.skip = (page -1) * numsPerPage;
	}

	// getter/setter
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		this.skip = (page - 1) * this.numsPerPage;
	}

	public int getNumsPerPage() {
		return numsPerPage;
	}

	public void setNumsPerPage(int numsPerPage) {
		this.numsPerPage = numsPerPage;
		this.skip = (this.page - 1) * numsPerPage;
	}
	
	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String[] getProductArr() {
		return productArr;
	}

	public void setProductArr(String[] productArr) {
		this.productArr = productArr;
	}

	// 현재 보여지는 페이지의 시작 글 일련번호(rn)
	public int getStart() {
		return (this.page - 1) * this.numsPerPage + 1;
	}
	
	// 현재 보여지는 페이지의 마지막 글 일련번호(rn)
	public int getEnd() {
		return this.page * this.numsPerPage;
	}

	@Override
	public String toString() {
		return "PageCriteria [page=" + page + ", numsPerPage=" + numsPerPage + ", type=" + type
				+ ", keyword=" + keyword + ", productArr=" + Arrays.toString(productArr) + "]";
	}

	
	
	
	
	
}



