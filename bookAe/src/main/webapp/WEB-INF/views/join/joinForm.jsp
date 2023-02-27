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
    <link rel="stylesheet" href="../resources/css/join.css">
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/join.js"></script>
    <script src="../resources/js/common.js"></script>
	<title>북愛 - 가입 페이지</title>
</head>
<body>
    <!--건너뛰기 링크 시작-->
    <a id="skipNav" href="mainContents">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--#wrapper 시작-->
    <div id="wrapper">
    
    	<jsp:include page="../common/header.jsp"/>
    
    <!--메인컨텐츠 시작-->
        <section class="memberJoin">
            <h2>회원가입</h2>
            <form action="${contextPath }/join/joinMember.do" method="post" id="joinForm" name="joinForm">
                <fieldset>
                    <legend>회원가입 정보 입력 폼</legend>
                    <p>
                        <input type="text" id="name" name="name" required placeholder="이름">
                    </p>
                    <p>
                        <input type="text" id="id" name="id" required placeholder="아이디">
                        <span class="logInfo"></span>
                    </p>
                    <p>
                        <input type="password" id="pw" name="pw" required placeholder="비밀번호">
                        <span class="logInfo"></span>
                    </p>
                    <p>
                        <input type="password" id="passwordCheck" name="passwordCheck" required placeholder="비밀번호 확인" onkeyup="passCheck()">
                        <span class="logInfo passCInfo"></span>
                    </p>
                    <p>
                        <input type="text" id="nickname" name="nickname" maxlength=7 required placeholder="닉네임">
                        <span class="logInfo"></span>
                    </p>
                    <p>
                        <input type="tel" id="tel" name="tel" maxlength="11" placeholder="전화번호" required>
                        <span class="logInfo"></span>
                    </p>
                    <p class="emailArea">
                        <input type="text" id="email" name="email" required placeholder="이메일">
                        <a>@</a>
                        <input type="text" id="email_add" name="email_add" required readonly value="naver.com">
                        <select id="email_after" name="email_after">
                            <option value="naver">naver.com</option>
                            <option value="daum">daum.net</option>
                            <option value="google">gmail.com</option>
                            <option value="nate">nate.com</option>
                            <option value="1">직접 입력</option>
                        </select>
                    </p>
                    <p class="news">
                        <span>북애의 소식을 받으시겠습니까?</span>
                        <label class="telNews"><input type="checkbox" name="newsCheck" value="tel"><i class="circle"></i>핸드폰</label>
                        <label><input type="checkbox" name="newsCheck" value="mail"><i class="circle"></i>이메일</label>
                    </p>
                    <div class="btnJoinArea">
                        <button type="submit" class="btnJoin"><p>가입하기</p></button>
                    </div>
                </fieldset>
            </form>
        </section>
        <!--메인컨텐츠 종료-->
        
        <jsp:include page="../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->

</body>
</html>