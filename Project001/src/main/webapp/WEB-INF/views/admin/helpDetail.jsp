<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${help.helpTitle }</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;">
  <%@include file="../includes/admin/admin_menu.jsp" %>
   <div class="wrapper">
    <div class="wrap">
      <div class="wrap_num">
        <span>번호 : ${help.helpNo }</span>
      </div>
      <div class="wrap_title">
        <span>제목 : ${help.helpTitle }</span>
      </div>
      <div class="wrap_name">
        <span>작성자 : ${help.helpName }</span>
      </div>
      <div>
        <fmt:formatDate value="${help.helpRegDate }" 
          pattern="yyyy년MM월dd일 HH시mm분ss초" var="helpRegDate"/>
        <span>작성일 : ${helpRegDate }</span>
      </div>
      <div class="wrap_content">
        <span>내용 : ${help.helpContent }</span>
        <textarea rows="20" cols="120" readonly="readonly">${help.helpContent }</textarea>
      </div>
     
      
      <div>
        <a href="helpList?page=${page }"><input type="button" value="목록"></a>
        <a href="helpUpdate?helpNo=${help.helpNo }&page=${page}"><input type="button" value="수정"></a>
        <a href="helpDelete?helpNo=${help.helpNo }"><input type="button" value="삭제"></a>
      </div>
    </div>
   </div>
</div>
</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>













