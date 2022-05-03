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
    <link rel="stylesheet" href="resources/css/search.css">  

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
      
              <ul class="nav">
                <li><a href="/fine-fragrances" class="">FINE FRAGRANCES</a></li>
                <li><a href="/home-creations" class="">HOME CREATIONS</a></li>
                <li><a href="/body-hair-face" class="">BODY-HAIR-FACE</a></li>
                <li><a href="/grooming" class="">GROOMING</a></li>
                <li><a href="/board/FAQ" class="">FAQ</a></li>
                <li><a href="/board/notice" class="">NOTICE</a></li>
                <li><a href="/about-us" class="">ABOUT US</a></li>
              </ul>
      
              <div class="search_wrap">
          		<form id="searchForm" action="/search" method="get">
          			<div class="search_input">
          				<input type="text" name="keyword">
              			<button class='btn search_btn'>검 색</button>                				
          			</div>
          		</form>
        	  </div>
      
             
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
      <div id="clearfix">
  
        <div class="content_area">
        
          <!-- 게시물 o -->
          <c:if test="${listcheck != 'empty'}">
            <div class="list_search_result">
              <table class="type_list">
                <colgroup>
                  <col width="110">
                  <col width="*">
                  <col width="120">
                  <col width="120">
                  <col width="120">
                </colgroup>
                <tbody id="searchList>">
                  <c:forEach items="${list}" var="list">
                    <tr>
                      <td class="name">
                        <div class="product_name">
                          ${list.productName }
                        </div>
                      </td>
                      <td class="detail">
                        <div class="category">
                          [${list.productCategory}]
                        </div>
                        <div class="title">
                          ${list.productName}
                        </div>
                      </td>
                      <td class="amount">
                        <div class="product_amount">
                          ${list.productAmount }
                        </div>
                      </td>
                      <td class="price">
                        <div class="org_price">
                          <div>
                            ${list.productPrice}
                          </div>
                        </div>
                      </td>
                      <td class="option"></td>
                    </tr>
                  </c:forEach>
                </tbody>
              
              </table>
            </div>
            
          </c:if>
          <!-- 게시물 x -->
          <c:if test="${listcheck == 'empty'}">
            <div class="table_empty">
              검색결과가 없습니다.
            </div>
          </c:if>
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