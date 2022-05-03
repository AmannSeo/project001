<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1"> 
    
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" 
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!-- custom css -->
    <link rel="stylesheet" href="/resources/css/member/signin.css"> 
    
<style>
.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}
.mb-4 {
  width: 50%;
}


@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
.join_part {
  margin: 20px 0;
}
.join_part a {
  text-decoration: none;
  font-size: 14px;
  color : gray;
}
.login_warn {
  color : red;
  font-size: 16px;
}
</style>
    

<title>Login Page</title>
</head>
<body class="text-center" cz-shortcut-listen="true">

<main class="form-signin">
  <form id="login_form" class="loginForm" method="post">
    <a href="/main" >
      <img class="mb-4" src="/resources/imgs/logo_blk.png" alt="">
    </a>
    
    <div class="form-floating id_part">
      <input type="text" class="id_input form-control" id="floatingInput" name="memberId">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating pw_input_box">
      <input type="password" class="form-control" id="floatingPassword" name="memberPw">
      <label for="floatingPassword">비밀번호</label>
    </div>
    
    <c:if test="${result == 0 }">
      <div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
    </c:if>
    
    <div class="login_btn_part">
      <input class="w-100 btn btn-lg btn-primary login_btn" type="button" value="로그인">
    </div>
    
    <div class="join_part">
      <a href="/member/join">회원가입</a>
    </div>
  </form>
</main>
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









