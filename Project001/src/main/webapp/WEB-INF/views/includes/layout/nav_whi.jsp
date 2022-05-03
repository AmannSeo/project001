<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css">

<!-- custom css -->
<link rel="stylesheet" href="/resources/css/includes/header.css">
<link rel="stylesheet" href="/resources/css/bootstrap/navbar.css">


<style type="text/css">
.nav-link {
  color : white;
}
.member_login_part span {
  color: white;
}
.admin_login_part span{
  color: white;
}
.menu_channel {
  color :white !important;
}
#btn_login {
  color:white; 
  border-color: white;
}
#btn_login:hover {
  background-color: white;
  color : rgba(0, 0, 0, .5)
}
#btn_logout:hover {
  background-color: white;
  color : rgba(0, 0, 0, .5);
}
#btn_login:active {
  background-color: white;
  color : rgba(0, 0, 0, .5);
}
#btn_logout:active {
  background-color: white;
  color : rgba(0, 0, 0, .5);
}
#btn_logout {
  color:white;
  border-color: white;
}
#btn_join{
  color: black;
  border-color: white;
  background-color: white;
  opacity: 80%;
}
#btn_join:hover{
  color: black;
  border-color: white;
  background-color: white;
  opacity: 100%;
}
#btn_join:active{
  color: black;
  border-color: white;
  background-color: white;
  opacity: 100%;
}


</style>
</head>
  <div class="container nav_wrapper" style="padding-top: 12px !important;">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4">
      <a href="/main" class="a_logo">
        <img class="img_logo" src="resources/imgs/logo_whi.png">
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <!-- <li><a href="/product/index" class="nav-link px-2 menu_channel">PRODUCTS</a></li> -->
        <li class="nav-item dropdown">
          <a href="/fine-fragrances" class="nav-link px-2 dropdown-toggle menu_channel" data-bs-toggle="dropdown" aria-expanded="false">FINE FRAGRANCES</a>
          <ul class="dropdown-menu" aria-labelledby="dropdown04">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
          </ul>
        </li>
        <li><a href="#" class="nav-link px-2 menu_channel">HOME CREATIONS</a></li>
        <li><a href="#" class="nav-link px-2 menu_channel">BODY - HAIR - FACE</a></li>
        <li><a href="#" class="nav-link px-2 menu_channel">ABOUT US</a></li>
        <li><a href="/help" class="nav-link px-2 menu_channel">FAQ</a></li>
      </ul>
      
      <div class="search_wrap">
          <form id="searchForm" action="/search" method="get">
            <div class="search_input">
              <input type="text" name="keyword">
                <button class='btn search_btn'>검 색</button>                       
            </div>
          </form>
        </div>
      

      <div class="login_wrap">
        <div class="not_login_part">
            <!-- 로그인 하지 않은 상태 -->
            <c:if test="${sessionMemberVo == null }">
              <button type="button" id="btn_login" class="btn btn-outline-primary me-2">로그인</button>
              <button type="button" id="btn_join" class="btn btn-primary">회원가입</button>
            </c:if>
         </div>
      </div>
      
       <div class="login_wrap">
         <div class="login_part">
            <!-- 로그인 한 상태 -->
            <c:if test="${sessionMemberVo != null }">
              <div class="member_login_part">
                <span>회원 : ${sessionMemberVo.memberId }</span>
                <a href="/member/mypage?memberNo=${sessionMemberVo.memberNo }&page" class="myPage"><span>마이페이지</span></a>
              </div>
              <div class="admin_login_part">
                <c:if test="${sessionMemberVo.adminCk == 1 }">
                  <span>관리자 : ${sessionMemberVo.memberId }</span>
                  <button type="button" class="btn_admin_page">관리자 페이지</button>
                </c:if>
              </div>
              <button type="button" id="btn_logout" class="btn btn-outline-primary me-2">로그아웃</button>
            </c:if>
         </div>
       </div>
    </header>
  </div>
 <script type="text/javascript">
     $(document).ready(function(){
         $('#btn_login').click(function(){
               var target = encodeURI('../member/login');
               location = target;
         }); // end btn_login.click()

         $('#btn_join').click(function(){
               var target = encodeURI('/member/join');
               location = target;
         }); // end btn_join.click()
         
         $('#btn_logout').click(function(){
             // location = '../member/logout';
             $.ajax({
               type : "POST",
               url : "/member/logout",
               success : function(data){
                 alert("로그아웃 되었습니다.");
                 document.location.reload();
               }
             }); // end ajax
         }); // end btn_logout.click()
         
         $('.btn_admin_page').click(function(){
           var target = encodeURI('/admin/index');
           location = target;
         }); // end btn_admin_page.click()
     }); // end document()
     
     
  </script>