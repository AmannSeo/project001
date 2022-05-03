package edu.spring.p01.domain;

import java.util.Date;

public class HelpVO {
	private int helpNo; // 게시판 번호
	private String helpTitle; // 게시판 제목
	private String helpName; // 게시판 작성자
	private String helpContent; // 게시판 내용
	private Date helpRegDate; // 게시판 작성날짜
	
	public HelpVO() {
		super();
	}

	public HelpVO(int helpNo, String helpTitle, String helpName, String helpContent, Date helpRegDate) {
		super();
		this.helpNo = helpNo;
		this.helpTitle = helpTitle;
		this.helpName = helpName;
		this.helpContent = helpContent;
		this.helpRegDate = helpRegDate;
	}

	public int gethelpNo() {
		return helpNo;
	}

	public void sethelpNo(int helpNo) {
		this.helpNo = helpNo;
	}

	public String gethelpTitle() {
		return helpTitle;
	}

	public void sethelpTitle(String helpTitle) {
		this.helpTitle = helpTitle;
	}

	public String gethelpName() {
		return helpName;
	}

	public void sethelpName(String helpName) {
		this.helpName = helpName;
	}

	public String gethelpContent() {
		return helpContent;
	}

	public void sethelpContent(String helpContent) {
		this.helpContent = helpContent;
	}

	public Date gethelpRegDate() {
		return helpRegDate;
	}

	public void sethelpRegDate(Date helpRegDate) {
		this.helpRegDate = helpRegDate;
	}

	@Override
	public String toString() {
		return "helpVO [helpNo=" + helpNo + ", helpTitle=" + helpTitle + ", helpName=" + helpName
				+ ", helpContent=" + helpContent + ", helpRegDate=" + helpRegDate + "]";
	}
	
	

	
}
