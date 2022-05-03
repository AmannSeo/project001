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
    <link rel="stylesheet" href="/resources/css/admin/noticeInsert.css"> 
    
<title>글 등록</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;">
  <%@include file="../includes/admin/admin_menu.jsp" %>
  <div class="wrap">
  
    <div class="noticeInsert_wrap">
    <form id="noticeInsert_form" method="POST">
      <div class="col-md-7 col-lg-8 content_wrap">
        <div class="row g-3">
        
          <div class="form_section_noticeTitle">
            <div class="col-12 form_section_title">
              <label class="form-label">제목</label>
            </div>
            <div class="input-group has-validation form_section_content">
              <input class="form-control"  type="text" name="noticeTitle">
              <span class="warn_title">제목을 입력해주세요.</span>
            </div>
          </div>
          
          <div class="form_section_noticeName">
            <div class="col-12 form_section_title">
              <label class="form-label">작성자</label>
            </div>
            <div class="input-group form_section_content">
              <input class="form-control" type="text" name="noticeName" value="${sessionMemberVo.memberName }" readonly="readonly">
            </div>
          </div>
          
          <div class="form_section_noticeContent">
            <div class="col-12 form_section_title">
              <label class="form-label">내용</label>
            </div>
            <div class="input-group form_section_content">
              <textarea class="form-control" rows="10" cols="40" style="resize: none;" name="noticeContent"></textarea>
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
    	  let title = $('input[name=noticeTitle]').val(); // 글 제목
    	  let content = $('textarea[name=noticeContent]').val(); // 글 내용
    	  
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
    			$('#noticeInsert_form').attr("action", "/admin/noticeInsert")
  	  	    	$('#noticeInsert_form').submit();
    	  } else {
    		  return;
    	  }
    	  
    	
      }); // end insertBtn.click()
      
      $('#cancelBtn').click(function(){
    	  location = '/admin/noticeList'
      });
  }); // end document()
  </script>
</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>













