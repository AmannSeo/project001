<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!-- main/css -->
    <link rel="stylesheet" href="/resources/css/member/login.css">  

<title>Login Page</title>
</head>
<body>
  <h1>Login Page</h1>
  <div class="container">
    <form id="login_form" class="loginForm" method="post">
      <h3>Le labo</h3>
      <div class="login_part">
        <!-- id_part -->
        <div class="id_part">
          <div class="id_input_box">
            <input class="id_input" type="text" name="memberId">
          </div>
        </div>
        <!-- pw_part -->
        <div class="pw_part">
          <div class="pw_input_box">
            <input class="pw_input" type="password" name="memberPw">
          </div>
        </div>
        
        <c:if test="${result == 0 }">
          <div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
        </c:if>
        
        <div class="login_btn_part">
          <input class="login_btn" type="button" value="로그인">
        </div>
      </div>
    </form>
  </div>
    
  <script>
  
  // 로그인 버튼
  $(".login_btn").click(function(){
	  // alert("Login Active")
	  
	  // 로그인 메서드 서보 요청
	  $("#login_form").attr("action", "/member/login");
	  $("#login_form").submit();
	  
  });
  
  </script>

</body>
</html>









