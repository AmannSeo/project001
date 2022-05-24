<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous">></script>
    
    <!-- reset CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />

    <!-- index/css -->
    <link rel="stylesheet" href="/resources/css/admin/helpList.css">

<meta charset="UTF-8">
<title>질문 게시판</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;">
  <%@include file="../includes/admin/admin_menu.jsp" %>

  

  <div class="help_list" style="width: 100%">
  <h2>질문 게시판</h2>
  <div style="height : 40px;"></div>
  <!-- 질문 존재 O -->
    <c:if test="${listCheck != 'empty' }">
      <table class="help_list_table">
        <thead>
          <tr>
            <th class="list_no th_column_01">번호</th>
            <th class="list_title th_column_02">제목</th>
            <th class="list_name th_column_03">작성자</th>
            <th class="list_content th_column_04">내용</th>
            <th class="list_date th_column_05">작성 날짜</th>
          </tr>
        </thead>
        <tbody>
        <!-- 컨트롤러의 list의 명에 따라서 items의 이름이 정해짐. 
        var의 값이 value에 들어간 var명과 같아야 되며 다를 경우 오류가 생김 -->
          <c:forEach var="helpList" items="${helpList }">
            <tr>
              <td><c:out value="${helpList.helpNo }"></c:out></td>
              <td><a href="helpDetail?helpNo=${helpList.helpNo }&page=${pageMaker.criteria.page}"><c:out value="${helpList.helpTitle }"></c:out></a></td>
              <td><c:out value="${helpList.helpName }"></c:out></td>
              <td><c:out value="${helpList.helpContent }"></c:out></td>
              <fmt:formatDate value="${helpList.helpRegDate }"
                pattern="yyyy년 MM월 dd일 HH시mm분ss초" var="helpRegDate"/>
              <td><c:out value="${helpRegDate }"></c:out></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:if>
    <div style="height : 40px;"></div>
    <div class="pro_reg_btn">
      <a href="helpInsert"><input type="button" value="질문 등록"></a>
    </div>
  </div>
  
  
    
      
</div>    
 
  
</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>












