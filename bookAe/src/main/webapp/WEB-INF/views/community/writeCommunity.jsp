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
			location.href="${contextPath}/community/community.do";
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
    
    	<jsp:include page="../common/header.jsp"/>
    	
    	<!--감상평 게시판 시작-->
        <div class="communityMenu">
            <a href="${contextPath}/community/community.do"><h2><img src="${contextPath }/resources/images/community.png" alt="게시판 로고" width="50">감상평 게시글</h2></a>
            <section id="content_section">
            	<form action="${contextPath }/community/addArticle.do" method="post" id="writeArticleForm" name="writeArticleForm">
            		<div class="articleNameBox">
            			<select id="board_genre" name="board_genre">
	                        <option value="none">--장르--</option>
	                        <option value="LiberalArts">인문학</option>
	                        <option value="Novel">소설</option>
	                        <option value="Poem">시/에세이</option>
	                        <option value="Food">요리</option>
	                        <option value="Health">건강</option>
	                        <option value="Hobby">취미/실용/스포츠</option>
	                        <option value="Science">과학</option>
	                        <option value="SelfImprovement">자기계발</option>
	                        <option value="IT">컴퓨터/IT</option>
	                        <option value="History">역사/문화</option>
	                        <option value="etc">기타</option>
	                    </select>
            			<input id="board_title" type="text" name="board_title" placeholder="제목">
            		</div>
            		<div id="content_box">
            			<textarea id="summernote" name="board_content"></textarea>
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
        
        <jsp:include page="../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->
</body>
</html>