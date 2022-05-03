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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- reset CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
   

    <!-- main/css -->
    <link rel="stylesheet" href="resources/css/main.css">  

<title>Le Labo Fragrances | Niche Perfumes and Candles</title>
</head>
<body>
    <div class="wrap">
      <!-- menu_gnb -->
      <div class="menu_gnb_area">
        <header class="p-3">
          <div class="container logo_area">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
              <a href="/main" class="d-flex align-items-center mb-2 mb-lg-0">
                <img class="img_logo" src="resources/imgs/logo_whi.png">
              </a>
      
              <ul class="">
                <li><a href="/fine-fragrances" class="">FINE FRAGRANCES</a></li>
                <li><a href="/home-creations" class="">HOME CREATIONS</a></li>
                <li><a href="/body-hair-face" class="">BODY-HAIR-FACE</a></li>
                <li><a href="/grooming" class="">GROOMING</a></li>
                <li><a href="/board/FAQ" class="">FAQ</a></li>
                <li><a href="/board/notice" class="">NOTICE</a></li>
                <li><a href="/about-us" class="">ABOUT US</a></li>
              </ul>
      
              <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
              </form>
      
             
             <div class="not_login_part">
                <!-- 로그인 하지 않은 상태 -->
                <c:if test="${vo == null }">
                  <button type="button" id="btn_login">로그인</button>
                  <button type="button" id="btn_join">회원가입</button>
                </c:if>
             </div>
             
             <div class="login_part">
                <!-- 로그인 한 상태 -->
                <c:if test="${vo != null }">
                  <div class="member_login_part">
                    <span>회원 : ${vo.memberName }</span>
                    <a href="/member/mypage?memberId=${vo.memberId }&page" class="myPage"><span>마이페이지</span></a>
                  </div>
                  <div class="admin_login_part">
                    <c:if test="${vo.adminCk == 1 }">
                      <span>관리자 : ${vo.memberName }</span>
                      <button type="button" class="btn_admin_page">관리자 페이지</button>
                    </c:if>
                  </div>
                  <button type="button" id="btn_logout">로그아웃</button>
                </c:if>
             </div>
            </div>
          </div>
        </header>
      </div> 
      
      <!-- main -->
      <!-- video Part-->
      <div id="intro">
  
        <div class="artworkZone"></div>
  
        <div class="bgMovie">
              <video autoplay loop muted poster="resources/imgs/vd_bg.png" id="bgvid">
                <source src="resources/video/back_vd.webm" type="video/webm">
                <source src="resources/video/back_vd.mp4" type="video/mp4">
                <!--<source src="video/bw.ogv" type="video/ogv">-->
              </video>
          </div>
      </div>
    
    </div>
 
  <script type="text/javascript">
     $(document).ready(function(){
         $('#btn_login').click(function(){
               var target = encodeURI('../member/login');
               location = target;
         }); // end btn_login.click()

         $('#btn_join').click(function(){
               var target = encodeURI('/member/join');
               location = target;
         }); // end btn_join.click()
         
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
         
         $('.btn_admin_page').click(function(){
        	 var target = encodeURI('/admin/index');
        	 location = target;
         }); // end btn_admin_page.click()
     }); // end document()
     
     
	</script>

</body>
</html>