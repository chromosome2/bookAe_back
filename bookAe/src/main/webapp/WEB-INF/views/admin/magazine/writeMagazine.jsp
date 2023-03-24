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
    <link rel="stylesheet" href="${contextPath }/resources/css/writeCommunity.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/summernote-lite.css">
    <script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/js/common.js"></script>
    <script src="${contextPath }/resources/js/summernote-lite.js"></script>
    <script src="${contextPath }/resources/js/lang/summernote-ko-KR.js"></script>
    <script src="${contextPath }/resources/js/writeCommunity.js"></script>
	<script type="text/javascript">
		//취소 버튼시 community로 돌아가기
		function cancelWriteCommunity() {
			location.href="${contextPath}/community/magazine.do";
		}
	</script>
	<title>북愛 - 커뮤니티 페이지</title>
</head>
<body>
	<!--건너뛰기 링크 시작-->
    <a id="skipNav" href="mainContents">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--#wrapper 시작-->
    <div id="wrapper">
    
    	<jsp:include page="../../common/header.jsp"/>
    	
    	<!--감상평 게시판 시작-->
        <div class="communityMenu">
            <h2><a href="${contextPath}/community/magazine.do"><img src="${contextPath }/resources/images/community.png" alt="게시판 로고" width="50">매거진</a></h2>
            <section id="content_section">
            	<form action="${contextPath }/community/addMagazine.do" method="post" id="writeMagazineForm" name="writeMagazineForm">
            		<div class="articleNameBox">
            			<select id="board_genre" name="magazine_genre">
	                        <option value="none">--장르--</option>
	                        <option value="interview">인터뷰</option>
	                        <option value="event">행사</option>
	                        <option value="news">뉴스</option>
	                    </select>
            			<input id="board_title" type="text" name="magazine_title" placeholder="제목">
            		</div>
            		<div id="content_box">
            			<textarea id="summernote" name="magazine_content"></textarea>
            		</div>
            		<div id="contents_footer">
	            		<div id="button_box">
		            		<input id="cancelBtn" class="commBtn canBtn" type="button" value="취소" onclick="cancelWriteCommunity()"/>
		            		<input id="submitBtn" class="commBtn subBtn" type="button" value="완료" onclick="before_submit(this.form)"/>
	            		</div>
            		</div>
            	</form>
            </section>
        </div>
        <!--감상평 게시판 종료-->
        
        <jsp:include page="../../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->
</body>
</html>