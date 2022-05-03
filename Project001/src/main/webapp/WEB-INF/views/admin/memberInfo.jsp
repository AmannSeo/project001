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
.content_wrap {
  margin: 40px;
}
.detail_btn {
  margin-top: 40px;
  margin-bottom : 20px;
}
.detail_btn button {
  width : 120px;
  margin-right: 1rem !important;
}
#btn_mod {
  color : black;
   border-color: black;
}
#btn_mod:active {
  color : white;
  background-color: green !important;
  border-color: green !important;
}
#btn_mod:hover {
  color : white;
  background-color: green !important;
  border-color: green !important;
}
#btn_del {
  color : black;
  border-color: black;
}
#btn_del:active {
  color : white;
  background-color: red !important;
  border-color: red !important;
}
#btn_del:hover {
  color : white;
  background-color: red !important;
  border-color: red !important;
}

</style>

<title>${product.productName }</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/admin/header.jsp" %>

<!-- content -->
<div class="content" style="display: flex;">
  <%@include file="../includes/admin/admin_menu.jsp" %>

  <div class="wrapper">
    <div class="wrap">
      <div class="col-md-7 col-lg-8 content_wrap">
        <div class="row g-3">
          <div class="prodcut_name">
            <h3>${vo.memberId} 님</h3>
          </div>
    
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
            <input class="form-control" id="memberAdd03" value="<fmt:formatNumber value="${vo.memberPoint }" pattern="#,###,### 원" />" readonly="readonly">
          </div>
    
        </div>
    
      <div class="detail_btn">
        <a href="memberManage?page=${page }"><button type="button" id="btn_join" class="btn btn-primary">목록</button></a>
      </div>
      
    </div>
    
    </div>
  </div>
</div>




</body>
<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</html>














