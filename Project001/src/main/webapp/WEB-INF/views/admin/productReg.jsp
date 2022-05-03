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

    <!-- index/css -->
    <link rel="stylesheet" href="/resources/css/admin/productReg.css">  
    
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
<style type="text/css">
.wrap {
  padding: 60px;
}
.btn_section {
  margin: 40px 0;
}
#insertBtn {
  color : black;
  border-color: black;
}
#insertBtn:active {
  color : white;
  background-color: green !important;
  border-color: green !important;
}
#insertBtn:hover {
  color : white;
  background-color: green !important;
  border-color: green !important;
}
#cancelBtn {
  color : black;
  border-color: black;
}
#cancelBtn:active {
  color : white;
  background-color: red !important;
  border-color: red !important;
}
#cancelBtn:hover {
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
  #result_card {
    position: relative;
  }
  .imgDeleteBtn{
      position: absolute;
      top: 0;
      right: 5%;
      background-color: #ef7d7d;
      color: wheat;
      font-weight: 900;
      width: 30px;
      height: 30px;
      border-radius: 50%;
      line-height: 26px;
      text-align: center;
      border: none;
      display: block;
      cursor: pointer;  
}
    </style>
    
<title>상품 등록</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;" >
  <%@include file="../includes/admin/admin_menu.jsp" %>

    <div class="wrap">
      <div class="productReg_wrap">
        <form id="productReg_form" method="POST" enctype="multipart/form-data">
          <div class="col-md-7 col-lg-8 content_wrap">
            <div class="row g-3">
          <div class="title">
            <h3>상품 등록하기</h3>
          </div>
          <hr>
          
          
          <!-- 이미지 업로드 영역 -->
       <!-- 
          <div class="form_sectioin_img">
            <input type="file" multiple id="fileItem" name='uploadFile' style="height: 30px;">
          </div>
 -->
          <div class="form_sectioin_img">
            <div class="form_section_title">
               <label>상품 이미지</label>
            </div> 
            <div class="form_section_content">
              <input type="file" multiple id="fileItem" name='uploadFile' style="height: 30px">
              <div id="uploadResult"> 
                <!-- <div id="result_card">
                  <div class="imgDeleteBtn">x</div>
                  <img src="/resources/imgs/logo_blk.png">
                </div> -->
              </div>
            </div>
          </div>
          
          <div class="form_section_pname">
            <div class="col-12 form_section_title">
              <label for="productNo" class="form-label">상품명</label>
            </div>
            <div class="input-group has-validation form_section_content">
              <input class="form-control" type="text" name="productName" placeholder="상품명을 입력해주세요.">
              <span class="warn_productName">상품명을 입력해주세요.</span>
            </div>
          </div>
          
          <div class="form_section_category">
            <div class="col-12 form_section_title">
              <label for="productNo" class="form-label">카테고리</label>
            </div>
            <div class="form_section_content">
              <div class="cate_wrap">
    				<span>대분류</span>
    				<select class="form-control cate1">
    					<option selected value="none">&nbsp;▼ 선택</option>
    				</select>
    			</div>
    			<div class="cate_wrap">
    				<span>중분류</span>
    				<select class="form-control cate2">
    					<option selected value="none">&nbsp;▼ 선택</option>
    				</select>
    			</div>
    			<div class="cate_wrap">
    				<span>소분류</span>
    				<select class="form-control cate3" name="cateCode">
    					<option selected value="none">&nbsp;▼ 선택</option>
    				</select>
    			</div> 
              <span class="warn_category">카테고리를 선택해주세요.</span>
            </div>
          </div>
          
          <div class="form_section_price">
            <div class="col-12 form_section_title">
              <label for="proudctPrice" class="form-label">가격</label>
            </div>
            <div class="form_section_content">
              <input class="form-control" type="number" name="productPrice" placeholder="가격을 입력해주세요.">
              <span class="warn_price">가격을 입력해주세요.</span>
            </div>
          </div>
          
          <div class="form_section_amount">
            <div class="col-12 form_section_title">
              <label for="productAmount" class="form-label">수량</label>
            </div>
            <div class="form_section_content">
              <input class="form-control" type="number" name="productAmount" min="0" placeholder="수량을 입력해주세요.">
              <span class="warn_amount">수량을 입력해주세요.</span>
            </div>
          </div>
          
          <div class="form_section_prointro">
            <div class="col-12 form_section_title">
              <label for="productIntro" class="form-label">상품소개</label>
            </div>
            <div class="form_section_content">
              <textarea class="form-control" rows="10" cols="50" style="resize: none;" name="productIntro" placeholder="상품소개를 입력해주세요."></textarea>
              <span class="warn_proIntro">상품소개를 입력해주세요.</span>
            </div>
          </div>
          
          <hr style="margin-top: 40px;">
          
        </div>
      </div>
    </form>
    </div>
    
    
    <div class="btn_section">
      <button type="button" id="cancelBtn" class="btn btn-outline-primary me-2 cancel_btn">취소</button>
      <button type="button" id="insertBtn" class="btn btn-outline-primary me-2 insert_btn">등록</button>
    </div>
  </div>
