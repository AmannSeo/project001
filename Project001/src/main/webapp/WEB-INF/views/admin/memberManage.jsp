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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- reset CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />

    <!-- index/css -->
    <link rel="stylesheet" href="/resources/css/admin/memberManage.css"> 
    
    <!-- custom css -->
    <link rel="stylesheet" href="/resources/css/includes/page.css"> 

<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;">
  <%@include file="../includes/admin/admin_menu.jsp" %>  
 
 <div class="memberList_wrapper">
    <div class="memberList_wrap">
      <h2>회원 목록</h2>
      <div style="height : 40px;"></div>
      <div class="member_list">
      <!-- 회원이 존재 O -->
          <table class="member_list_table">
            <thead>
              <tr>
                <th class="list_no th_column_01">회원 아이디</th>
                <th class="list_name th_column_02">회원 이름</th>
                <th class="list_category th_column_03">회원 생년월일</th>
                <th class="list_price th_column_04">회원 연락처</th>
                <th class="list_amount th_column_05">회원 메일</th>
                <th class="list_date th_column_08">회원 주소</th>
                <th class="list_date th_column_10">회원 가입날짜</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="list" items="${vo }">
                <tr>
                  <td><a href="memberInfo?memberNo=${list.memberNo }&page=${pageMaker.criteria.page}"><c:out value="${list.memberId }"></c:out></a></td>
                  <td><c:out value="${list.memberName }"></c:out></td>
                  <td><c:out value="${list.memberBirth }"></c:out></td>
                  <td><c:out value="${list.memberPhone }"></c:out></td>
                  <td><c:out value="${list.memberMail }"></c:out></td>
                  <td><c:out value="${list.memberAdd02 }"></c:out></td>
                  <fmt:formatDate value="${list.regDate }"
                    pattern="yyyy년 MM월 dd일" var="regDate"/>
                  <td><c:out value="${regDate }"></c:out></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        
       <%-- <div class="paging_num">
        <ul class="pageMaker">
          <c:if test="${pageMaker.hasPrev }"> <!-- 페이지에 이전이 있을경우에만 버튼을 만든다 -->
            <li class="pageMaker_btn hasPrev">
              <a href="memberManage?page=${pageMaker.startPageNo - 1 }">이전</a>
            </li>
          </c:if>
        
          <!-- 반복문에 시작과 끝이 있을 경우 -->
          <c:forEach begin="${pageMaker.startPageNo }" 
          end="${pageMaker.endPageNo }" var="num"> 
            <li class="pageMaker_btn ${pageMaker.criteria.page == num ? "active":""}">
              <a href="memberManage?page=${num }">${num }</a>
            </li>
          </c:forEach>
          
         
          
          <c:if test="${pageMaker.hasNext }">
            <li class="pageMaker_btn hasNext">
              <a href="memberManage?page=${pageMaker.endPageNo + 1 }">다음</a>
            </li>
          </c:if>
        </ul>
      </div> --%>
      
     <!-- 페이징 -->
      <div class="paging_num">
        <ul class="pageMaker">
          <c:if test="${pageMaker.hasPrev }"> <!-- 페이지에 이전이 있을경우에만 버튼을 만든다 -->
            <li class="pageMaker_btn hasPrev">
              <a href="memberManage?page=${pageMaker.startPageNo - 1 }">이전</a>
            </li>
          </c:if>
        
          <!-- 반복문에 시작과 끝이 있을 경우 -->
          <c:forEach begin="${pageMaker.startPageNo }" 
          end="${pageMaker.endPageNo }" var="num"> 
            <li class="pageMaker_btn ${pageMaker.criteria.page == num ? "active":""}">
              <a href="memberManage?page=${num }">${num }</a>
            </li>
          </c:forEach>
          
         
          
          <c:if test="${pageMaker.hasNext }">
            <li class="pageMaker_btn hasNext">
              <a href="memberManage?page=${pageMaker.endPageNo + 1 }">다음</a>
            </li>
          </c:if>
        </ul>
      </div>
      
      <form id="moveForm" action="/admin/memberManage" method="get" >
        <input type="hidden" name="page" value="${pageMaker.criteria.page}">
        <input type="hidden" name="numsPerPage" value="${pageMaker.criteria.numsPerPage}">
        <input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
        <input type="hidden" name="type" value="${pageMaker.criteria.type}">
      </form>
       
      </div>
     
      <div style="height : 40px;"></div>
      
    </div>
  </div>
</div>  
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</body>
</html>










