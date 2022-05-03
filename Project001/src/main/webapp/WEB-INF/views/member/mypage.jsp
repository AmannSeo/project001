<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
body {
  padding: 0 !important;
}
.member_info {
  border-top: 1px solid rgba(0, 0, 0, .1);
  border-bottom: 1px solid rgba(0, 0, 0, .1);
}
.member_name h2 {
  font-size: 60px;
}
.member_point label {
  font-size : 24px;
}
.member_point h4 {
  font-size: 40px;
}

</style>
<title>${vo.memberId}</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/layout/nav_blk.jsp" %>
  
  <div class="member_info">
    <div class="container">
      <div class="member_name">
        <h2>${vo.memberId} 님 환영합니다.</h2>
      </div>
      <div class="member_point">
        <label>포인트</label>
        <h4><fmt:formatNumber value="${vo.memberPoint }" pattern="#,###,###" /></h4>
      </div>
      <div class="member_order">
        <a href="/member/order">주문 내역 보기</a>
      </div>
    </div>
  </div>
  
  <div class="container wrapper">
    <div class="wrap">
    
      <div class="col-md-7 col-lg-8 content_wrap" style="margin: 0 auto;">
        <div class="row g-3">
    
          <div class="col-12 section_id">
            <label for="memberId" class="form-label">아이디</label>
            <div class="input-group has-validation">
              <input class="form-control" id="memberId" value="${vo.memberId }" readonly="readonly">
            </div>
          </div>
    
          <div class="col-12 section_name">
            <label for="memberName" class="form-label">이름</label>
            <input class="form-control" id="memberName" value="${vo.memberName }" readonly="readonly">
          </div>
    
          <div class="col-12 section_birth">
            <label for="memberBirth" class="form-label">생년월일</label>
            <input class="form-control" id="memberBirth" value="${vo.memberBirth }" readonly="readonly">
          </div>
    
          <div class="col-12 section_phone">
            <label for="memberPhone" class="form-label">연락처</label>
            <input class="form-control" id="memberPhone" value="${vo.memberPhone }" readonly="readonly">
          </div>
          
          <div class="col-12 section_mail">
            <label for="memberMail" class="form-label">이메일</label>
            <input class="form-control" id="memberMail" value="${vo.memberMail }" readonly="readonly">
          </div>
          
          <div class="col-12 section_mail_agree">
            <label for="memberMailAgree" class="form-label">이메일 수신여부</label>
            <input class="form-control" id="memberMailAgree" value="${vo.memberMailAgree }" readonly="readonly">
          </div>
          
          <div class="col-12 section_add01">
            <label for="memberAdd01" class="form-label">우편번호</label>
            <input class="form-control" id="memberAdd01" value="${vo.memberAdd01 }" readonly="readonly">
          </div>
          
          <div class="col-12 section_add02">
            <label for="memberAdd02" class="form-label">주소</label>
            <input class="form-control" id="memberAdd02" value="${vo.memberAdd02 }" readonly="readonly">
          </div>
          
          <div class="col-12 section_add03">
            <label for="memberAdd03" class="form-label">상세주소</label>
            <input class="form-control" id="memberAdd03" value="${vo.memberAdd03 }" readonly="readonly">
          </div>
          
          <div class="col-12 section_add03">
            <label for="memberPoint" class="form-label">적립금</label>
            <input class="form-control" id="memberPoint" value="<fmt:formatNumber value="${vo.memberPoint }" pattern="#,###,### 원" />" readonly="readonly">
          </div>
          
    
        </div>
    
        <div class="detail_btn">
        
      </div>
      
    </div>
        
  </div>
  
  <div class="detail_btn">
    <a href="update?memberNo=${vo.memberNo }"><button type="button" id="btn_mod" class="btn btn-outline-primary me-2 ">수정</button></a>
    <a href="delete?memberNo=${vo.memberNo }"><button type="button" id="btn_del" class="btn btn-outline-primary me-2">삭제</button></a>
  </div>
 </div> 
  
</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>

















