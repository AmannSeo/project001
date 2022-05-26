<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
    <meta charset="UTF-8">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/bootstrap/sidebars.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sidebars/">

    

    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
.admin_menu a button {
  border-color: transparent;
  width : 200px;
  color : white;
  text-align: left;
}
</style>

</head>

<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px; max-height:100%; min-height: 540px">
    <h2>관리자 페이지</h2>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <!-- <li class="nav-item admin_menu">
        <a href="/admin/index" class="nav-link" aria-current="page">
          <button type="button" id="btn_main" class="btn btn-outline-primary me-2">메인</button>
        </a>
      </li> -->
      <li class="nav-item admin_menu">
        <a href="/admin/memberManage" class="nav-link text-white">
          <button type="button" id="btn_member" class="btn btn-outline-primary me-2">회원</button>
        </a>
      </li>
      <li class="nav-item admin_menu">
        <a href="/admin/productList" class="nav-link text-white">
          <button type="button" id="btn_product" class="btn btn-outline-primary me-2">상품</button>
        </a>
      </li>
      <li class="nav-item admin_menu">
        <a href="/admin/noticeList" class="nav-link text-white">
          <button type="button" id="btn_notice" class="btn btn-outline-primary me-2">공지사항</button>
        </a>
      </li>
      <li class="nav-item admin_menu">
        <a href="/admin/helpList" class="nav-link text-white">
          <button type="button" id="btn_help" class="btn btn-outline-primary me-2">FAQ</button>
        </a>
      </li>
    </ul>
    <hr>
    
  </div>



<script type="text/javascript">
(function () {
	  'use strict'
	  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
	    new bootstrap.Tooltip(tooltipTriggerEl)
	  })
	})()

</script>
  
  
  
  
  
  
  
  