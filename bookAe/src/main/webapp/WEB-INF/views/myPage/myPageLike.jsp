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
    <link rel="stylesheet" href="${contextPath }/resources/css/myPageView2.css">
    <script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/js/common.js"></script>
    <script src="${contextPath }/resources/js/myPageView2.js"></script>
	<title>북愛 - 감상평 페이지</title>
	<script type="text/javascript">
	</script>
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
		                    
		                    <table class="tableCommu">
		                    
			                    <tr id="title">
			                        <th>번호</th><th>제목</th><th>작성시간</th><th>글쓴이</th>
			                    </tr>
			                    
			                    <!-- 게시글 -->
			                    <c:if test="${empty communityList }">
			                    	<tr>
			                    		<td colspan="4" align="center">좋아요한 게시글이 없습니다.</td>
			                    	</tr>
			                    </c:if>
			                    <c:if test="${!empty communityList }">
				                    <c:forEach var="community" items="${communityList }" varStatus="communityNum">
					                    <tr>
					                        <td>${(totalArticle-((paging.nowPage-1)*8))-communityNum.count+1 }</td>
					                        <td>
					                        	<a href="${contextPath }/community/viewArticle.do?board_num=${community.board_num}">
					                        	<span class="genre">&lt;${community.board_genre }&gt;</span> 
					                        	${community.board_title }(
					                        	<span class="recommend">추천수</span>${community.board_like })</a>
					                        </td>
					                        <td>${community.board_date}</td>
					                        <td>${community.nickname }</td>
					                    </tr>
				                    </c:forEach>
			                    </c:if>
			                </table>
		                    
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