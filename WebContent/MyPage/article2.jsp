<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<table>
		<tr>
			<th>uid</th>
			<th>제목/내용</th>
			<th>작성일</th>			
		</tr>
		<c:choose>
			<c:when test="${empty comment || fn:length(comment) == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="comment" items="${comment }">
				<tr>
					<td>${comment.s_uid }</td>
					<td><a href='view.ho?s_uid=${comment.s_uid}'><h2>${comment.s_title}</h2><p>${comment.s_content }</p></a></td>
					<td>${comment.s_date }</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="pager">
    <ul>
        <c:if test="${ acurPageNum > 5 && !empty kwd }">
            <li><a href="list.ho?page=${ ablockStartNum - 1 }&kwd=${ kwd }">◀</a></li>
        </c:if>
        
        <c:if test="${ acurPageNum > 5 }">
            <li><a href="list.ho?page=${ ablockStartNum - 1 }">◀</a></li>
        </c:if>
        
        <c:forEach var="i" begin="${ ablockStartNum }" end="${ ablockLastNum }">
            <c:choose>
                <c:when test="${ i > alastPageNum }">
                    <li>${ i }</li>
                </c:when>
                <c:when test="${ i == acurPageNum }">
                    <li class="selected">${ i }</li>
                </c:when>
                <c:when test="${ !empty kwd}">
                    <li><a href="list.ho?a=search&page=${ i }&kwd=${ kwd }">${ i }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="list.ho?page=${ i }">${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${ alastPageNum > ablockLastNum && !empty kwd }">
            <li><a href="list.ho?a=search&page=${ ablockLastNum + 1 }&kwd=${ kwd }">▶</a></li>
        </c:if>
        
        <c:if test="${ alastPageNum > ablockLastNum }">
            <li><a href="list.ho?page=${ ablockLastNum + 1 }">▶</a></li>
        </c:if>
    </ul>
</div> 
	<br>
	<c:if test="${m_uid != null}">
		<button onclick="location.href='write.ho'">글쓰기</button>
	</c:if>
	<c:if test="${m_uid == null}">
		<button onclick="location.href='../Login/Login.ho'">로그인</button>
	</c:if>
</body>
</html>
