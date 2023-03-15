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
  		//좋아요 버튼 function
    	function fn_like_btn() {
    		var like_sw;
	    	if($("#like_btn").attr('class')==='like'){
	    		like_sw=true;
	    	}else{
	    		like_sw=false;
	    	}
	    	var board_like=${board.board_like};
	    	var board_num = ${board.board_num};
	    	
	    	//값이 null일시 'null'로 저장. 왜인지는 모름.
	    	var id= '<%=(String)session.getAttribute("id")%>';
	    	
	    	console.log(like_sw+" "+board_like+" "+board_num+" "+id);
	    	
	    	if(id==="null"){
	    		alert("로그인 해주세요!");
	    	}else{
	    		//좋아요 버튼을 누를때마다 sql문을 실행하기 위해 ajax로 데이터 전송
	    		var data={"board_num" : board_num, "id" : id};
	    		if(like_sw===false){
	    			$.ajax({
	    				type:'POST',
  						dataType:"json",
  						data: data,
	    				url:'${contextPath}/community/addLike.do',
	    				//왜인지는 모르겠지만 쓰면 전달이 안됨!
	    				//contentType:'application/json; charset=UTF-8',
	    				success:function(data){
	    					$('#like_btn').attr('class','like');
	    					$("#board_like").text(data['board_like']);
	    					like_sw=!like_sw;
	    				},
	    				error : function(data){
	    					alert('좋아요 실패! 잠시 뒤 다시 시도해주세요.');
	    				}
	    			})
	    		}else{
	    			$.ajax({
	    				type:'POST',
  						dataType:"json",
  						data: data,
	    				url:'${contextPath}/community/delLike.do',
	    				success:function(data){
	    	    			$('#like_btn').attr('class','unlike');
	    					$("#board_like").text(data['board_like']);
	    					like_sw=!like_sw;
	    				},
	    				error : function(data){
	    					alert('좋아요 취소 실패! 잠시 뒤 다시 시도해주세요.');
	    				}
	    			})
	    		}
	    		
	    	}
    	}
  		
  		//게시글 삭제
  		function fn_deleteArticle() {
  			var log_id='<%=(String)session.getAttribute("id")%>';
  			var writer='<c:out value="${board.id}"/>';
  			var board_num=${board.board_num};
  			console.log(log_id+" / "+writer+" / "+board_num);

  			//본인이 맞는지 확인
  			if(log_id == writer){
  				if(confirm("게시글을 정말 삭제하시겠습니까?")){
  					var data={"board_num" : board_num, "id" : log_id};
  	  				$.ajax({
  	    				type:'POST',
  						dataType:"json",
  						data: data,
  	    				url:'${contextPath}/community/delArticle.do',
  	    				success:function(data){
  	    					alert("삭제 완료했습니다.");
  	    					location.href="${contextPath}/community/community.do";
  	    				},
  	    				error : function(data){
  	    					alert('삭제를 실패했습니다. 1:1 문의를 이용해 주세요.');
  	    				}
  	    			})
  				}
  			}else{
  				alert("잘못된 접근입니다.");
  			}
  		}
  		
  		//수정버튼 눌렀을 시 이동
  		function fn_modArticle() {
  			var board_num=${board.board_num};
  			location.href='${contextPath}/community/modCommunityForm.do?board_num='+board_num;
  		}
  		
  		//댓글 내용을 작성하지 않았을 시 경고
  		function before_submit(frm){
  			var content= $('[name="comment_content"]').val();
  			var id='<%=(String)session.getAttribute("id")%>';
  			
  			//로그인했는지 확인
  			if(id!='null'){
  				if(content.trim() == ''){
  	  				alert("내용을 입력해주세요.");
  	  				return false;
  	  			}
  	  			frm.submit();
  			}else{
  				alert("로그인 후 이용가능합니다.")
  			}
  		}
  		
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
            			<span name="content" id="content">${board.board_content}</span>
            		</div>
            		<div id="article_footer_box">
            			<c:if test="${board.likeIs==true }">
            				<button id="like_btn" class="like" onclick="fn_like_btn()"><span id="heart">추천수</span><br><span id="board_like">${board.board_like }</span></button>
            			</c:if>
            			<c:if test="${board.likeIs==false }">
            				<button id="like_btn" class="unlike" onclick="fn_like_btn()"><span id="heart">추천수</span><br><span id="board_like">${board.board_like }</span></button>
            			</c:if>
            			
            			<p id="articleInfo">
	            			<c:if test="${board.id==id }">
	            				<input type="button" value="수정" class="articleInfoBtn modifyArticle" onclick="fn_modArticle()"/> | <input type="button" value="삭제" class="articleInfoBtn deleteArticle" onclick="fn_deleteArticle()"/>
	            			</c:if>
            			</p>
            			
            		</div>
            		<div id="article_comment_box">
            			<p id="article_comment_info">댓글 ${total_cntComment }</p>
            			
            			<section id="comment_view_sec">
	            			<c:if test="${!empty parentComment }">
	            				<c:forEach var="parent" items="${parentComment}">
	            					<div class="one_comment_box">
		            					<div class="comment_box parent_comment">
			            					<p class="parent_comment_header comment_header">
				            					<span class="parent_comment_nickname comment_nickname">${parent.nickname }</span>
				            					<span class="parent_comment_date comment_date">${parent.comment_date }</span>
			            					</p>
			            					<p class="parent_comment_content comment_content">${parent.comment_content }</p>
			            					<p class="parent_comment_footer comment_footer">
			            						<a href="#">수정</a> | <a href="#">삭제</a> | <a href="#">답글</a>
			            					</p>
			            				</div>
			            				<c:if test="${!empty childComment}">
			            					<c:forEach var="child" items="${childComment}">
			            						<c:if test="${child.comment_parent==parent.comment_num}">
			            							<div class="child_comment comment_box">
						            					<p class="child_comment_header comment_header">
						            						<span class="child_comment_L">┗</span>
						            						<span class="child_comment_nickname comment_nickname">${child.nickname }</span>
							            					<span class="child_comment_date comment_date">${child.comment_date }</span>
						            					</p>
						            					<p class="child_comment_content comment_content"><span class="reply_parent_nickname">@${child.annot_nickname }</span>${child.comment_content }</p>
						            					<p class="child_comment_footer comment_footer">
						            						<a href="#">수정</a> | <a href="#">삭제</a> | <a href="#">답글</a>
						            					</p>
						            				</div>
			            						</c:if>
			            					</c:forEach>
			            				</c:if>
			            			</div>
	            				</c:forEach>
	            			</c:if>
            			</section>
            				
           				<div id="write_comment">
           					<form action="${contextPath}/community/writeComment.do" method="post" id="writeComment" name="writeComment">
           						<textarea id="comment_textarea" rows="5" cols="100" name="comment_content"></textarea>
           						<div id="button_box">
				            		<input id="submitBtn" class="commBtn subBtn" type="button" value="작성" onclick="before_submit(this.form)"/>
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