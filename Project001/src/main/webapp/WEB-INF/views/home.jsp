<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
   
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
   
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropdown button
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <a class="dropdown-item" href="#">Something else here</a>
  </div>
</div>

  <P>The time on the server is ${serverTime}. </P>
  <c:if test="${empty userid }">
    <button type="button" id="btn_login">로그인</button>
  </c:if>
  <c:if test="${empty userid }">
    <button type="button" id="btn_join">회원가입</button>
  </c:if>
  <c:if test="${not empty userid }">
    <button type="button" id="btn_logout">로그아웃</button>
  </c:if>
  
  <script type="text/javascript">
     $(document).ready(function(){
         $('#btn_login').click(function(){
               var target = encodeURI('/p01/member/login');
               location = target;
         }); // end btn_login.click()
         
         $('#btn_join').click(function(){
               var target = encodeURI('/p01/member/join');
               location = target;
         }); // end btn_join.click()
         
         $('#btn_logout').click(function(){
             location = '../member/logout';
           
         }); // end btn_logout.click()
     }); // end document()
  </script>
</body>
</html>
