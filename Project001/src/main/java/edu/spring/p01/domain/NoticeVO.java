package edu.spring.p01.domain;

import java.util.Date;

public class NoticeVO {
	private int noticeNo; // 게시판 번호
	private String noticeTitle; // 게시판 제목
	private String noticeName; // 게시판 작성자
	private String noticeContent; // 게시판 내용
	private Date noticeRegDate; // 게시판 작성날짜
	
	public NoticeVO() {
		super();
	}

	public NoticeVO(int noticeNo, String noticeTitle, String noticeName, String noticeContent, Date noticeRegDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeName = noticeName;
		this.noticeContent = noticeContent;
		this.noticeRegDate = noticeRegDate;
	}

	public int getnoticeNo() {
		return noticeNo;
	}

	public void setnoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getnoticeTitle() {
		return noticeTitle;
	}

	public void setnoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getnoticeName() {
		return noticeName;
	}

	public void setnoticeName(String noticeName) {
		this.noticeName = noticeName;
	}

	public String getnoticeContent() {
		return noticeContent;
	}

	public void setnoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getnoticeRegDate() {
		return noticeRegDate;
	}

	public void setnoticeRegDate(Date noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}

	@Override
	public String toString() {
		return "noticeVO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeName=" + noticeName
				+ ", noticeContent=" + noticeContent + ", noticeRegDate=" + noticeRegDate + "]";
	}
	
	

	
}
