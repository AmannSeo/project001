<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/product/">

 <!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">

<!-- custom css -->
<link href="/resources/css/fine-fragrances.css" rel="stylesheet">

<style type="text/css">
.rounded-3 a {
  text-decoration: none !important;
  color : black;
}
.product_card {
  margin: 10px 0 !important;
}
</style>
<title>FINE FRAGRANCES</title>
</head>
<body>
<!-- nav -->
<%@include file="includes/layout/nav_blk.jsp" %>
  
   

  <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light fine_wrap" style="margin: 0 !important;">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
      <h1 class="main-title display-4 fw-normal">FINE FRAGRANCES</h1>
      <p class="main-info lead fw-normal">And an even wittier subheading to boot.<br>Jumpstart your marketing efforts with this example based on Apple’s marketing pages.</p>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
  </div>
  
  <div class="container" style="margin: 60px auto;">
    <div class="row align-items-md-stretch">
      <div class="col-md-6 product_card">
        <div class="h-100 p-5 bg-light border rounded-3" style="text-align: center;">
          <a href="/search?type=C&cateCode=101001">
          <h4>THE MATCHA 26</h4>
          <p>In the same way matcha tea is much more than just a drink in Japanese culture,<br>THÉ MATCHA 26 is much more than a scent to us.</p>
          </a>
        </div>
      </div>
      
      <div class="col-md-6 product_card">
        <div class="h-100 p-5 bg-light border rounded-3" style="text-align: center;">
          <a href="/search?type=C&cateCode=101002">
          <h4>SANTAL 33</h4>
          <p>Do you remember the old Marlboro ads?<br>A man and his horse in front of the fire on a great plain under tall,<br>blue evening skies.</p>
          </a>
        </div>
      </div>
      
      <div class="col-md-6 product_card">
        <div class="h-100 p-5 bg-light border rounded-3" style="text-align: center;">
          <a href="/search?type=C&cateCode=101003">
          <h4>THE NOIR 29</h4>
          <p>Thé Noir 29 is an ode to the noble leaf and the craft that surrounds it.</p>
          </a>
        </div>
      </div>
      
      <div class="col-md-6 product_card">
        <div class="h-100 p-5 bg-light border rounded-3" style="text-align: center;">
          <a href="/search?type=C&cateCode=101004">
          <h4>ROSE 31</h4>
          <p>The perfume’s aim is clear: to transform the famous Grasse Rose, a symbol of voluptuousness and unqualified femininity, into an assertively virile fragrance that can be worn by men and women…</p>
          </a>
        </div>
      </div>
      
    </div>
  </div>

  
</body>
<!-- footer -->
<%@include file="includes/admin/footer.jsp" %>
</html>