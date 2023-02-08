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
    <link rel="shortcut icon" href="${contextPath}/images/그림2.ico">
    <link rel="stylesheet" href="${contextPath}/css/common.css">
    <link rel="stylesheet" href="${contextPath}/css/normalize.css">
    <script src="${contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
	<title>북愛 - 메인 페이지</title>
</head>
<body>
		<!--헤더 시작-->
        <header>
            <div class="head">
                <h1 class="logo">
                    <a href="${contextPath}/views/index.jsp">
                        <img src="${contextPath}/images/logo.png" alt="BookAe 로고">
                    </a>
                </h1>
                <ul class="infoLink">
                    <li><a href="${contextPath}/views/login/login.jsp">로그인</a></li>
                    <li><a href="${contextPath}/views/join/join.jsp">회원가입</a></li>
                </ul>
                <div class="test">
                    <div class="search">
                        <h2 class="hidden">도서 검색</h2>
                        <form action="" method="get" id="searchForm">
                            <input type="text" id="bookSearch" name="bookSearch" placeholder="도서 검색" required>
                            <button type="submit">검색</button>
                        </form>
                    </div>
                </div>
            </div>
            <nav>
                <h2 class="hidden">메인 메뉴</h2>
                <ul class="mainMenu">
                    <li><a href="#">베스트 셀러</a>
                        <ul class="bestSeller">
                            <li><a href="#">전체 베스트셀러</a></li>
                            <li><a href="#">교보 베스트셀러</a></li>
                            <li><a href="#">Yes24 베스트셀러</a></li>
                            <li><a href="#">알라딘 베스트셀러</a></li>
                        </ul>
                    </li>
                    <li><a href="#">소식 구경</a>
                        <ul class="infomation">
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">매거진</a></li>
                            <li><a href="#">이벤트</a></li>
                            <li class="white">.</li>
                        </ul>
                    </li>
                    <li><a href="#">북애의 서재</a>
                        <ul class="recommend">
                            <li><a href="#">북애 추천</a></li>
                            <li><a href="#">셀럽 추천</a></li>
                            <li class="white">.</li>
                            <li class="white">.</li>
                        </ul>
                    </li>
                    <li><a href="#">커뮤니티</a>
                        <ul class="community">
                            <li><a href="${contextPath}/views/community/community.jsp">감상평</a></li>
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">추천게시판</a></li>
                            <li class="white">.</li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </header>
        <!--헤더 종료-->
</body>
</html>