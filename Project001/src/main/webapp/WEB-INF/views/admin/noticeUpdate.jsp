<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${notice.noticeTitle }</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;">
  <%@include file="../includes/admin/admin_menu.jsp" %>  
  <h2>글 수정</h2>
  <div class="wrapper">
    <div class="wrap">
      <form id="noticeUpdate_form" action="/admin/noticeUpdate" method="post">
        <input type="hidden" name="page" value="${page }">
        <div class="wrap_num">
          <span>번호 : ${notice.noticeNo }</span>
          <input type="hidden" name="noticeNo" value="${notice.noticeNo }">
        </div>
        <div class="wrap_name">
          <span>작성자</span>
          <input type="text" name="noticeName" value="${notice.noticeName }">
        </div>
        
        <div class="wrap_title">
          <span>제목</span>
          <input type="text" name="noticeTitle" value="${notice.noticeTitle }">
        </div>
        <div>
          <fmt:formatDate value="${notice.noticeRegDate }" 
            pattern="yyyy년MM월dd일 HH시mm분ss초" var="noticeRegDate"/>
          <span>작성일 : ${noticeRegDate }</span>
        </div>
        <div class="wrap_prointro">
          <span>내용</span><br>
          <textarea rows="20" cols="40" style="resize: none;" name="noticeContent">${notice.noticeContent }</textarea>
        </div>
        <div>
          <input type="submit" class="btn_update" value="수정">
          <a href="noticeDetail?noticeNo=${notice.noticeNo }&page=${pageMaker.criteria.page}"><input type="button" value="취소"></a>
        </div>
      </form>
      
    </div>
  </div>
</div>
</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>