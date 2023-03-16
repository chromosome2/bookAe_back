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
	<link rel="shortcut icon" href="${contextPath }/resources/images/그림2.ico">
	<script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${contextPath }/resources/js/viewArticle.js"></script>
	<title>북愛 - 댓글 수정</title>
	<script type="text/javascript">
		//댓글수정 내용을 작성하지 않았을 시 경고
		function before_submit_modComment(){
			var content= $('#comment_textarea').val();
			
			if(content.trim() == ''){
 				alert("내용을 입력해주세요.");
 				return false;
 			}
 			
			//부모창으로 submit 후 팝업 닫기
		    window.opener.name = "parentPage"; // 부모창의 이름 설정
		    document.modComment.target = "parentPage"; // 타켓을 부모창으로 설정
		    document.modComment.action = "${contextPath}/community/modComment.do"; //action 설정
		    document.modComment.submit();
		    self.close();
 			
		}
	</script>
</head>
<body>
	<h2>댓글 수정하기</h2>
	
	<div id="write_comment">
		<form method="post" id="modComment" name="modComment">
			<textarea id="comment_textarea" rows="9" cols="40" name="comment_content">${comment.comment_content }</textarea>
			<input type="hidden" value="${comment.comment_num }" name="comment_num">
			<input type="hidden" value="${comment.board_num }" name="board_num">
			
			<div id="button_box">
	 			<input id="submitBtn" class="commBtn subBtn" type="button" value="수정" onclick="before_submit_modComment()"/>
			</div>
		</form>
	</div>
</body>
</html>