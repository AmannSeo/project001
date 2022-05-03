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
    crossorigin="anonymous">></script>
    
    <!-- reset CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />

    <!-- index/css -->
    <link rel="stylesheet" href="/resources/css/admin/productList.css">
    <link rel="stylesheet" href="/resources/css/product/index.css">
    
    <!-- custom css -->
    <link rel="stylesheet" href="/resources/css/includes/page.css">


<title>Products</title>


</head>
<body>
<!-- header -->
<%@include file="../includes/layout/nav_blk.jsp" %>


        
<main>



  <div class="album py-5 bg-light">
    <div class="container" style="display: flow-root;">
    <c:forEach var="list" items="${product }">
        <div class="col product_card">
          <div class="card shadow-sm">
            <img width="100%" height="225" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false" src="/resources${list.productImg }">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" src="/resources${list.productImg }" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"></svg>

            <div class="card-body">
              <h4><a href="detail?productNo=${list.productNo }&page=${pageMaker.criteria.page}"><c:out value="${list.productName }"></c:out></a></h4>
              <hr style="margin: 10px 0;">
              <p class="card-text">${list.productIntro }</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="product_price">
                  <label><fmt:formatNumber value="${list.productPrice}" pattern="#,###,###" />&nbsp;원</label>
                </div>
              </div>
          </div>
        </div>
      </div>
    </c:forEach>
    </div>
 
  
    
      
    <div class="paging_num">
      <ul class="pageMaker">
        <c:if test="${pageMaker.hasPrev }"> <!-- 페이지에 이전이 있을경우에만 버튼을 만든다 -->
          <li><a href="index?page=${pageMaker.startPageNo - 1 }">이전</a></li>
        </c:if>
      
        <!-- 반복문에 시작과 끝이 있을 경우 -->
        <c:forEach begin="${pageMaker.startPageNo }" 
        end="${pageMaker.endPageNo }" var="num"> 
          <li class="pageMaker_btn ${pageMaker.criteria.page == num ? "active":""}">
            <a href="index?page=${num }">${num }</a>
          </li>
        </c:forEach>
        
        <c:if test="${pageMaker.hasNext }">
          <li class="pageMaker_btn hasNext">
            <a href="index?page=${pageMaker.endPageNo + 1 }">다음</a>
          </li>
        </c:if>
      </ul>
    </div>


  </div>
</main>
  
  
  <!-- BoardController -> registerPOST() 에서 보낸 데이터 저장 -->
  <input type="hidden" id="insertAlert" value="${insert_result }">
  
  
  
</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>
