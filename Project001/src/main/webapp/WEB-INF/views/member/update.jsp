<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
   
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" 
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"></script>
    
    <!-- reset CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
   
    <!-- main/css -->
    <link rel="stylesheet" href="/resources/css/member/join.css">  
    
    <link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css">  
    <link rel="stylesheet" href="/resources/css/bootstrap/form-validation.css">  
    
    <title>회원가입</title>

</head>
<body>
<!-- header -->
<%@include file="../includes/layout/nav_blk.jsp" %>
<!-- bootstrap template -->
<div class="container" style="border-top : 1px solid black">
  <main>

    <div class="row g-5">
        
        <form id="update_form" action="/member/update" class="update_form needs-validation" method="POST">
          <div class="row g-3 col-md-7 col-lg-8" style="margin: 0 auto;">
            <div class="join_title" style="margin-top: 100px;">
              <h2>회원정보 수정</h2>
            </div>
          
            <hr class="my-4" style="margin:10px 0 !important;">
          
            <input type="hidden" id="memberNo" value="${sessionMemberVo.memberNo }" name="memberNo">
            
            <div class="col-12">
              <div class="id_member">
                <label class="id_member form-label">아이디</label>
              </div>
              <div class="id_input_box input-group has-validation">
                <input type="text" class="id_input form-control" id="memberId" value="${sessionMemberVo.memberId }" readonly="readonly">
              </div>
            </div>
            

            <div class="pw_container col-12">
              <div class="pw_name">
                <label class="pw_name form-label">비밀번호</label>
              </div>
              <div class="pw_input_box input-group has-validation">
                <input type="password" class="pw_input form-control" name="memberPw" placeholder="비밀번호" id="password">
              </div>
              <span class="pw_msg">비밀번호를 입력해주세요.</span>
            </div>
            
            <div class="pwck_container col-12">
              <div class="pwck_name">
                <label class="pwck_name form-label">비밀번호 확인</label>
              </div>
              <div class="pwck_input_box">
                <input type="password" class="pwck_input form-control" placeholder="비밀번호 확인">
              </div>
              <span class="pwck_msg">비밀번호 확인을 입력해주세요.</span> 
              <span class="pwck_msg_01">비밀번호가 일치합니다.</span> 
              <span class="pwck_msg_02">비밀번호가 일치하지 않습니다.</span>
            </div>

            <div class="name_container col-12">
              <div class="name_member">
                <label class="name_member form-label">이름</label>
              </div>
              <div class="name_input_box">
                <input class="name_input form-control" type="text" name="memberName" value="${sessionMemberVo.memberName }">
              </div>
              <span class="name_msg">이름을 입력해주세요.</span>
            </div>
            
            <div class="birth_containe col-12">
              <div class="birth_member">
                <label class="birth_member form-label">생년월일</label>
              </div>
              <div class="birth_input_box">
                <input class="birth_input form-control" type="date" name="memberBirth" value="${sessionMemberVo.memberBirth }">
              </div>
              <span class="birth_msg">생년월일을 선택해주세요.</span>
            </div>

            <div class="phone_container col-12">
              <div class="phone_member">
                <label class="phone_member form-label">연락처</label>
              </div>
              <div class="phone_input_box">
                <input class="phone_input form-control" type="tel" name="memberPhone" value="${sessionMemberVo.memberPhone }">
              </div>
              <span class="phone_msg">연락처를 입력해주세요.</span>
              <span class="phone_input_warn"></span>
            </div>

            <div class="mail_container col-12">
              <div class="mail_member">
                <label class="mail_member form-label">이메일</label>
              </div>
              <div class="mail_part" style="display: flex">
                <div class="mail_input_box col-md-8">
                  <input class="mail_input form-control" type="email" name="memberMail" value="${sessionMemberVo.memberMail }">
                </div>
                <div class="mail_check_btn form-label col-6 col-md-4">
                   <input type="button" class="form-control" value="인증번호 전송">
                </div>
              </div>
                <span class="mail_msg">이메일을 입력해주세요.</span>
                <span class="mail_input_warn"></span>
              
              <div class="mail_check_container col-12">
                <div class="mail_check_input_box form-label" id="mail_check_input_box_false">
                   <input class="mail_check_input form-control" disabled="disabled">
                </div>
                <div class="clearfix mail_input_box"></div>
                <span id="mail_check_input_box_warn"></span>
              </div>
              
              <div class="mail_member">
                <label class="mail_member_agree form-label">이메일수신여부</label>
              </div>
              <div class="mail_agree_container" style="display: flex;">
                <div class="mail_intput_yes_box form-check col-6">
                  <input type="radio" class="form-check-input" value="Yes" name="memberMailAgree" checked="checked">
                  <label class="form-check-label mail_agree_yes">예</label>
                </div>
                <div class="mail_input_no_box form-check col-6">
                  <input type="radio" class="form-check-input" value="No" name="memberMailAgree">
                  <label class="form-check-label mail_agree_no">아니요</label>
                </div>
              </div>
            </div>
            
            <div class="address_container col-12">
              <div class="address_member">
                <label class="address_member form-label">우편번호</label>
              </div>
              <div class="add01_member" style="display: flex">
                <div class="add01_input_box col-md-8">
                  <input class="add01_input form-control" type="text" value="${sessionMemberVo.memberAdd01 }" name="memberAdd01" readonly>
                </div>
                <div class="add_btn col-md-4" onclick="execution_daum_address()">
                  <input type="button" class="form-control" value="주소찾기">
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="address_member">
                <label class="address_member form-label">주소</label>
              </div>
              <div class="add02_input_box">
                <input class="add02_input form-control" type="text" value="${sessionMemberVo.memberAdd02 }" name="memberAdd02" readonly>
              </div>
              <div class="add03_member">
                <div class="address_member">
                  <label class="address_member form-label">상세주소</label>
                </div>
                <div class="add03_input_box">
                  <input class="add03_input form-control" type="text" value="${sessionMemberVo.memberAdd03 }" name="memberAdd03" readonly>
                </div>
                <span class="add_msg">상세 주소를 입력해주세요.</span>
              </div>
            </div>

          <hr class="my-4">

          <div class="join_btn_wrap">
              <button class="btn btn-primary me-2 btn-lg update_btn" type="button">수정하기</button>
          </div>
         </div>
        </form>
    </div>
  </main>
