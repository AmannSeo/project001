<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>${product.productName }</title>
</head>
<body>
<h2>상품 상세 페이지</h2>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<div class="wrapper">
  <div class="wrap">
    <div class="wrap_num">
      <span>상품 번호 : ${product.productNo }</span>
    </div>
    <div class="wrap_name">
      <span>상품명 : ${product.productName }</span>
    </div>
    <div class="wrap_category">
      <span>카테고리 : ${product.productCategory }</span>
    </div>
    <div class="wrap_price">
      <span>가격 : ${product.productPrice } 원</span>
    </div>
    <div class="wrap_amount">
      <span>수량 : ${product.productAmount } 개</span>
    </div>
    <div>
      <fmt:formatDate value="${product.productRegDate }" 
        pattern="yyyy년MM월dd일 HH시mm분ss초" var="productRegDate"/>
      <span>작성일 : ${productRegDate }</span>
    </div>
    <div class="wrap_prointro">
      <span>상품 소개</span><br>
      <textarea rows="20" cols="120" readonly="readonly">${product.productIntro }</textarea>
    </div>
    <div>
      <a href="productList?page=${page }"><input type="button" value="목록"></a>
      <a href="productUpdate?productNo=${product.productNo }&page=${page}"><input type="button" value="수정"></a>
      <a href="productDelete?productNo=${product.productNo }"><input type="button" value="삭제"></a>
    </div>
  </div>
</div>
</body>
</html>














