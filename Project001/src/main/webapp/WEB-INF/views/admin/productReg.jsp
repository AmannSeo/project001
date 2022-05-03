<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
<title>상품 등록</title>
</head>
<body>
  <!-- header -->
  <%@include file="../includes/admin/header.jsp" %>
  <div class="wrap">
    <div class="productReg_wrap">
      <form id="productReg_form" method="POST">
      <div class="form_section_pname">
        <div class="form_section_title">
          <label>상품명</label>
        </div>
        <div class="form_section_content">
          <input type="text" name="productName">
          <span class="warn_productName">상품명을 입력해주세요.</span>
        </div>
      </div>
      <div class="form_section_category">
        <div class="form_section_title">
          <label>카테고리</label>
        </div>
        <div class="form_section_content">
          <select name="productCategory">
            <option value="none" selected>=== 선택 ===</option>
            <option value="FINE FRAGRANCES">FINE FRAGRANCES</option>
            <option value="HOME CREATIONS">HOME CREATIONS</option>
            <option value="BODY - HAIR - FACE">BODY - HAIR - FACE</option>
            <option value="GROOMING">GROOMING</option>
          </select>
          <span class="warn_category">카테고리를 선택해주세요.</span>
        </div>
      </div>
      <div class="form_section_price">
        <div class="form_section_title">
          <label>가격</label>
        </div>
        <div class="form_section_content">
          <input type="number" name="productPrice">
          <span class="warn_price">가격을 입력해주세요.</span>
        </div>
      </div>
      <div class="form_section_amount">
        <div class="form_section_title">
          <label>수량</label>
        </div>
        <div class="form_section_content">
          <input type="number" name="productAmount" min="0">개
          <span class="warn_amount">수량을 입력해주세요.</span>
        </div>
      </div>
      <div class="form_section_prointro">
        <div class="form_section_title">
          <label>상품소개</label>
        </div>
        <div class="form_section_content">
          <textarea rows="20" cols="40" style="resize: none;" name="productIntro"></textarea>
          <span class="warn_proIntro">상품소개를 입력해주세요.</span>
        </div>
      </div>
    </form>
    </div>
    <div class="form_section">
      <div class="form_section_title">
        <label>상품 이미지</label>
      </div>
      <div class="form_section_content">
          <input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
      </div>
    </div>  
    
    <div class="btn_section">
      <input type="button" id="cancelBtn" class="btn cancel_btn" value="등록 취소">
      <input type="button" id="insertBtn" class="btn insert_btn" value="상품 등록">
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
    	  let category = $('select[name=productCategory]').val(); // 상품 카테고리
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
      
      
      // 이미지 업로드
      // type이 file인 <input> 태그에 접근하기 위해서 먼저 해당 <input>태그가 
      // chang 이벤트가 일어났을 때 동작하는 메서드를 <script> 태그에 추가함.
      $("input[type='file']").on("change", function(e){
    	// 첨부 파일을 서버로 전송하기 위해서 FormDate 객체를 사용해야 함
    	// FormDate는 가상의 <form> 태그라고 생각하면 됌.
    	// 화면의 이동 없이 첨부파일을 서버로 전송해야 함.
    	let formData = new FormData();
    	  
    	// fileList 객체가 맞는지 확인하기 위해 변수를 선언
  		let fileInput = $('input[name="uploadFile"]');
  		let fileList = fileInput[0].files;
  		// FileList 객체의 데이터 타입이 배열이기 때문에
  		// 일반적으로 배열의 요소에 접근하는 방식인 인덱스를 사용하여 file 객체에 접근
  		let fileObj = fileList[0];
      	
    	// fileList로 초기화 한 뒤 console.log를 통해
    	// fileList인지 확인
      	console.log("fileList : " + fileList);
    	// file 객체를 담기 위한 변수를 선언하여 file 객체로 초기화 해준 후,
    	// 위와 마찬가지라 console를 통해 해당 객체가 어떠한 객체인지 확인
    	console.log("fileObj : " + fileObj);
    	
    	// file 객체에 담긴 데이터가 정말 <input> 태그를 통해 
    	// 선택한 파일의 데이터가 맞는지를 확인
    	console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);

		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		// FormData 객체에 데이터를 추가하는 방법
		// FormData.append(key, value) 메소드를 사용
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json'
		});	

		
      });
      
      // 이미지 업로드 크기 제한 및 형식 제한
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
  }); // end document()
  </script>
  
</body>
</html>







