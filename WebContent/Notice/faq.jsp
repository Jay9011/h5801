<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/comment.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/faq.css"> --%>
<title>FAQ</title>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<jsp:include page="../header.jsp" />
	<!-- 페이지에 해당하는 내용 적기  -->
	<section class="container section scrollspy" id="intro">
		<div class="row">
			<div class="col m1 "></div>
			<div class="col m10 s12">

				<h3 class="left-align pfont">자주하는 질문</h3>

					<div class=" FAQ">
						<div>
							<ul class="collapsible popout col offset-m1 m10 s12 pfont">
								<c:choose>
									<c:when test="${empty listRow || fn:length(listRow) == 0 }"></c:when>
									<c:otherwise>
										<c:forEach var="faq" items="${listRow }">
											<li>
												<div class="collapsible-header">
													<i class="material-icons">live_help</i>${faq.f_title }</div>
												<div class="collapsible-body" id="test">
													<span>${faq.f_content }</span>
												</div>
											</li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
					<!-- END -->
	
				<!-- END -->
				<div class="pfont col s12 center-align">
					<h5 class="light-green-text text-darken-3">여러분들의 공부를 항상 응원합니다.<br>٩( 'ω' )و</h5>
</div>
			</div>
			<div class="col m1"></div>
		</div>
	</section>

	<jsp:include page="../foot.jsp" />
	<!--  js 추가는 여기에 -->
	<script src="${pageContext.request.contextPath}/JS/faq.js"></script>
</body>
</html>