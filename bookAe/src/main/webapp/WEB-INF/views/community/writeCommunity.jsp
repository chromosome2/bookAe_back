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
    <link rel="shortcut icon" href="../resources/images/그림2.ico">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/normalize.css">
    <link rel="stylesheet" href="../resources/css/community.css">
    <link rel="stylesheet" href="../resources/css/summernote-lite.css">
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/common.js"></script>
    <script src="../resources/js/summernote-lite.js"></script>
    <script src="../resources/js/summernote-ko-KR.js"></script>
	<title>북愛 - 커뮤니티 페이지</title>
	<script type="text/javascript">
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 700,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: ''	//placeholder 설정
		          
			});
		});
	</script>
</head>
<body>
	<!--건너뛰기 링크 시작-->
    <a id="skipNav" href="mainContents">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--#wrapper 시작-->
    <div id="wrapper">
    
    	<jsp:include page="../common/headerOther.jsp"/>
    	
    	<!--감상평 게시판 시작-->
        <div class="communityMenu">
            <h2><img src="../resources/images/community.png" alt="게시판 로고" width="50">감상평 게시판</h2>
            <section>
            	<form action="${contextPath }/community/addArticle.do" method="post" enctype="multipart/form-data">
            		<div class="articleNameBox">
            			<select id="select_genre" name="select_genre">
	                        <option value="none">장르</option>
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
	                    </select>
            			<input id="articleName" type="text" name="title" placeholder="제목">
            		</div>
            		<textarea id="summernote" name="editordata"></textarea>
            	</form>
            </section>
        </div>
        <!--감상평 게시판 종료-->
        
        <jsp:include page="../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->
</body>
</html>