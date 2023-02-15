<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
    <link rel="stylesheet" href="../resources/css/login.css">
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/common.js"></script>
	<title>북愛 - 로그인 페이지</title>
</head>
<body>
	<!--건너뛰기 링크 시작-->
    <a id="skipNav" href="mainContents">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--#wrapper 시작-->
    <div id="wrapper">
    
    	<jsp:include page="../common/headerOther.jsp"/>
    	
    	<!--메인컨텐츠 시작-->
        <section class="memberLogin">
            <h2>로그인</h2>
            <form action="login" method="post" id="loginForm" name="frmLogin">
                <fieldset>
                    <legend>로그인 폼</legend>
                    <p class="idForm">
                        <label for="userID">아이디</label>
                        <input type="text" id="userID" name="user_id" required>
                    </p>
                    <p class="pwForm">
                        <label for="userPw">비밀번호</label>
                        <input type="password" id="userPw" name="user_pw" required>
                    </p>
                    <label class="autoLogin"><input type="checkbox" name="autoLoginCheck" value="autoLoginCheck"><i class="circle"></i>자동 로그인</label>
                    <button type="submit"><p>로그인</p></button>
                    <p>
                        <a href="#" class="lg_Fid">아이디찾기</a>/<a href="#" class="lg_Fpw">비밀번호찾기</a><a href="join.html" class="lg_join">회원가입하러가기</a>
                    </p>
                </fieldset>
            </form>
        </section>
        <!--메인컨텐츠 종료-->
        
        <jsp:include page="../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->

</body>
</html>