</div>  

  <script type="text/javascript">
  $(document).ready(function(){
      $('#insertBtn').click(function(){
    	  
    	  // 검사 통과 유무 변수
    	  let nameCheck = false; // 상품명
    	  let categoryCheck = false; // 상품 카테고리
    	  let priceCheck = false; // 상품 가격
    	  let amountCheck = false; // 상품 수량
    	  let introCheck = false; // 상품 소개
    	  
    	  // 입력값 변수
    	  let pName = $('input[name=productName]').val(); // 상품명
    	  let category = $('select[name=cateCode]').val(); // 상품 카테고리
    	  let price = $('input[name=productPrice]').val(); // 상품 가격
    	  let amount = $('input[name=productAmount]').val(); // 상품 수량
    	  let proIntro = $('textarea[name=productIntro]').val(); // 상품 소개
    	  
    	  // 상품명 공란 체크
    	  if(pName === ""){
    		  $('.warn_productName').css('display', 'block');
    		  nameCheck = false;
          } else{
              $('.warn_productName').css('display', 'none');
              nameCheck = true;
    	  }
    	  
    	  // 상품 카테고리 공란 체크
    	  if(category === "none"){
    		  $('.warn_category').css('display', 'block');
    		  categoryCheck = false;
          } else{
              $('.warn_category').css('display', 'none');
              categoryCheck = true;
    	  }
    	  
    	  // 상품 가격 공란 체크
    	  if(price === ""){
    		  $('.warn_price').css('display', 'block');
    		  priceCheck = false;
          } else{
              $('.warn_price').css('display', 'none');
              priceCheck = true;
    	  }
    	  
    	  // 상품 수량 공란 체크
    	  if(amount === ""){
    		  $('.warn_amount').css('display', 'block');
    		  amountCheck = false;
          } else{
              $('.warn_amount').css('display', 'none');
              amountCheck = true;
    	  }
    	  
    	  // 상품 소개 공란 체크
    	  if(proIntro === ""){
    		  $('.warn_proIntro').css('display', 'block');
    		  introCheck = false;
          } else{
              $('.warn_proIntro').css('display', 'none');
              introCheck = true;
    	  }
    	  
    	  if(nameCheck&&categoryCheck&&priceCheck&&amountCheck&&introCheck){
    			$('#productReg_form').attr("action", "/admin/productReg")
  	  	    	$('#productReg_form').submit();
    	  } else {
    		  return;
    	  }
    	  
    	
      }); // end insertBtn.click()
      
      $('#cancelBtn').click(function(){
    	  location = '/admin/productList'
      });
      
      
      
  }); // end document()
  
  // category
  // 서버로 부터 전달 받은 JSON 데이터를 javacsript가 바로 사용할 수 없음
  // JSON 데이터를 자바스크립트 객체로 변환해주어야 함.
  // 자바스크립트에서는 JSON 문자열 데이터를 자바크립트 객체로 변화해주는 메소드 제공
  let cateList = JSON.parse('${cateList}')
  
  // 등급에 맞게 분류하여 배열에 저장
  let cate1Array = new Array();
  let cate2Array = new Array();
  let cate3Array = new Array();
  let cate1Obj = new Object();
  let cate2Obj = new Object();
  let cate3Obj = new Object();
  
  let cateSelect1 = $(".cate1");		
  let cateSelect2 = $(".cate2");
  let cateSelect3 = $(".cate3");
  
  /* 카테고리 배열 초기화 메서드 */
	function makeCateArray(obj,array,cateList, tier){
		for(let i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);				
				
			}
		}
	}	
  
	/* 배열 초기화 */
	makeCateArray(cate1Obj,cate1Array,cateList,1);
	makeCateArray(cate2Obj,cate2Array,cateList,2);
	makeCateArray(cate3Obj,cate3Array,cateList,3);
	
	
	$(document).ready(function(){
		console.log(cate1Array);
		console.log(cate2Array);
		console.log(cate3Array);
	});
	
	
	 // 대분류
	for(let i = 0; i < cate1Array.length; i++){
		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
	}
	 
	 
	// 중분류
	// 대분류의 옵션이 선택이 되었을 때 출력이 되도록 함
	// 대분류 옵션이 선택 되었을 때 실행하는 메서드
	$(cateSelect1).on("change",function(){
		// 대분류 선택 값을 가져오기
		// <option> 태그를 모두 지우고 다시 추가하는 이유는
		// 사용자가 대분류 선택해 다시 다른 대 분류를 선택했을 때
		// 기존의 <option> 태그를 없애기 위함
		
		// 대분류 선택 값을 가져오는 코드
		let selectVal1 = $(this).find("option:selected").val();	
		
		// 중분류 <option>태그를 지우고 기본적인 <option>태그를 추가하는 코드를 추가함.
		cateSelect2.children().remove();
		cateSelect2.append("<option value='none'>선택</option>");
		
		cateSelect3.children().remove();
		cateSelect3.append("<option value='none'>선택</option>");
		
		// 대분류 선택 값과 일치하는 'cateParent' 값을 가진 중분류 <option> 태그를 출력하는 코드를 추가
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
	});
	
	// 소분류
	// 중분류와 동일한 형태의 코드를 작성해야 함
	// 소분류 <option> 태그가 출력되어야 할 시점은
	// 중분류를 선택했을 때.
	$(cateSelect2).on("change",function(){
		// 중분류의 선택 값을 가져오는 코드를 추가
		let selectVal2 = $(this).find("option:selected").val();
		
		// 소분류 <option> 태그를 모두 지우고, 기본 <option> 태그를 추가하는 코드
		// 대분류가 변경되었을 때도 소분류가 초기화 되도록 코드
		// 중분류 <option> 태그를 출력하는 메서드(대분류가 변경되었을 때 동작)에 아래의 코드
		cateSelect3.children().remove();
		cateSelect3.append("<option value='none'>선택</option>");		
		
		// 소분류 <option>을 출력하는 코드
		for(let i = 0; i < cate3Array.length; i++){
			if(selectVal2 === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
			}
		}// for		
		
	});
	
   /* 이미지 업로드 */
   $("input[type='file']").on("change", function(e){
       
       /* 이미지 존재시 삭제 */
       if($(".imgDeleteBtn").length > 0){
           deleteFile();
       }
       
       let formData = new FormData(); // 첨부 파일을 서버로 전송하기 위한 코드
       let fileInput = $('input[name="uploadFile"]');
       let fileList = fileInput[0].files; // FileList 객체에 접근
       let fileObj = fileList[0]; // fileList 객체가 맞는지 확인
       
       /* console.log("fileList : " + fileList);
       console.log("fileObj : " + fileObj);
       
       console.log("fileName : " + fileObj.name);
	   console.log("fileSize : " + fileObj.size);
	   console.log("fileType(MimeType) : " + fileObj.type); */
	   
	   if(!fileCheck(fileObj.name, fileObj.size)) {
	       return false;
	   }
	   
	   /* formData.append("uploadFile", fileObj); */ // forDate 객체에 데이터를 추가하는 방법
	   
	   /* formData객체에 여러 개의 파일을 선택 */
	   for(let i = 0; i < fileList.length; i++) {
	       formData.append("uploadFile", fileList[i]);
	   }
	   
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
	    	error : function(result) {
	    	    alert("이미지 파일이 아닙니다.");
	    	}
		});	
	   
	   /* 
	   url : 서버로 요청을 보낼 url
	   processData : 서버로 전송할 데이터를 queryStirng 형태로 변환할지 여부
	   contentType : 서버로 전송되는 데이터의 content-type
	   data : 서버로 전송할 데이터
	   type : 서보 요청 타입(GET, POST)
	   dataType : 서버로부터 반환받을 데이터 타입
	    */
       
   });
   
   /* 파일 체크 */
   /* var, method related with attachFile */
   let regex = new RegExp("(.*?)\.(jpg|jpeg|png)$");
   let maxSize = 1048576; //1MB
   
   function fileCheck(fileName, fileSize) {
       
       if(fileSize >= maxSize) {
           alert("파일 사이즈 초과");
           return false;
       }
       
       if(!regex.test(fileName)) {
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
		
		// replace 적용 => 동작 o
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		// replace 적용 x => 동작 o
//		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/product/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
		str += "</div>";		
		
  		uploadResult.append(str);     
       
	}	
     
     /* 이미지 삭제 버튼 동작 */
 	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
 		
 		deleteFile();
 		
 	});
   
   
   /* 파일 삭제 메서드 */
   /* 파일 삭제 요청하는 ajax */
       
   // url : 이전 포스팅에서 작성한 파일 삭제를 수행하는 url을 작성
   // data : 객체 초기자를 활용하여 fileName 속성명에 targetFile(이미지 파일 경로) 속성 값을 부여함
   // 		서버의 메서드 파라미터에 String fileName을 선언하였기 때문에 스프링에서 해당 데이터를 매핑해 줌
   // type : 서버의 요청 방식 'POST'
   // dataType : 전송하는 targetFile은 문자 데이터이기 때문에 'text'를 지정해주었음
   // sucess : 성공할 경우 실행되는 속성
   // error : 요청이 실패 혹은 에러일 경우 실행되는 속성
   function deleteFile(){
       
       let targetFile = $(".imgDeleteBtn").data("file");
		
	   let targetDiv = $("#result_card");
       
       
       $.ajax({
          url : '/admin/deleteFile',
          data : {fileName : targetFile},
          dataType : 'text',
          type : 'POST',
          success : function(result){
              console.log(result);
              
              targetDiv.remove();
              $("input[type='file']").val("");
          },
          error : function(result){
              console.log(result);
              
              alert("파일을 삭제하지 못하였습니다.")
          }
       });
   }

  </script>
  
</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>







