<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<title>${product.productName }</title>
<style type="text/css">
.detail_part {
  display: flex;
}
.img_part, .img_part {
  width: 50%;
  padding: 20px;
}
.col-12 {
  margin-top: 10px;
}

</style>
</head>
<body>
<!-- header -->
<%@include file="../includes/layout/nav_blk.jsp" %>

<div class="container detail_part">
  <!-- 이미지 영역 -->
  <div class="ct_left_area">
	<div class="image_wrap" data-bookid="${goodsInfo.imageList[0].productNo}" data-path="${goodsInfo.imageList[0].uploadPath}" data-uuid="${goodsInfo.imageList[0].uuid}" data-filename="${goodsInfo.imageList[0].fileName}">
		<img>
	</div>				
</div>
  
  <!-- 정보 -->
  <div class="img_part">
    <form action="/member/order" method="post">
    <input type="hidden" name="memberNo" value="${sessionMemberVo.memberNo }">
    <input type="hidden" name="memberId" value="${sessionMemberVo.memberId }">
    
    
    <div class="col-12">
      <label for="productName" class="form-label">상품명</label>
      <input class="form-control product_name" id="productName" 
        value="${product.productName }" readonly="readonly" name="productName">
    </div>
    
    <div class="col-12">
      <label for="proudctPrice" class="form-label">개당 가격</label>
      <input class="form-control product_price" id="productPrice" 
        value="${product.productPrice}" readonly="readonly">
    </div>


    <div class="col-12">
      <label for="productAmount" class="form-label">수량</label>
      <input class="form-control product_amount" id="productAmount" 
        value="${product.productAmount }" name="orderAmount">
    </div>
    
    <div class="col-12">
      <label for="proudctPrice" class="form-label">총 결제 가격</label>
      <input class="form-control product_price" id="resultPrice" 
        value="${product.productPrice}" readonly="readonly" name="orderPrice">
    </div>
    
    
    <div class="col-12">
      <label for="productIntro" class="form-label">상품 소개</label>
      <textarea class="form-control product_intro" rows="8" cols="30" 
        style="resize: none;" readonly="readonly">${product.productIntro }</textarea>
    </div>
    <hr>
    <button type="submit" class="btn btn-primary">구매하기</button>
   </form>
  </div>
</div> 
 
 <script>
 	$(document).ready(function(){
	  $("#productAmount").change(function(){
		var productPrice = $("#productPrice").val() * 1;
		var productAmount = $("#productAmount").val() * 1;
	    var totalPrice = productPrice * productAmount;
	    $("#resultPrice").val(totalPrice);
	  });
	});
 	
 	
 	/* 이미지 삽입 */
 	const bobj = $(".image_wrap");

 	if(bobj.data("productNo")){
 		const uploadPath = bobj.data("path");
 		const uuid = bobj.data("uuid");
 		const fileName = bobj.data("filename");
 		
 		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
 		
 		bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
 	} else {
 		bobj.find("img").attr('src', '/resources/imgs/noimg.png');
 	}
 </script>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</body>
</html>














