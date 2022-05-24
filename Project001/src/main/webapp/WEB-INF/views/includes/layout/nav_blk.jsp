<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css">

<!-- custom css -->
<link rel="stylesheet" href="/resources/css/includes/header.css">
<link rel="stylesheet" href="/resources/css/bootstrap/navbar.css">


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
#btn_login {
  color:black; 
  border-color: black;
}
#btn_login:hover {
  background-color: rgb(0, 5, 16);
  color : rgba(255, 255, 255, .5);
}
#btn_logout:hover {
  background-color: rgb(0, 5, 16);
  color : rgba(255, 255, 255, .5);
}
#btn_login:active {
  background-color: rgb(0, 5, 16);
  color : rgba(255, 255, 255, .5)
}
#btn_logout:active {
  background-color: rgb(0, 5, 16);
  color : rgba(255, 255, 255, .5);
}
#btn_logout {
  color:black; 
  border-color: black;
}
#btn_join{
  color: white;
  border-color: gray;
  background-color: gray;
  opacity: 80%;
}
#btn_join:hover{
  color: white;
  border-color: gray;
  background-color: gray;
  opacity: 100%;
}
#btn_join:active{
  color: white;
  border-color: gray;
  background-color: gray;
  opacity: 100%;
}
#searchInput {
  background: transparent;
  border: 1px solid black;
  border-radius: 5px;  
  color : black;
}
.nav-link {
  color : black !important;
}
.dropdown-content a {
  color : black;
}
.dropdown-part {
  border-left: 1px solid black;
  background: rgb(255,255,255, 0.5);
}

