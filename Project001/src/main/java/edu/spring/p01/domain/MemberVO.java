package edu.spring.p01.domain;

import java.util.Date;

public class MemberVO {
	private int memberNo;
	private String memberId; // 회원 아이디
	private String memberPw; // 회원 비밀번호
	private String memberName; // 회원 이름
	private String memberBirth; // 회원 생일
	private String memberPhone; // 회원 연락처
	private String memberMail; // 회원 메일
	private String memberMailAgree; // 회원 수신 여부
	private String memberAdd01; // 회원 우편번호
	private String memberAdd02; // 회원 검색 주소
	private String memberAdd03; // 회원 상세 주소
	private Date regDate; // 회원 등록 일자
	private int adminCk; // 0 : 회원, 1 : 관리자
	
	public MemberVO() {
		super();
	}

	public MemberVO(int memberNo, String memberId, String memberPw, String memberName, String memberBirth,
			String memberPhone, String memberMail, String memberMailAgree, String memberAdd01, String memberAdd02,
			String memberAdd03, Date regDate, int adminCk) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberBirth = memberBirth;
		this.memberPhone = memberPhone;
		this.memberMail = memberMail;
		this.memberMailAgree = memberMailAgree;
		this.memberAdd01 = memberAdd01;
		this.memberAdd02 = memberAdd02;
		this.memberAdd03 = memberAdd03;
		this.regDate = regDate;
		this.adminCk = adminCk;
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

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberMail() {
		return memberMail;
	}

	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}

	public String getMemberMailAgree() {
		return memberMailAgree;
	}

	public void setMemberMailAgree(String memberMailAgree) {
		this.memberMailAgree = memberMailAgree;
	}

	public String getMemberAdd01() {
		return memberAdd01;
	}

	public void setMemberAdd01(String memberAdd01) {
		this.memberAdd01 = memberAdd01;
	}

	public String getMemberAdd02() {
		return memberAdd02;
	}

	public void setMemberAdd02(String memberAdd02) {
		this.memberAdd02 = memberAdd02;
	}

	public String getMemberAdd03() {
		return memberAdd03;
	}

	public void setMemberAdd03(String memberAdd03) {
		this.memberAdd03 = memberAdd03;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getAdminCk() {
		return adminCk;
	}

	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}

	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberBirth=" + memberBirth + ", memberPhone=" + memberPhone + ", memberMail="
				+ memberMail + ", memberMailAgree=" + memberMailAgree + ", memberAdd01=" + memberAdd01
				+ ", memberAdd02=" + memberAdd02 + ", memberAdd03=" + memberAdd03 + ", regDate=" + regDate
				+ ", adminCk=" + adminCk + "]";
	}

	
	
}





