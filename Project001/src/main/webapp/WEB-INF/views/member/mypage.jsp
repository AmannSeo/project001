<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.memberId}</title>
</head>
<body>
  <h2>${vo.memberId} 님 환영합니다.</h2>
  
  <div class="wrapper">
    <div class="wrap">
    
      <div class="section_id">
        <span>아이디 : ${vo.memberId }</span>
      </div>
      <div class="section_name">
        <span>이름 : ${vo.memberName }</span>
      </div>
      <div class="section_birth">
        <span>생년월일 : ${vo.memberBirth }</span>
      </div>
      <div class="section_phone">
        <span>연락처 : ${vo.memberPhone }</span>
      </div>
      <div class="section_mail">
        <span>이메일 : ${vo.memberMail }</span>
      </div>
      <div class="section_mail_agree">
        <span>이메일 수신여부 : ${vo.memberMailAgree }</span>
      </div>
      <div class="section_add01">
        <span>우편번호 : ${vo.memberAdd01 }</span>
      </div>
      <div class="section_add02">
        <span>주소 : ${vo.memberAdd02 }</span>
      </div>
      <div class="section_add03">
        <span>상세주소 : ${vo.memberAdd03 }</span>
      </div>
      
    </div>
  </div>
  
  
  
  
  
  
  
  
</body>
</html>