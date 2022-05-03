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
    <link rel="stylesheet" href="/resources/css/admin/helpInsert.css">  
<title>글 등록</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;">
  <%@include file="../includes/admin/admin_menu.jsp" %>
  <div class="wrap">
  
    <div class="helpInsert_wrap">
      <form id="helpInsert_form" method="POST">
      <div class="col-md-7 col-lg-8 content_wrap">
        <div class="row g-3">
      
        <div class="form_section_helpTitle">
          <div class="col-12 form_section_title">
            <label class="form-label">제목</label>
          </div>
          <div class="form_section_content">
            <input class="form-control" type="text" name="helpTitle">
            <span class="warn_title">제목을 입력해주세요.</span>
          </div>
        </div>
        
        <div class="form_section_helpName">
          <div class="col-12 form_section_title">
            <label class="form-label">작성자</label>
          </div>
          <div class="form_section_content">
            <input class="form-control" type="text" name="helpName" value="${sessionMemberVo.memberName }" readonly="readonly">
          </div>
        </div>
        
        <div class="form_section_helpContent">
          <div class="col-12 form_section_title">
            <label class="form-label">내용</label>
          </div>
          <div class="input-group form_section_content">
            <textarea class="form-control" rows="20" cols="40" style="resize: none;" name="helpContent"></textarea>
            <span class="warn_content">내용을 입력해주세요.</span>
          </div>
        </div>
        
      </div>
     </div> 
    </form>
    </div>
    
    <div class="btn_section">
      <input type="button" id="cancelBtn" class="btn cancel_btn" value="취소">
      <input type="button" id="insertBtn" class="btn insert_btn" value="등록">
    </div>
  </div>
</div>
  <script type="text/javascript">
  $(document).ready(function(){
      $('#insertBtn').click(function(){
    	  
    	  // 검사 통과 유무 변수
    	  let titleCheck = false; // 제목 메세지
    	  let contentCheck = false; // 내용 메세지
    	 
    	  
    	  // 입력값 변수
    	  let title = $('input[name=helpTitle]').val(); // 글 제목
    	  let content = $('textarea[name=helpContent]').val(); // 글 내용
    	  
    	  // 제목 공란 체크
    	  if(title === ""){
    		  $('.warn_title').css('display', 'block');
    		  titleCheck = false;
          } else{
              $('.warn_title').css('display', 'none');
              titleCheck = true;
    	  }
    	  
    	  // 내용 공란 체크
    	  if(content === ""){
    		  $('.warn_content').css('display', 'block');
    		  contentCheck = false;
          } else{
              $('.warn_content').css('display', 'none');
              contentCheck = true;
    	  }
    	  
    	  if(titleCheck&&contentCheck){
    			$('#helpInsert_form').attr("action", "/admin/helpInsert")
  	  	    	$('#helpInsert_form').submit();
    	  } else {
    		  return;
    	  }
    	  
    	
      }); // end insertBtn.click()
      
      $('#cancelBtn').click(function(){
    	  location = '/admin/helpList'
      });
  }); // end document()
  </script>
</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>













