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
    <link rel="stylesheet" href="${contextPath }/resources/css/myPageView4.css">
    <script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/js/common.js"></script>
    <script src="${contextPath }/resources/js/myPageView4.js"></script>
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
			                        <th>번호</th><th>댓글 내용</th><th>작성시간</th><th>작성자</th>
			                    </tr>
			                    
			                    <!-- 게시글 -->
			                    <c:if test="${empty commentList }">
			                    	<tr>
			                    		<td colspan="4" align="center">내가 쓴 댓글이 없습니다.</td>
			                    	</tr>
			                    </c:if>
			                    <c:if test="${!empty commentList }">
				                    <c:forEach var="comment" items="${commentList }" varStatus="commentNum">
					                    <tr>
					                        <td>${(totalComment-((paging.nowPage-1)*8))-commentNum.count+1 }</td>
					                        <td>
					                        	<a href="${contextPath }/community/viewArticle.do?board_num=${comment.board_num}">
					                        		<p class="comment_content" id="comment_content${comment.comment_num }">
					                        			<span class="comment_board_title">&lt;${comment.board_title }&gt;</span><br>
					                        			<c:if test="${!empty comment.annot_nickname }">
					                        				<span class="reply_parent_nickname">@${comment.annot_nickname }</span>
					                        			</c:if>
					                        			<span class="comment_content_box">${comment.comment_content }</span>
					                        		</p>
					                        	</a>
					                        </td>
					                        <td>${comment.comment_date}</td>
					                        <td>${nickname }</td>
					                    </tr>
				                    </c:forEach>
			                    </c:if>
			                </table>
		                    
		                </div>
		                
		                <div id="contents_footer">
			                <!-- 페이징 -->
			                <div class="page">
			                	<!-- 시작페이지가 1이 아니면 '<' 추가 -->
			                	<c:if test="${paging.startPage !=1 }">
			                		<a href="${contextPath }/myPage/myPageComment.do?nowPage=${paging.startPage - 1 }">&lt;</a>
			                	</c:if>
			                	
			                	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			                		<c:choose>
			                			<c:when test="${p == paging.nowPage }">
			                				<span class="present_page">${p }</span>
			                			</c:when>
			                			<c:when test="${p != paging.nowPage }">
			                				<a href="${contextPath }/myPage/myPageComment.do?nowPage=${p }">${p }</a>
			                			</c:when>
			                		</c:choose>
			                	</c:forEach>
			                	
			                	<!-- 화면의 끝 페이지랑 전체마지막페이지랑 같지않다면 '>'추가 -->
			                	<c:if test="${paging.endPage !=paging.lastPage }">
			                		<a href="${contextPath }/myPage/myPageComment.do?nowPage=${paging.startPage - 1 }">&gt;</a>
			                	</c:if>
			                </div>
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