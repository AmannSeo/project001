<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- custom css -->
<link rel="stylesheet" href="/resources/css/includes/header.css">

<style type="text/css">
.nav-link {
  color : black;
}
.member_login_part span {
  color: black;
}
.admin_login_part span{
  color: black;
}
.wrapper {
  padding : 20px 20px 0 20px;
  border-bottom: 1px solid rgb(0, 5, 16 );
}

</style>

<div class="wrapper nav_wrapper">
  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4">
    <a href="/main" class="d-flex align-items-center mb-2 mb-lg-0">
      <img class="img_logo" src="/resources/imgs/logo_blk.png">
    </a>

    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="/fine-fragrances" class="nav-link px-2 link-dark">FINE FRAGRANCES</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">HOME CREATIONS</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">BODY - HAIR - FACE</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">ABOUT US</a></li>
        <li><a href="/help" class="nav-link px-2 link-dark">FAQ</a></li>
    </ul>

    <button type="button" id="btn_logout" class="btn btn-outline-primary me-2">로그아웃</button>
  </header>
</div>

<script type="text/javascript">
     $(document).ready(function(){
        
         $('#btn_logout').click(function(){
             // location = '../member/logout';
             $.ajax({
               type : "POST",
               url : "/member/logout",
               success : function(data){
                 alert("로그아웃 되었습니다.");
                 document.location.reload();
               }
             }); // end ajax
         }); // end btn_logout.click()
         
     }); // end document()
     
</script>









