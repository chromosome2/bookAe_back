<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath }/resources/js/viewArticle.js"></script>
<title>북愛 - 댓글 수정</title>
</head>
<body>
	<h2>댓글 수정하기</h2>
	
	<div id="write_comment">
		<form action="${contextPath}/community/modComment.do" method="post" id="modComment" name="modComment">
			<textarea id="comment_textarea" rows="20" cols="50" name="comment_content">${comment.comment_content }</textarea>
			<input type="hidden" value="${comment.comment_num }" name="comment_num">
			
			<div id="button_box">
	 			<input id="submitBtn" class="commBtn subBtn" type="button" value="수정" onclick="before_submit_modComment(this.form, '${comment.id}', '${id }')"/>
			</div>
		</form>
	</div>
</body>
</html>