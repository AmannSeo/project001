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
<%@include file="./includes/layout/nav_blk.jsp" %>

<div class="container detail_part">
  <!-- 이미지 영역 -->
  <div class="ct_left_area">
	<div class="image_wrap" data-bookid="${productInfo.imageList[0].productNo}" data-path="${productInfo.imageList[0].uploadPath}" data-uuid="${productInfo.imageList[0].uuid}" data-filename="${productInfo.imageList[0].fileName}">
		<img>
	</div>				
</div>
  
  <!-- 정보 -->
  <div class="img_part">
    <input type="hidden" name="memberNo" value="${sessionMemberVo.memberNo }">
    <input type="hidden" name="memberId" value="${sessionMemberVo.memberId }">
    
    
    <div class="col-12">
      <label for="productName" class="form-label">상품명</label>
      <input class="form-control product_name" id="productName" 
        value="${productInfo.productName }" readonly="readonly" name="productName">
    </div>
    
    <div class="col-12">
      <label for="proudctPrice" class="form-label">개당 가격</label>
      <input class="form-control product_price" id="productPrice" 
        value="${productInfo.productPrice}" readonly="readonly">
    </div>


    <div class="col-12">
      <label for="productAmount" class="form-label">수량</label>
      <input class="form-control product_amount" id="productAmount" 
        value="${productInfo.productAmount }" name="orderAmount">
    </div>
    
    <div class="col-12">
      <label for="proudctPrice" class="form-label">총 결제 가격</label>
      <input class="form-control product_price" id="resultPrice" 
        value="${productInfo.productPrice}" readonly="readonly" name="orderPrice">
    </div>
    
    
    <div class="col-12">
      <label for="productIntro" class="form-label">상품 소개</label>
      <textarea class="form-control product_intro" rows="8" cols="30" 
        style="resize: none;" readonly="readonly">${productInfo.productIntro }</textarea>
    </div>
    <hr>
    <div class="button">
        <div class="button_quantity">
          주문수량
          <input type="text" class="quantity_input" value="1">
          <span>
            <button class="btn_plus">+</button>
            <button class="btn_minus">-</button>
          </span>
        </div>  
        <div class="button_set">
          <a class="btn_cart">CART</a>
          <a class="btn_buy">BUY</a>
        </div>
    </div>
  </div>
</div> 
 
 <script>
 	/* 
 	$(document).ready(function(){
	  $("#productAmount").change(function(){
		var productPrice = $("#productPrice").val() * 1;
		var productAmount = $("#productAmount").val() * 1;
	    var totalPrice = productPrice * productAmount;
	    $("#resultPrice").val(totalPrice);
	  });
	});
 	 */
 	 
$(document).ready(function(){
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
});	//$(document).ready(function(){
    
//수량 버튼 조작
let quantity = $(".quantity_input").val();
$(".btn_plus").on("click", function(){
	$(".quantity_input").val(++quantity);
});
$(".btn_minus").on("click", function(){
	if(quantity > 1){
		$(".quantity_input").val(--quantity);	
	}
});	
// 서버로 전송할 데이터
const form = {
		memberId : '${member.memberId}',
		productNo : '${productInfo.productNo}',
		productCount : ''
}
// 장바구니 추가 버튼
	$(".btn_cart").on("click", function(e){
		form.productCount = $(".quantity_input").val();
		$.ajax({
			url: '/cart/add',
			type: 'POST',
			data: form,
			success: function(result){
				cartAlert(result);
			}
		})
	});
	
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
 </script>
<!-- footer -->
<%@include file="./includes/admin/footer.jsp" %>
</body>
</html>














