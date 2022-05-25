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
    <script src="https://code.jquery.com/jquery-3.4.1.js"
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous">></script>
    
    <!-- reset CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />

    <!-- index/css -->
    <link rel="stylesheet" href="/resources/css/admin/productList.css">
    
    <!-- custom css -->
    <link rel="stylesheet" href="/resources/css/includes/page.css">
  
<title>상품 목록</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;">
  <%@include file="../includes/admin/admin_menu.jsp" %>
  <div class="productList_wrapper" style="width: 100%">
    <div class="productList_wrap">
      <h2>상품 목록</h2>
      <div class="product_list" style="padding: 50px 0;">
      <!-- 상품이 존재 O -->
        <c:if test="${listCheck != 'empty' }">
          <table class="product_list_table">
            <thead>
              <tr>
                <!-- <th class="list_no th_column_0">상품이미지</th> -->
                <th class="list_no th_column_01">상품번호</th>
                <th class="list_name th_column_02">상품명</th>
                <th class="list_category th_column_03">카테고리</th>
                <th class="list_price th_column_04">상품 가격</th>
                <th class="list_amount th_column_05">상품 수량</th>
                <th class="list_date th_column_06">상품 등록날짜</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="list" items="${list }">
                <tr>
                  <%-- <td>
                    <div class="image_wrap bd-placeholder-img card-img-top" data-bookid="${list.imageList[0].productNo}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
                      <img>
                   </div>
                  </td> --%>
                  <td><c:out value="${list.productNo }"></c:out></td>
                  <td><a href="productDetail?productNo=${list.productNo }"><c:out value="${list.productName }"></c:out></a></td>
                  <td><c:out value="${list.cateCode }"></c:out></td>
                  <td>
                  <fmt:formatNumber value="${list.productPrice}" pattern="#,###,### 원" />
                  </td>
                  <td><c:out value="${list.productAmount }"></c:out></td>
                  <fmt:formatDate value="${list.productRegDate }"
                    pattern="yyyy년 MM월 dd일" var="productRegDate"/>
                  <td><c:out value="${productRegDate }"></c:out></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </c:if>
        
        <!-- 게시물 X -->
        <c:if test="${listCheck == 'empty'}">
          <div class="table_empty">
            등록된 상품이 없습니다.
          </div>
        </c:if>     
      </div>
      
    
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
      
        
      <!-- 검색 영역 -->
      <div class="search_wrap">
      	<form id="searchForm" action="/admin/productList" method="get">
      		<div class="search_input">
      			<input type="text" name="keyword" value='<c:out value="${pageMaker.criteria.keyword}"></c:out>'>
      			<input type="hidden" name="page" value='<c:out value="${pageMaker.criteria.page }"></c:out>'>
      			<input type="hidden" name="numsPerPage" value='${pageMaker.criteria.numsPerPage}'>
      			<input type="hidden" name="type" value="G">
      			<button class='btn search_btn'>검 색</button>                				
      		</div>
      	</form>
      </div>
      
      <!-- 상품 등록 버튼 -->
      <div class="pro_reg_btn">
        <a href="productReg"><input type="button" value="상품 등록"></a>
      </div>
      
      
    </div>
  </div>
  
</div>
 
  
  
  <!-- BoardController -> registerPOST() 에서 보낸 데이터 저장 -->
  <input type="hidden" id="insertAlert" value="${insert_result }">
  
  
  <script>
  
	$(document).ready(function(){
	    let result = '<c:out value="${insert_result}"/>';
	    let searchForm = $('#searchForm');
	    
	    checkResult(result);
	    
	    function checkResult(result){
	        if(result === ''){
	            return;
	        }
	        alert("상품'${insert_result}'(을)를 등록하였습니다.'");
	    }
  
	    
    	
    	
	    /* 검색 버튼 동작 */
	    $("#searchForm button").on("click", function(e){
	    	
	    	e.preventDefault();
	    	
	    	/* 검색 키워드 유효성 검사 */
	    	if(!searchForm.find("input[name='keyword']").val()){
	    		alert("키워드를 입력하십시오");
	    		return false;
	    	}
	    	
	    	searchForm.find("input[name='pageNum']").val("1");
	    	
	    	searchForm.submit();
	    	
	    });
	});
  

  
  </script>
</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>




