<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
 <head>
 <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
 <jsp:include page="../modal.jsp"/>
<c:choose>
<c:when test="${chk == -1 || chk == 0}">
 <div id="demo-modal" class="modal">
    <div class="modal-content">
      <h5>로그인 실패</h5>
      <p class="left-align">아이디 혹은 패스워드가 틀렸습니다.</p>
    </div>
    <div class="modal-footer">
      <a href="javascript:window.history.back();"  class="modal-close waves-effect  btn-flat amber">확인</a>
    </div>
  </div>

	</c:when>
	<c:when test="${chk == 1 }">
	<script>
	<% response.sendRedirect("../index.ho");%>
	</script>
	</c:when>
</c:choose>
<script type="text/javascript" src="../JS/modal.js"></script>
</body>   
</html>