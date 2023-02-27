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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="sujin">
    <meta name="robots" content="all">
    <link rel="shortcut icon" href="${contextPath }/resources/images/그림2.ico">
    <link rel="stylesheet" href="${contextPath }/resources/css/common.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/normalize.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/community.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/summernote-lite.css">
    <script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/js/common.js"></script>
    <script src="${contextPath }/resources/js/summernote-lite.js"></script>
    <script src="${contextPath }/resources/js/lang/summernote-ko-KR.js"></script>
	<title>북愛 - 커뮤니티 페이지</title>
</head>
<body>
	
	<!--건너뛰기 링크 시작-->
    <a id="skipNav" href="communityMenu">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--#wrapper 시작-->
    <div id="wrapper">
    
    	<jsp:include page="../common/header.jsp"/>
    	
    	<!--감상평 게시판 시작-->
        <div class="communityMenu">
            <h2><img src="${contextPath }/resources/images/community.png" alt="게시판 로고" width="50">감상평 게시판</h2>
            <section>
            	<table align="center">
					<tr>
						<td width="150" align="center" bgcolor="#ff9933">작성자아이디</td>
						<td><input type="text" value="${board.id}" disabled name="writer" disabled></td>
					</tr>
					<tr>
						<td width="150" align="center" bgcolor="#ff9933">제목</td>
						<td><input type="text" value="${board.board_title}" disabled name="title" id="id_title" disabled></td>
					</tr>
					<tr>
						<td width="150" align="center" bgcolor="#ff9933">내용</td>
						<td>
							<span name="content" id="content" disabled>${board.board_content}</span>
						</td>
					</tr>
					<tr>
						<td width="150" align="center" bgcolor="#ff9933">등록일자</td>
						<td><input type="text" value="<fmt:formatDate value="${board.board_date}"/>" disabled></td>
					</tr>
				</table>
            </section>
        </div>
        <!--감상평 게시판 종료-->
        
        <jsp:include page="../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->
</body>
</html>