<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    
    <!-- reset CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />

<title>${product.productName }</title>
</head>
<body>
  <!-- header -->
  <%@include file="../includes/admin/header.jsp" %>
  <h2>상품 수정</h2>
  <div class="wrapper">
    <div class="wrap">
      <form id="productUpdate_form" action="/admin/productUpdate" method="post">
        <input type="hidden" name="page" value="${page }">
        <div class="wrap_num">
          <span>상품 번호 : ${product.productNo }</span>
          <input type="hidden" name="productNo" value="${product.productNo }">
        </div>
        <div class="wrap_name">
          <span>상품명</span>
          <input type="text" name="productName" value="${product.productName }">
        </div>
        <div class="wrap_category">
          <span>카테고리</span>
            <select name="productCategory">
              <option value="none" selected>=== 선택 ===</option>
              <option value="FINE FRAGRANCES">FINE FRAGRANCES</option>
              <option value="HOME CREATIONS">HOME CREATIONS</option>
              <option value="BODY - HAIR - FACE">BODY - HAIR - FACE</option>
              <option value="GROOMING">GROOMING</option>
            </select>
        </div>
        <div class="wrap_price">
          <span>가격</span>
          <input type="number" name="productPrice" value="${product.productPrice }"> 원
        </div>
        <div class="wrap_amount">
          <span>수량</span>
          <input type="number" name="productAmount" value="${product.productAmount }"> 개
        </div>
        <div>
          <fmt:formatDate value="${product.productRegDate }" 
            pattern="yyyy년MM월dd일 HH시mm분ss초" var="productRegDate"/>
          <span>작성일 : ${productRegDate }</span>
        </div>
        <div class="wrap_prointro">
          <span>상품 소개</span><br>
          <textarea rows="20" cols="40" style="resize: none;" name="productIntro">${product.productIntro }</textarea>
        </div>
        <div>
          <input type="submit" class="btn_update" value="수정">
          <a href="productDetail?productNo=${product.productNo }&page=${pageMaker.criteria.page}"><input type="button" value="취소"></a>
        </div>
      </form>
      
    </div>
</div>


</body>
</html>

















