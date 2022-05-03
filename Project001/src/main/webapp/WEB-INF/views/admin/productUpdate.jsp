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

    <!-- index/css -->
    <link rel="stylesheet" href="/resources/css/admin/productReg.css"> 
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
      <form id="productUpdate_form" action="/admin/productUpdate" method="post" enctype="multipart/form-data">
        <div class="col-md-7 col-lg-8 content_wrap">
          <div class="row g-3">
            <div class="product_name">
              <h3>${product.productName }</h3>
            </div>


              <div class="form_section">
                <div class="form_section_title">
                  <label>상품 이미지</label>
                </div>
                <div class="form_section_content">
                  <input type="file" id="fileItem" name='uploadFile'
                    style="height: 30px;">
                  <div id="uploadResult"></div>
                </div>
              </div>


              <div class="col-12">
              <label for="productNo" class="form-label">상품 번호</label>
              <div class="input-group has-validation">
                <input class="form-control" id="productNo" value="${product.productNo }" readonly="readonly" name="productNo">
              </div>
            </div>
      
            <div class="col-12">
              <label for="productName" class="form-label">상품명</label>
              <input class="form-control" id="productName" value="${product.productName }" name="productName">
            </div>
      
            <div class="col-12">
              <label for="productCategory" class="form-label">카테고리</label>
              <input class="form-control" id="productCategory" value="${product.cateCode }" readonly="readonly" name="cateCode">
            </div>
      
            <div class="col-12">
              <label for="proudctPrice" class="form-label">가격</label>
              <input class="form-control" id="productPrice" value="<fmt:formatNumber value="${product.productPrice}"/>" name="productPrice">
            </div>
            
            <div class="col-12">
              <label for="productAmount" class="form-label">수량</label>
              <input class="form-control" id="productPrice" value="<fmt:formatNumber value="${product.productAmount }"/>" name="productAmount">
            </div>
            
            <div class="col-12">
              <label for="productRegDate" class="form-label">등록 날짜</label>
              <fmt:formatDate value="${product.productRegDate }" 
                pattern="yyyy년MM월dd일 HH시mm분ss초" var="productRegDate"/>
              <input class="form-control" id="productPrice" value="${productRegDate }" readonly="readonly">
            </div>
            
            <div class="col-12">
              <label for="productIntro" class="form-label">상품 소개</label>
              <textarea class="form-control" rows="10" cols="50" style="resize: none;" name="productIntro">${product.productIntro }</textarea >
            </div>
      
          </div>
      
        <div class="detail_btn">
          <button type="submit" id="btn_update" class="btn_update btn btn-outline-primary me-2 ">수정</button>
          <a href="productDetail?productNo=${product.productNo }&page=${pageMaker.criteria.page}"><button type="button" id="btn_del" class="btn btn-outline-primary me-2">삭제</button></a>
        </div>
        
      </div>
    </form>
    </div>
  </div>
  
  
</div>

<script type="text/javascript">

$(document).ready(function(){
   
    /* 기존 이미지 출력 */
	let productNo = '<c:out value="${product.productNo}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("/product/getAttachList", {productNo : productNo}, function(arr){
		
		console.log(arr);
		
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
		str += "<img src='/product/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
		str += "</div>";
		
		uploadResult.html(str);			
		
	});// GetJSON
    
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		$("#result_card").remove();
	}
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($("#result_card").length > 0){
			deleteFile();
		}
				
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});		

		
	});
		
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		//replace 적용 하지 않아도 가능
		//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/product/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
		str += "</div>";		
		
   		uploadResult.append(str);     
        
	}
   
});

</script>

<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</body>
</html>

















