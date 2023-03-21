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
		                    <form action="${contextPath}/myPage/privacyChange.do" method="post" id="privacyChange" name="privacyChange">
		                        <div class="privacyBox">
		                            <p>
		                            	<span class="obj">이름</span>
				                        <input type="text" id="name" name="name" value="${member.name }" required placeholder="이름">
				                    </p>
				                    <p>
				                    	<span class="obj">아이디</span>
				                        <input type="text" id="id" name="id" value="${member.id }" readonly required placeholder="아이디">
				                        <span class="logInfo"></span>
				                    </p>
				                    <p>
				                    	<span class="obj">비밀번호</span>
				                        <input type="password" id="pw" name="pw" required placeholder="비밀번호">
				                        <span class="logInfo"></span>
				                    </p>
				                    <p>
				                    	<span class="obj">비밀번호 확인</span>
				                        <input type="password" id="passwordCheck" name="passwordCheck" required placeholder="비밀번호 확인" onkeyup="passCheck()">
				                        <span class="logInfo passCInfo"></span>
				                    </p>
				                    <p>
				                    	<span class="obj">닉네임</span>
				                        <input type="text" id="nickname" name="nickname" maxlength=7 value="${member.nickname }" required placeholder="닉네임">
				                        <span class="logInfo"></span>
				                    </p>
				                    <p>
				                    	<span class="obj">전화번호</span>
				                        <input type="tel" id="tel" name="tel" maxlength="11" value="0${member.tel }" placeholder="전화번호" required>
				                        <span class="logInfo"></span>
				                    </p>
				                    <p class="emailArea">
				                    	<span class="obj">이메일</span>
				                        <input type="text" id="email" name="email" value="${member.email }" required placeholder="이메일">
				                        <a>@</a>
				                        <input type="text" id="email_add" name="email_add" value="${member.email_add }" required readonly value="naver.com">
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
				                        <button type="submit" class="btnJoin">수정</button>
				                    </div>
		                        </div>
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