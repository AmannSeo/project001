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
  border-bottom : 1px solid rgba(0, 0, 0, .1);
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
<title>${sessionMemberVo.memberId}</title>
</head>
<body>
<!-- header -->
<%@include file="../includes/layout/nav_blk.jsp" %>

<div class="order_info">
  <div class="container">
    <h2>구매 내역</h2>
    <div >
    </div>
  </div>
</div>

<!-- footer -->
<%@include file="../includes/admin/footer.jsp" %>
</body>
</html>