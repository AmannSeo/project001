<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- reset CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
    
    <!-- index/css -->
    <link rel="stylesheet" href="/resources/css/admin/index.css">  

</head>
<body>
  <div class="wrapper">
  <!-- 로그인 -->
    <div class="top_gnb_area">
      <c:if test="${vo != null }">
        <div class="member_login_part">
          <span>회원 : ${vo.memberName }</span>
        </div>
        <button type="button" id="btn_logout">로그아웃</button>
      </c:if>
    </div>

    <!-- 컨텐츠 영역 -->
    <div class="admin_wrap">
      <!-- 네비영역 -->
      <div class="admin_navi_wrap">
        <ul>
          <li class="admin_list_02"><a href="/admin/productList">상품 목록</a></li>
          <li class="admin_list_01"><a href="/admin/productReg">상품 등록</a></li>
          <li class="admin_list_03"><a href="/admin/memberManage">회원 관리</a></li>
          <li class="admin_list_04"><a href="/admin/productFaq">상품 문의</a></li>
          <li class="admin_list_05"><a href="/admin/productComment">상품평 관리</a></li>
          <li class="admin_list_06"><a href="/admin/helpList">자주하는 질문 관리</a></li>
          <li class="admin_list_07"><a href="/admin/noticeList">공지사항 관리</a></li>
        </ul>
      </div>
      
      
      
      
      
      
      
      