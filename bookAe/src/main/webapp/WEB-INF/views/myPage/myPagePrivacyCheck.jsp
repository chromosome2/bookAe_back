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
    <link rel="stylesheet" href="${contextPath }/resources/css/myPageViewCommon.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/myPageView1.css">
    <script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/js/common.js"></script>
    <script src="${contextPath }/resources/js/myPageView1.js"></script>
	<title>북愛 - 감상평 페이지</title>
</head>

<body>
	<!--건너뛰기 링크 시작-->
    <a id="skipNav" href="mainContents">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--#wrapper 시작-->
    <div id="wrapper">
    
    	<jsp:include page="../common/header.jsp"/>
    	
    	<!--감상평 게시판 시작-->
        <div class="mainContents">
        	
        	<section>
        	
        		<jsp:include page="../common/myPageHeader.jsp"/>
        		
        		<div id="rightContents">
            		
            		<div class="myPageContents">
            			
            			<div class="contents_wrapper">
		                    <p class="mini_title">※ 개인정보 수정</p>
		                    <form action="${contextPath}" method="post" id="pwd_checkForm" name="pwd_checkForm">
		                        <div class="password_check_area">
		                            <h5>비밀번호 재확인</h5>
		                            <p>안전한 정보보호를 위하여 비밀번호를 다시 한번 확인합니다.<br>비밀번호가 타인에게 노출되지 않도록 주의하여 주세요.</p>
		                            <input type="password" class="pwd_check_box" name="pwd" placeholder="비밀번호">
		                        </div>
		                        <input class="submitBtn" type="submit" value="확인">
		                    </form>
		                </div>
		                
            		</div>
            	</div>
            	
            </section>
            
        </div>
        <!--감상평 게시판 종료-->
        
        <jsp:include page="../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->
</body>
</html>