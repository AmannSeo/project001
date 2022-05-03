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
   

    <!-- main/css -->
    <link rel="stylesheet" href="resources/css/search.css">  
<style type="text/css">
 .card-body a {
  text-decoration: none;
 }
 .product_card {
  flex: 1 0 50%;
  float: left;
  margin: 10px
 }
 </style>
<title>Le Labo Fragrances | Niche Perfumes and Candles</title>
</head>
<body>
<!-- nav -->
<%@include file="includes/layout/nav_blk.jsp" %>

    
       
    
    <%-- <div class="album py-5 bg-light">
    <div class="container" style="display: flow-root;">
    <c:forEach var="list" items="${list }">
        <div class="col product_card">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <h4><a href="product/detail?productNo=${list.productNo }&page=${pageMaker.criteria.page}"><c:out value="${list.productName }"></c:out></a></h4>
              <p class="card-text">${list.productIntro }</p>
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <label><fmt:formatNumber value="${list.productPrice}" pattern="#,###,### 원" /></label>
                </div>
              </div>
          </div>
        </div>
      </div>
    </c:forEach>
    </div>
  </div> --%>
  
  <h1>Searching</h1>
  <div>${list }</div>
  <div>${pageMaker }</div>
    
</body>
<!-- footer -->
<%@include file="includes/admin/footer.jsp" %>
</html>