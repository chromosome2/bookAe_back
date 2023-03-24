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
    <script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/js/common.js"></script>
    <script src="${contextPath }/resources/js/community.js"></script>
	<title>북愛 - 매거진</title>
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
            <section>
            
                <form action="${contextPath}/community/magazine.do" method="get" id="searchBook">
                    <select name="head">
                        <option value="total">전체</option>
                        <option value="board_title">제목</option>
                        <option value="board_content">내용</option>
                    </select>
                    <input type="text" id="search_community" name="search_community" required>
                    <input id="submitBtn" class="subBtn" type="button" value="검색" onclick="before_submit(this.form)"/>
                </form>
                
                <table class="tableCommu">
                    <tr id="title">
                        <th>번호</th><th>제목</th><th>작성시간</th><th>글쓴이</th>
                    </tr>
                    
                    <!-- 게시글 -->
                    <c:if test="${empty magazineList }">
                    	<tr>
                    		<td colspan="4" align="center">게시글이 없습니다.</td>
                    	</tr>
                    </c:if>
                    <c:if test="${!empty magazineList }">
	                    <c:forEach var="magazine" items="${magazineList }" varStatus="magazineNum">
		                    <tr>
		                        <td>${(totalArticle-((paging.nowPage-1)*8))-magazineNum.count+1 }</td>
		                        <td>
		                        	<a href="${contextPath }/community/viewMagazine.do?magazine_num=${magazine.magazine_num}">
		                        	<span class="genre">&lt;${magazine.magazine_genre }&gt;</span> 
		                        	${magazine.magazine_title }</a>
		                        </td>
		                        <td>${magazine.board_date}</td>
		                        <td>관리자</td>
		                    </tr>
	                    </c:forEach>
                    </c:if>
                </table>
                
                <div id="contents_footer">
                	<!-- 글쓰기 버튼 -->
	                <c:if test="${admin=='y' }">
	                	<a href="${contextPath }/community/writeMagazine.do" id="writeCom">글쓰기</a>
	                </c:if>
	                
	                <!-- 페이징 -->
	                <div class="page">
	                	<!-- 시작페이지가 1이 아니면 '<' 추가 -->
	                	<c:if test="${paging.startPage !=1 }">
	                		<a href="${contextPath }/community/magazine.do?nowPage=${paging.startPage - 1 }&head=${head}&search_community=${keyword}">&lt;</a>
	                	</c:if>
	                	
	                	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
	                		<c:choose>
	                			<c:when test="${p == paging.nowPage }">
	                				<span class="present_page">${p }</span>
	                			</c:when>
	                			<c:when test="${p != paging.nowPage }">
	                				<a href="${contextPath }/community/magazine.do?nowPage=${p }&head=${head}&search_community=${keyword}">${p }</a>
	                			</c:when>
	                		</c:choose>
	                	</c:forEach>
	                	
	                	<!-- 화면의 끝 페이지랑 전체마지막페이지랑 같지않다면 '>'추가 -->
	                	<c:if test="${paging.endPage !=paging.lastPage }">
	                		<a href="${contextPath }/community/magazine.do?nowPage=${paging.endPage+1 }&head=${head}&search_community=${keyword}">&gt;</a>
	                	</c:if>
	                </div>
                </div>
            </section>
        </div>
        <!--감상평 게시판 종료-->
        
        <jsp:include page="../../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->
</body>
</html>