</style>
</head>
  <div class="container nav_wrapper" style="padding-top: 12px !important;">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4">
      <a href="/main" >
        <img class="img_logo" src="/resources/imgs/logo_blk.png">
      </a>

      <div class="navi_bar_area">
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
         <li class="nav-item dropdown">
          <div class="dropdown">
            <a href="/fine-fragrances" class="nav-link px-2 dropdown-toggle menu_channel">FINE FRAGRANCES</a>
            <div class="dropdown-content">
              <div class="dropdown-part">
                <div class="dropdown-content-sub">
                  <a href="/fine-fragrances">Classic Collection</a>
                </div>
                <div class="dropdown-content-nav">
                  <ul>
                    <c:forEach items="${cate1_1}" var="cate"> 
                      <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                    </c:forEach>
                    <!-- <li><a href="#">THE MATCHA 26</a></li>
                    <li><a href="#">SANTAL 33</a></li>
                    <li><a href="#">ANOTHER 13</a></li>
                    <li><a href="#">THE NOIR 29</a></li>
                    <li><a href="#">ROSE 31</a></li>
                    <li><a href="#">BERGAMOTE 22</a></li>
                    <li><a href="#">BAIE 19</a></li>
                    <li><a href="#">LYS 41</a></li>
                    <li><a href="#">TONKA 25</a></li>
                    <li><a href="#">NEROLI 36</a></li> -->
                  </ul>
                  <ul>
                    <c:forEach items="${cate1_2}" var="cate"> 
                      <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                    </c:forEach>
                    <!-- <li><a href="#">YLANG 46</a></li>
                    <li><a href="#">FLEUR D'ORANGER 27</a></li>
                    <li><a href="#">PATCHOULI 24</a></li>
                    <li><a href="#">LABDANUM 18</a></li>
                    <li><a href="#">JASMIN 17</a></li>
                    <li><a href="#">VETIVER 46</a></li>
                    <li><a href="#">AMBRETTE 9</a></li>
                    <li><a href="#">IRIS 39</a></li>
                    <li><a href="#">OUD 27</a></li> -->
                  </ul>
                </div>
              </div>
              <div class="dropdown-part">
                <div class="dropdown-content-sub">
                  <a href="#">By Format</a>
                </div>
                <div class="dropdown-content-nav">
                  <ul>
                    <c:forEach items="${cate1_3}" var="cate"> 
                      <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                    </c:forEach>
                    <!-- <li><a href="#">EAU DE PARFUM</a></li>
                    <li><a href="#">DISCOVERY</a></li>
                    <li><a href="#">BODY LOTION</a></li>
                    <li><a href="#">SHOWER GEL</a></li>
                    <li><a href="#">BODY OIL</a></li>
                    <li><a href="#">TRAVEL TUBES</a></li>
                    <li><a href="#">LIQUID BALM</a></li>
                    <li><a href="#">BODY BAR</a></li>
                    <li><a href="#">DETERGENT</a></li> -->
                  </ul>
                </div>
              </div>
            </div>
          </div>
         </li>
         <li class="nav-item dropdown">
          <div class="dropdown">
            <a href="/home-creations" class="nav-link px-2 dropdown-toggle menu_channel">HOME CREATIONS</a>
            <div class="dropdown-content">
            <div class="dropdown-part">
              <div class="dropdown-content-sub">
                <a href="#">Classic Collection</a>
              </div>
              <div class="dropdown-content-nav">
                <ul>
                  <c:forEach items="${cate2_1}" var="cate"> 
                    <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                  </c:forEach>
                  <!-- <li><a href="#">SANTAL 26</a></li>
                  <li><a href="#">ENCENS 9</a></li>
                  <li><a href="#">PALO SANTO 14</a></li>
                  <li><a href="#">CALONE 17</a></li>
                  <li><a href="#">FIGUE 15</a></li>
                  <li><a href="#">LAURIER 62</a></li> -->
                </ul>
                <ul>
                  <c:forEach items="${cate2_2}" var="cate"> 
                    <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                  </c:forEach>
                  <!-- <li><a href="#">PETIT GRAIN 21</a></li>
                  <li><a href="#">CADE 26</a></li>
                  <li><a href="#">PIN 12</a></li>
                  <li><a href="#">VERVEINE 32</a></li>
                  <li><a href="#">CEDRE 11</a></li>
                  <li><a href="#">ANIS 24</a></li> -->
                </ul>
              </div>
              </div>
              <div class="dropdown-part">
                <div class="dropdown-content-sub">
                  <a href="#">By Format</a>
                </div>
                <div class="dropdown-content-nav">
                  <ul>
                    <c:forEach items="${cate2_3}" var="cate"> 
                      <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                    </c:forEach>
                    <!-- <li><a href="#">CLASSIC CANDLE</a></li>
                    <li><a href="#">HOME FRAGRANCE</a></li>
                    <li><a href="#">CONCRETE CANDLE</a></li>
                    <li><a href="#">VOTIVES</a></li>
                    <li><a href="#">DISCOVERY</a></li> -->
                  </ul>
                </div>
              </div>
            </div>
          </div>
         </li>
         <li class="nav-item dropdown">
          <div class="dropdown">
            <a href="/body-hair-face" class="nav-link px-2 dropdown-toggle menu_channel">BODY - HAIR - FACE</a>
            <div class="dropdown-content">
              <div class="dropdown-part">
                <div class="dropdown-content-sub">
                  <a href="#">Body</a>
                </div>
                <div class="dropdown-content-nav">
                  <ul>
                    <c:forEach items="${cate3_1}" var="cate"> 
                      <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                    </c:forEach>
                    <!-- <li><a href="#">HAND SOAP</a></li>
                    <li><a href="#">HAND LOTION</a></li>
                    <li><a href="#">HAND POMADE</a></li>
                    <li><a href="#">SHOWER GEL</a></li>
                    <li><a href="#">SHOWER OIL</a></li>
                    <li><a href="#">BODY CREAM</a></li>
                    <li><a href="#">BODY SCRUB</a></li> -->
                  </ul>
                </div>
              </div>
              <div class="dropdown-part">
                <div class="dropdown-content-sub">
                  <a href="#">Hair</a>
                </div>
                <div class="dropdown-content-nav">
                  <ul>
                    <c:forEach items="${cate3_2}" var="cate"> 
                      <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                    </c:forEach>
                    <!-- <li><a href="#">SHAMPOO</a></li>
                    <li><a href="#">CONDITIONER</a></li>
                    <li><a href="#">HAIR MASK</a></li>
                    <li><a href="#">SCRUB SHAMPOO</a></li> -->
                  </ul>
                </div>
              </div>
              <div class="dropdown-part">
                <div class="dropdown-content-sub">
                  <a href="#">Face</a>
                </div>
                <div class="dropdown-content-nav">
                  <ul>
                    <c:forEach items="${cate3_3}" var="cate"> 
                      <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                    </c:forEach>
                    <!-- <li><a href="#">FACE LOTION</a></li>
                    <li><a href="#">FACIAL CLEANSING OIL</a></li>
                    <li><a href="#">LIP BALM</a></li>
                    <li><a href="#">FACE MASK</a></li>
                    <li><a href="#">FACE SCRUB</a></li> -->
                  </ul>
                </div>
              </div>
              <div class="dropdown-part">
                <div class="dropdown-content-sub">
                  <a href="#">By Scent</a>
                </div>
                <div class="dropdown-content-nav">
                  <ul>
                    <c:forEach items="${cate3_4}" var="cate"> 
                      <li><a href="search?type=C&cateCode=${cate.cateCode}">${cate.cateName}</a></li>
                    </c:forEach>
                    <!-- <li><a href="#">HINOKI</a></li>
                    <li><a href="#">BASIL</a></li>
                    <li><a href="#">MANDRIN</a></li>
                    <li><a href="#">UNSCENTED</a></li> -->
                  </ul>
                </div>
              </div>
            </div>
          </div>
         </li>
         <li class="nav-item dropdown">
          <div class="dropdown">
            <a href="/about-us" class="nav-link px-2 dropdown-toggle menu_channel">ABOUT US</a>
          </div>
         </li>
         <li class="nav-item dropdown">
          <div class="dropdown">
            <a href="/help" class="nav-link px-2 dropdown-toggle menu_channel">FAQ</a>
          </div>
         </li>
        </ul>
      </div>

        
        <div class="search_wrap">
          <form id="searchForm" action="/search" method="get">
            <div class="search_input">
              <div style="display:none;">
                <select name="type">
                  <option value="T">제품명</option>
                </select>
              </div>
              <input id="searchInput" type="text" name="keyword">
                <button class='btn search_btn'>검 색</button>                       
            </div>
          </form>
      </div>
  
      <div class="login_wrap">
        <div class="not_login_part">
            <!-- 로그인 하지 않은 상태 -->
            <c:if test="${sessionMemberVo == null }">
              <button type="button" id="btn_login" class="btn btn-outline-primary me-2">로그인</button>
              <button type="button" id="btn_join" class="btn btn-primary">회원가입</button>
            </c:if>
         </div>
      </div>
      
       <div class="login_wrap">
         <div class="login_part">
            <!-- 로그인 한 상태 -->
            <c:if test="${sessionMemberVo != null }">
              <div class="member_login_part">
                <span>회원 : ${sessionMemberVo.memberId }</span>
                <a href="/member/mypage?memberNo=${sessionMemberVo.memberNo }&page" class="myPage"><span>마이페이지</span></a>
              </div>
              <div class="admin_login_part">
                <c:if test="${sessionMemberVo.adminCk == 1 }">
                  <span>관리자 : ${sessionMemberVo.memberId }</span>
                  <button type="button" class="btn_admin_page">관리자 페이지</button>
                </c:if>
              </div>
              <button type="button" id="btn_logout" class="btn btn-outline-primary me-2">로그아웃</button>
            </c:if>
         </div>
       </div>
    </header>
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
     
     
     /* 검색 */
     $(document).ready(function(){
 		// 검색 타입 selected
 		const selectedType = '<c:out value="${pageMaker.criteria.type}"/>';
 		if(selectedType != ""){
 			$("select[name='type']").val(selectedType).attr("selected", "selected");	
 		}
 		
 		/* 이미지 삽입 */
		$(".image_wrap").each(function(i, obj){
			
			const bobj = $(obj);
			
			if(bobj.data("productNo")) {
    			const uploadPath = bobj.data("path");
    			const uuid = bobj.data("uuid");
    			const fileName = bobj.data("filename");
    			
    			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
    			
    			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
			} else {
				$(this).find("img").attr('src', '/resources/imgs/noimg.png');
			}
			
		});
 		
	 });
     
  </script>