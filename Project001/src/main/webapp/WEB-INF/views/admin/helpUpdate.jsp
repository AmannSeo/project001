<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${help.helpTitle }</title>
</head>
<body>
  
   <h2>글 수정</h2>
  <div class="wrapper">
    <div class="wrap">
      <form id="helpUpdate_form" action="/admin/helpUpdate" method="post">
        <input type="hidden" name="page" value="${page }">
        <div class="wrap_num">
          <span>번호 : ${help.helpNo }</span>
          <input type="hidden" name="helpNo" value="${help.helpNo }">
        </div>
        <div class="wrap_name">
          <span>작성자</span>
          <input type="text" name="helpName" value="${help.helpName }">
        </div>
        
        <div class="wrap_title">
          <span>제목</span>
          <input type="text" name="helpTitle" value="${help.helpTitle }">
        </div>
        <div>
          <fmt:formatDate value="${help.helpRegDate }" 
            pattern="yyyy년MM월dd일 HH시mm분ss초" var="helpRegDate"/>
          <span>작성일 : ${helpRegDate }</span>
        </div>
        <div class="wrap_prointro">
          <span>내용</span><br>
          <textarea rows="20" cols="40" style="resize: none;" name="helpContent">${help.helpContent }</textarea>
        </div>
        <div>
          <input type="submit" class="btn_update" value="수정">
          <a href="helpDetail?helpNo=${help.helpNo }&page=${pageMaker.criteria.page}"><input type="button" value="취소"></a>
        </div>
      </form>
      
    </div>
</div>

</body>
</html>