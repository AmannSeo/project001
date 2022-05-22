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
    <link rel="stylesheet" href="resources/css/main.css">  
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

  
  <div class="content_area">
  	<!-- 게시물 o -->
	<c:if test="${listCheck != 'empty'}">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <%-- 
              <table class="type_list">
                <colgroup>
                  <col width="110">
                  <col width="*">
                  <col width="120">
                  <col width="120">
                  <col width="120">
                </colgroup>
                <tbody id="searchList>">
                  <c:forEach items="${list}" var="list">
                    <tr>
                      <td class="image">
                        <div class="image_wrap" data-bookid="${list.imageList[0].productNo}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
                          <img>
                        </div>
                      </td>
                      <td class="detail">
                        <div class="category">
                          ${list.cateName}
                        </div>
                        <div class="title">
                          ${list.productName}
                        </div>
                      </td>
                      <td class="price">
                        <div class="org_price">
                            ${list.productPrice}
                        </div>
                      </td>
                      <td class="option"></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
                 --%>
                 
                <c:forEach items="${list}" var="list">
                  <div class="col">
                    <div class="card shadow-sm">
                      <div class="image_wrap bd-placeholder-img card-img-top" data-bookid="${list.imageList[0].productNo}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
                          <img>
                      </div>
          
                      <div class="card-body">
                        <div class="category">
                          ${list.cateName}
                        </div>
                        <div class="title">
                          <a href="/detail/${list.productName}">
                            ${list.productName}
                          </a>
                        </div>
                        <div class="price">
                            ${list.productPrice}
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-outline-secondary">Buy</button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">Cart</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>
          </div>
	 </div>
  
      <!-- 페이징 -->
      <div class="paging_num">
        <ul class="pageMaker">
          <c:if test="${pageMaker.hasPrev }"> <!-- 페이지에 이전이 있을경우에만 버튼을 만든다 -->
            <li class="pageMaker_btn hasPrev">
              <a href="productList?page=${pageMaker.startPageNo - 1 }">이전</a>
            </li>
          </c:if>
        
          <!-- 반복문에 시작과 끝이 있을 경우 -->
          <c:forEach begin="${pageMaker.startPageNo }" 
          end="${pageMaker.endPageNo }" var="num"> 
            <li class="pageMaker_btn ${pageMaker.criteria.page == num ? "active":""}">
              <a href="productList?page=${num }">${num }</a>
            </li>
          </c:forEach>
          
         
          
          <c:if test="${pageMaker.hasNext }">
            <li class="pageMaker_btn hasNext">
              <a href="productList?page=${pageMaker.endPageNo + 1 }">다음</a>
            </li>
          </c:if>
        </ul>
      </div>
      
      <form id="moveForm" action="/search" method="get" >
        <input type="hidden" name="page" value="${pageMaker.criteria.page}">
        <input type="hidden" name="numsPerPage" value="${pageMaker.criteria.numsPerPage}">
        <input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
        <input type="hidden" name="cateCode" value="<c:out value="${pageMaker.criteria.cateCode}"/>">
        <input type="hidden" name="type" value="${pageMaker.criteria.type}">
      </form>
  
	</c:if>
	<!-- 게시물 x -->
	<c:if test="${listCheck == 'empty'}">
		<div class="table_empty">
			검색결과가 없습니다.
		</div>
	</c:if>
  </div>
    
</body>
<script type="text/javascript">
/* 페이지 이동 버튼 */
const moveForm = $('#moveForm');

$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});
</script>
<!-- footer -->
<%@include file="includes/admin/footer.jsp" %>
</html>