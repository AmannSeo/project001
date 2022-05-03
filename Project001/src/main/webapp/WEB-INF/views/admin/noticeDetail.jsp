<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${notice.noticeTitle }</title>
</head>
<body>
<h2>글 보기</h2>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>
 <div class="wrapper">
  <div class="wrap">
    <div class="wrap_num">
      <span>번호 : ${notice.noticeNo }</span>
    </div>
    <div class="wrap_title">
      <span>제목 : ${notice.noticeTitle }</span>
    </div>
    <div class="wrap_name">
      <span>작성자 : ${notice.noticeName }</span>
    </div>
    <div>
      <fmt:formatDate value="${notice.noticeRegDate }" 
        pattern="yyyy년MM월dd일 HH시mm분ss초" var="noticeRegDate"/>
      <span>작성일 : ${noticeRegDate }</span>
    </div>
    <div class="wrap_content">
      <span>내용 : ${notice.noticeContent }</span>
      <textarea rows="20" cols="120" readonly="readonly">${notice.noticeContent }</textarea>
    </div>
   
    
    <div>
      <a href="noticeList?page=${page }"><input type="button" value="목록"></a>
      <a href="noticeUpdate?noticeNo=${notice.noticeNo }&page=${page}"><input type="button" value="수정"></a>
      <a href="noticeDelete?noticeNo=${notice.noticeNo }"><input type="button" value="삭제"></a>
    </div>
  </div>
</div>
</body>
</html>