</div>
<!-- bootstrap end -->
  
  
  
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>

  
  var code = ""; // 이메일 전송 인증번호 저장을 위한 코드
  
  // 유효성 검사 변수 선언
  var pwCheck = false; // 비밀번호
  var pwckCheck = false; // 비밀번호 확인
  var pwchcorCheck = false; // 비밀번호 확인 일치
  var nameCheck = false; // 이름
  var birthCheck = false; // 생년월일
  var phoneCheck = false; // 연락처
  var mailCheck = false; // 이메일
  var mailnumCheck = false; // 이메일 인증번호
  var addCheck = false; // 주소
  
  
  
  //회원가입 버튼(회원가입 기능 작동)
  $(document).ready(function(){
    $(".update_btn").click(function(){
        
        // 입력값 변수
        var pw = $('.pw_input').val(); // pw input
        var pwck = $('.pwck_input').val(); // pwck input
        var name = $('.name_input').val(); // name input
        var birth = $('.birth_input').val(); // birth input
        var phone = $('.phone_input').val(); // phone input
        var mail = $('.mail_input').val(); // mail input
        var add = $('.add03_input').val(); // address input
        
        
        // 비밀번호 유효성 검사
        if(pw == ""){
            $('.pw_msg').css('display','block');
            pwCheck = false;
        } else {
            $('.pw_msg').css('display','none');
            pwCheck = true;
        }

        // 비밀번호 확인 유효성 검사
        if(pwck == ""){
            $('.pwck_msg').css('display','block');
            pwckCheck = false;
        } else {
            $('.pwck_msg').css('display','none');
            pwckCheck = true;
        }
        
        // 이름 유효성 검사
        if(name == ""){
            $('.name_msg').css('display','block');
            nameCheck = false;
        } else{
            $('.name_msg').css('display','none');
            nameCheck = true;
        }

        // 생일 유효성 검사
        if(birth == ""){
            $('.birth_msg').css('display','block');
            birthCheck = false;
        } else{
            $('.birth_msg').css('display','none');
            birthCheck = true;
        }

        // 연락처 유효성 검사
        if(phone == ""){
            $('.phone_msg').css('display','block');
            birthCheck = false;
        } else{
            $('.phone_msg').css('display','none');
            birthCheck = true;
        }

        // 이메일 유효성 검사
        if(mail == ""){
            $('.mail_msg').css('display','block');
            mailCheck = false;
        } else{
            $('.mail_msg').css('display','none');
            mailCheck = true;
        }

        // 주소 유효성 검사
        if(add == ""){
            $('.add_msg').css('display','block');
            addCheck = false;
        } else{
            $('.add_msg').css('display','none');
            addCheck = true;
        }
        
        /* 최종 유효성 검사 */
		if(pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addCheck ){

			$("#update_form").submit();			
			
		}		
    });
    
  }); // end function


  
   
   // 인증번호 이메일 전송
  $(".mail_check_btn").click(function(){
      
      var mail = $(".mail_input").val(); // 입력한 메일
      var checkBox = $(".mail_check_input"); // 인증번호 입력
      var boxInput = $(".mail_check_input_box") // 인증번호 입력란 박스
      var warnMsg = $(".mail_input_warn"); // 이메일 형식 입력 경고
      
      // 이메일 형식 유효성 검사
      if(mailFormCheck(mail)){
          warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
          warnMsg.css("display", "inline-block");
      } else {
          warnMsg.html("올바르지 못한 이메일 형식입니다.");
          warnMsg.css("display", "inline-block");
          return false;
      }    
      
      $.ajax({
          
          type : "GET",
          url : "mailCheck?mail=" + mail,
          success : function(data){
              
              console.log("data : " + data);
              checkBox.attr("disabled", false);
              boxInput.attr("id", "mail_check_input_box_true");
              code = data;
          }
          
      }); // end ajax
      
  }); // end function
  
  // 인증번호 비교
  $(".mail_check_input").blur(function(){
      
      var inputCode = $(".mail_check_input").val();        // 입력코드    
      var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
      
      if(inputCode === code){
          checkResult.html("인증번호가 일치합니다.");
          checkResult.attr("class", "correct"); 
          mailnumCheck = true;
      } else {                                            // 일치하지 않을 경우
          checkResult.html("인증번호를 다시 확인해주세요.");
          checkResult.attr("class", "incorrect");
          mailnumCheck = false;
      }    
      
  }); // end function
  
  
  // 다음 주소 연동
  function execution_daum_address(){
      new daum.Postcode({
          oncomplete: function(data){
           	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
           	
           	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 주소변수 문자열과 참고항목 문자열 합치기
                addr += extraAddr;
            
            } else {
                addr += ' ';
            }

            $(".add01_input").val(data.zonecode);
            $(".add02_input").val(addr);
            
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $(".add03_input").attr("readonly",false);
            $(".add03_input").focus();
         
          }
      }).open();
      
  }
  
 // 비밀번호 확인 일치 유효성 검사
 $('.pwck_input').on("propertychange change keyup paste input", function(){
     
      var pw = $('.pw_input').val();
      var pwck = $('.pwck_input').val();
      $('.pwck_msg').css('display', 'none');
   
      if(pw == pwck){
          $('.pwck_msg_01').css('display','block');
          $('.pwck_msg_02').css('display','none');
          pwckcorCheck = true;
      }else{
          $('.pwck_msg_01').css('display','none');
          $('.pwck_msg_02').css('display','block');
          pwckcorCheck = false;
      }        
      
  });    
 

 
 // 이메일 형식 유효성 검사
 function mailFormCheck(mail){
     var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
     return form.test(mail);
 }
 
 
  
  </script>

<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</body>
</html>







