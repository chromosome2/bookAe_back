<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

		<!--헤더와 메뉴 시작-->
       			<div id="myPageHeader">
            		<h2 id="myPageTitle"><a href="${contextPath}/myPage/myPagePrivacyCheck.do">마이 페이지</a></h2>
            		
            		<h3 id="D-day">북애를 펼친지 <span id="dayLeft">${dayLeft }</span> 일째 입니다.</h3>
           		</div>
            		
        		<div id="leftContents">
	        		<div id="myPageSideMenu">
	        			<ul class="sideMenu">
	        				<li class="sideMenuPart sideMenu1"><a href="${contextPath}/myPage/myPageView.do">1. 개인정보 수정</a></li>
	        				<li class="sideMenuPart sideMenu2"><a href="${contextPath}/myPage/myPageLike.do">2. 좋아요 누른 게시글</a></li>
	        				<li class="sideMenuPart sideMenu4"><a href="${contextPath}/myPage/myPageArticle.do">3. 내가 쓴 게시글</a></li>
	        				<li class="sideMenuPart sideMenu5"><a href="${contextPath}/myPage/myPageComment.do">4. 내가 달은 댓글</a></li>
	        			</ul>
	        		</div>
        		</div>
        <!--헤더와 메뉴 종료-->
