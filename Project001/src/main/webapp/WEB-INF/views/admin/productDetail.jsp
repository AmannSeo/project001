<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
.content_wrap {
  margin: 40px;
}
.detail_btn {
  margin-top: 40px;
  margin-bottom : 20px;
}
.detail_btn button {
  width : 120px;
  margin-right: 1rem !important;
}
#btn_mod {
  color : black;
   border-color: black;
}
#btn_mod:active {
  color : white;
  background-color: green !important;
  border-color: green !important;
}
#btn_mod:hover {
  color : white;
  background-color: green !important;
  border-color: green !important;
}
#btn_del {
  color : black;
  border-color: black;
}
#btn_del:active {
  color : white;
  background-color: red !important;
  border-color: red !important;
}
#btn_del:hover {
  color : white;
  background-color: red !important;
  border-color: red !important;
}
#result_card img{
    max-width: 100%;
      height: auto;
      display: block;
      padding: 5px;
      margin-top: 10px;
      margin: auto; 
}
</style>

<title>${product.productName }</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;">
  <%@include file="../includes/admin/admin_menu.jsp" %>

  <div class="wrapper">
    <div class="wrap">
      <div class="col-md-7 col-lg-8 content_wrap">
        <div class="row g-3">
          <div class="prodcut_name">
            <h3>${product.productName }</h3>
          </div>

            <div class="col-12 form_section">
              <div class="form_section_title">
                <label>상품 이미지</label>
              </div>
              <div class="form_section_content">

                <div id="uploadResult"></div>
              </div>
            </div>

            <div class="col-12">
            <label for="productNo" class="form-label">상품 번호</label>
            <div class="input-group has-validation">
              <input class="form-control" id="productNo" value="${product.productNo }" readonly="readonly">
            </div>
          </div>
    
          <div class="col-12">
            <label for="productName" class="form-label">상품명</label>
            <input class="form-control" id="productName" value="${product.productName }" readonly="readonly">
          </div>
    
          <div class="col-12">
            <label for="productCategory" class="form-label">카테고리</label>
            <input class="form-control" id="productCategory" value="${product.cateCode }" readonly="readonly">
          </div>
    
          <div class="col-12">
            <label for="proudctPrice" class="form-label">가격</label>
            <input class="form-control" id="productPrice" value="<fmt:formatNumber value="${product.productPrice}" pattern="#,###,### 원" />" readonly="readonly">
          </div>
          
          <div class="col-12">
            <label for="productAmount" class="form-label">수량</label>
            <input class="form-control" id="productPrice" value="<fmt:formatNumber value="${product.productAmount }" pattern="###,### 개" />" readonly="readonly">
          </div>
          
          <div class="col-12">
            <label for="productRegDate" class="form-label">등록 날짜</label>
            <fmt:formatDate value="${product.productRegDate }" 
              pattern="yyyy년MM월dd일 HH시mm분ss초" var="productRegDate"/>
            <input class="form-control" id="productPrice" value="${productRegDate }" readonly="readonly">
          </div>
          
          <div class="col-12">
            <label for="productCategory" class="form-label">상품 소개</label>
            <textarea class="form-control" rows="10" cols="50" style="resize: none;" readonly="readonly">${product.productIntro }</textarea>
          </div>
    
        </div>
    
      <div class="detail_btn">
        <a href="productList?page=${page }"><button type="button" id="btn_join" class="btn btn-primary">목록</button></a>
        <a href="productUpdate?productNo=${product.productNo }&page=${page}"><button type="button" id="btn_mod" class="btn btn-outline-primary me-2 ">수정</button></a>
        <a href="productDelete?productNo=${product.productNo }"><button type="button" id="btn_del" class="btn btn-outline-primary me-2">삭제</button></a>
      </div>
      
    </div>
    
    </div>
  </div>
</div>


<script type="text/javascript">

$(document).ready(function(){
   
    /* 이미지 정보 호출 */
    let productNo = '<c:out value="${product.productNo }"/>';
    let uploadResult = $("#uploadResult");
    
    $.getJSON("/getAttachList", {productNo : productNo}, function(arr){	
		
        if(arr.length === 0){		
            
            let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/imgs/noimg.png'>";
			str += "</div>";
			
			uploadResult.html(str);
            
			return;
		}
        
		let str = "";
		let obj = arr[0];	
		
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "</div>";		
		
		uploadResult.html(str);						
		
	});
    
    
   
});

</script>

</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>














