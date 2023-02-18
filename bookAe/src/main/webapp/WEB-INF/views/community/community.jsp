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
    	
    	<!--감상평 게시판 시작-->
        <div class="communityMenu">
            <h2><img src="../resources/images/community.png" alt="게시판 로고" width="50">감상평 게시판</h2>
            <section>
                <form action="search_community.jsp" method="get" id="searchBook">
                    <select name="head">
                        <option value="title">전체</option>
                        <option value="name">제목</option>
                        <option value="writer">글쓴이</option>
                        <option value="naeyong">내용</option>
                    </select>
                    <input type="text" id="Search_community" name="Search_community" required>
                    <button type="submit">검색</button>
                </form>
                <table class="tableCommu">
                    <tr id="title">
                        <th>번호</th><th>제목</th><th>작성시간</th><th>글쓴이</th>
                    </tr>
                    <c:if test="${empty communityList }">
                    	<tr>
                    		<td colspan="4" align="center">게시글이 없습니다.</td>
                    	</tr>
                    </c:if>
                    <c:if test="${!empty communityList }">
	                    <c:forEach var="community" items="${communityList }" varStatus="communityNum">
		                    <tr>
		                        <td>${max_num-communityNum.count+1 }</td>
		                        <td>
		                        	<a href="#">
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
                <a href="#" id="writeCom">글쓰기</a>
                <div class="page">
                    <a>&lt;</a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">&gt;</a>
                </div>
            </section>
        </div>
        <!--감상평 게시판 종료-->
        
        <jsp:include page="../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->
</body>
</html>