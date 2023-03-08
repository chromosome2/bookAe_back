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
    <link rel="stylesheet" href="${contextPath }/resources/css/viewArticle.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/summernote-lite.css">
    <script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/js/common.js"></script>
    <script src="${contextPath }/resources/js/viewArticle.js"></script>
    <script src="${contextPath }/resources/js/summernote-lite.js"></script>
    <script src="${contextPath }/resources/js/lang/summernote-ko-KR.js"></script>
    
    <script type="text/javascript">
	    $(function () {
	    	//좋아요 버튼 function
	    	var like_sw=${board.likeIs};
	    	var board_like=${board.board_like};
	    	var board_num = ${board.board_num};
	    	var id= '<%=(String)session.getAttribute("id")%>';
	    	
	    	//좋아요 버튼을 누를때마다 sql문을 실행하기 위해
	    	if(!like_sw){
	    		$('#like_btn').click(function() {
	    			$.ajax({
	    				type:'POST',
	    				url:'${contextPath}/community/addLike.do',
	    				contentType:'application/json; charset=UTF-8',
	    				data:JSON.stringify({"board_num" : board_num,
   							  "id" : id}),
   						dataType:"json",
	    				success:function(data){
	    					alert('좋아요 성공!');
	    					$('#like_btn').attr('class','like');
	    					$("#board_like").text(board_like+1);
	    				},
	    				error : function(data){
	    					alert('실패!');
	    				}
	    			})
	    		})
	    	}else{
	    		$('#like_btn').click(function() {
	    			$.ajax({
	    				type:'POST',
	    				url:'${contextPath}/community/delLike.do',
	    				contentType:'application/json; charset=UTF-8',
	    				data:JSON.stringify({"board_num" : board_num,
 							  "id" : id}),
	    				success:function(data){
	    					alert('좋아요 취소 성공!');
	    	    			$('#like_btn').attr('class','unlike');
	    					$("#board_like").text(board_like-1);
	    				},
	    				error : function(data){
	    					alert('실패!');
	    				}
	    			})
	    		})
	    	}
	    });
    </script>
    
	<title>북愛 - 커뮤니티 페이지</title>
</head>
<body>
	
	<!--건너뛰기 링크 시작-->
    <a id="skipNav" href="communityMenu">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--#wrapper 시작-->
    <div id="wrapper">
    
    	<jsp:include page="../common/header.jsp"/>
    	
    	<!--감상평 게시판 시작-->
        <div class="communityMenu">
            <a href="${contextPath}/community/community.do"><h2><img src="${contextPath }/resources/images/community.png" alt="게시판 로고" width="50">감상평 게시글</h2></a>
            <section>
            	<div id="article_box">
            		<div id="article_header_box">
            			<p id="article_title"><span id="article_genre">&lt;${board.board_genre}&gt;</span> 
            			${board.board_title}</p>
            			<p id="article_header_info"><span id="article_view">조회 ${board.board_view}</span> / <span>${board.board_date}</span> / <span>${board.nickname }</span></p>
            		</div>
            		<div id="article_content_box">
            			<span name="content" id="content" disabled>${board.board_content}</span>
            		</div>
            		<div id="article_footer_box">
            			<c:if test="${board.likeIs==true }">
            				<button id="like_btn" class="like"><span id="heart">추천수</span><br><span id="board_like">${board.board_like }</span></button>
            			</c:if>
            			<c:if test="${board.likeIs==false }">
            				<button id="like_btn" class="unlike"><span id="heart">추천수</span><br><span id="board_like">${board.board_like }</span></button>
            			</c:if>
            		</div>
            		<div id="article_comment_box">
            			<p id="article_comment_info">댓글 0</p>
            			<div id="one_comment_box">
            				<div id="parent_comment" class="comment_box">
            					<p id="parent_comment_header" class="comment_header">
	            					<span id="parent_comment_nickname" class="comment_nickname">꼬미집사</span>
	            					<span id="parent_comment_date" class="comment_date">2023.03.08</span>
            					</p>
            					<p id="parent_comment_content" class="comment_content">이런 해석도 가능하군요. 저와 다른 관점이라 흥미롭게 봤습니다. 추천드리고 갑니다.</p>
            					<p id="parent_comment_footer" class="comment_footer">
            						<a href="#">수정</a> | <a href="#">삭제</a> | <a href="#">답글</a>
            					</p>
            				</div>
            				
            				<div id="child_comment" class="comment_box">
            					<p id="child_comment_header" class="comment_header">
            						<span id="child_comment_nickname" class="comment_nickname">2가염색체나열</span>
	            					<span id="child_comment_date" class="comment_date">2023.03.08</span>
            					</p>
            					<p id="child_comment_content" class="comment_content"><span id="reply_parent_nickname">@꼬미집사</span>추천 감사합니다. 꼬미집사님의 의견도 들어보고싶군요.</p>
            					<p id="child_comment_footer" class="comment_footer">
            						<a href="#">수정</a> | <a href="#">삭제</a> | <a href="#">답글</a>
            					</p>
            				</div>
            				
            				<div id="write_comment">
            					<form action="${contextPath}/community/writeComment.do" method="post" id="writeComment" name="writeComment">
            						<textarea rows="5" cols="100" name="comment_content"></textarea>
            						<div id="button_box">
					            		<input id="submitBtn" class="commBtn subBtn" type="button" value="완료" onclick="before_submit(this.form)"/>
				            		</div>
            					</form>
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