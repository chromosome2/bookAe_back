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
  		
  		//댓글 삭제
  		function fn_delComment(writer,comment_num){
  			var id='<%=(String)session.getAttribute("id")%>';
  			var board_num=${board.board_num};
  			
  			console.log(id+" / "+writer+" / "+comment_num+" / "+board_num);
  			
  			//본인확인
  			if(id==writer){
  				if(confirm("댓글을 정말 삭제하시겠습니까?")){
  					var data={"board_num" : board_num, "comment_num" : comment_num};
  	  				$.ajax({
  	    				type:'POST',
  						dataType:"json",
  						data: data,
  	    				url:'${contextPath}/community/delComment.do',
  	    				success:function(data){
  	    					alert("삭제 완료했습니다.");
  	    					location.href='${contextPath}/community/viewArticle.do?board_num='+board_num;
  	    				},
  	    				error : function(data){
  	    					alert('삭제를 실패했습니다. 1:1 문의를 이용해 주세요.');
  	    				}
  	    			})
  				}
  			}else{
  				alert("잘못된 접근입니다. 다시 시도해주세요.");
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
	            				<input type="button" value="수정" class="articleInfoBtn modifyArticle btn" onclick="fn_modArticle()"/>
	            				 | <input type="button" value="삭제" class="articleInfoBtn deleteArticle btn" onclick="fn_deleteArticle()"/>
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
			            					
			            					<div class="content_box content_box${parent.comment_num }">
			            						<!-- 댓글 내용 -->
			            						<p class="parent_comment_content comment_content" id="comment_content${parent.comment_num }">${parent.comment_content }</p>
			            						
			            						<!-- 댓글 수정 -->
			            						<div id="mod_comment${parent.comment_num }" class="mod_comment">
													<form action="${contextPath}/community/modComment.do" method="post" id="modComment" name="modComment">
														<textarea id="modComment_textarea" rows="9" cols="40" name="comment_content">${parent.comment_content }</textarea>
														<input type="hidden" value="${parent.comment_num }" name="comment_num">
														<input type="hidden" value="${parent.board_num }" name="board_num">
														
														<div id="button_box">
															<input id="closeMod" class="commBtn closeBtn" type="button" value="닫기" onclick="modCommentClose()"/>
												 			<input id="submitBtn" class="commBtn subBtn" type="button" value="수정" onclick="before_submit_modComment(this.form)"/>
														</div>
													</form>
												</div>
												<!-- 댓글 수정 끝 -->
												
			            					</div>
			            					
			            					<!-- 수정, 삭제, 답글 -->
			            					<c:if test="${!empty id}">
				            					<p class="parent_comment_footer comment_footer" id="comment_footer${parent.comment_num }">
				            						<c:if test="${id == parent.id }">
					            						<input type="button" value="수정" class="commentBtn btn" onclick="fn_modComment('${parent.comment_num}')"/>
					            						 | 
					            						<input type="button" value="삭제" class="commentBtn btn" onclick="fn_delComment('${parent.id}','${parent.comment_num }')"/>
				            						</c:if>
					            					 | 
				            						<input type="button" value="답글" class="commentBtn btn" onclick="fn_replyComment('${board.board_num }', '${parent.comment_num }', 0)"/>
				            					</p>
			            					</c:if>
			            					
			            					<!-- 로그인 안됐을 시, 댓글들 사이 간격이 짧아 넣어줌. -->
			            					<c:if test="${empty id}">
			            						<div class="space"></div>
			            					</c:if>
			            					<!-- 수정, 삭제, 답글 끝 -->
			            					
			            				</div>
			            				<c:if test="${!empty childComment}">
			            					<c:forEach var="child" items="${childComment}">
			            						<c:if test="${child.comment_parent==parent.comment_num && child.deleteis==1}">
			            							<div class="child_comment comment_box">
						            					<p class="child_comment_header comment_header">
						            						<span class="child_comment_L">┗</span>
						            						<span class="child_comment_nickname comment_nickname">${child.nickname }</span>
							            					<span class="child_comment_date comment_date">${child.comment_date }</span>
						            					</p>
						            					
						            					<div class="content_box content_box${child.comment_num }">
						            						<!-- 댓글 내용 -->
						            						<p class="child_comment_content comment_content" id="comment_content${child.comment_num }"><span class="reply_parent_nickname">@${child.annot_nickname }</span><span class="comment_content_box">${child.comment_content }</span></p>
						            						
						            						<!-- 댓글 수정 -->
						            						<div id="mod_comment${child.comment_num }" class="mod_comment">
																<form action="${contextPath}/community/modComment.do" method="post" id="modComment" name="modComment">
																	<textarea id="modComment_textarea" rows="9" cols="40" name="comment_content">${child.comment_content }</textarea>
																	<input type="hidden" value="${child.comment_num }" name="comment_num">
																	<input type="hidden" value="${child.board_num }" name="board_num">
																	
																	<div id="button_box">
																		<input id="closeMod" class="commBtn closeBtn" type="button" value="닫기" onclick="modCommentClose()"/>
															 			<input id="submitBtn" class="commBtn subBtn" type="button" value="수정" onclick="before_submit_modComment(this.form)"/>
																	</div>
																</form>
															</div>
															<!-- 댓글 수정 끝 -->
															
						            					</div>
						            						
					            						<!-- 수정, 삭제, 답글 -->
						            					<c:if test="${!empty id }">
							            					<p class="child_comment_footer comment_footer" id="comment_footer${child.comment_num }">
							            						<c:if test="${id == child.id }">
								            						<input type="button" value="수정" class="commentBtn btn" onclick="fn_modComment('${child.comment_num}')"/>
								            						 | <input type="button" value="삭제" class="commentBtn btn" onclick="fn_delComment('${child.id}','${child.comment_num }')"/>
							            						</c:if>
							            						 | <input type="button" value="답글" class="commentBtn btn" onclick="fn_replyComment('${board.board_num }', '${parent.comment_num }', '${child.comment_num }')"/>
							            					</p>
						            					</c:if>
						            					
						            					<!-- 로그인 안됐을 시, 댓글들 사이 간격이 짧아 넣어줌. -->
						            					<c:if test="${empty id}">
						            						<div class="space"></div>
						            					</c:if>
						            					<!-- 수정, 삭제, 답글 끝 -->
						            					
						            				</div>
			            						</c:if>
			            					</c:forEach>
			            				</c:if>
			            				
			            				<div id="replyBox${parent.comment_num }" class="replyBox">
			            					<span class="reply_child_comment_L">┗</span>
			            					<form action="${contextPath}/community/replyComment.do" method="post" id="replyComment" name="replyComment">
												<textarea id="reply_textarea" rows="5" cols="90" name="comment_content"></textarea>
												<input type="hidden" name="comment_annot" class="reply_comment_annot">
												<input type="hidden" name="board_num" class="reply_board_num">
												<input type="hidden" value="${id }" name="id">
												
												<div id="button_box">
													<input id="closeReply" class="commBtn closeBtn" type="button" value="닫기" onclick="replyClose()"/>
										 			<input id="submitBtn" class="commBtn subBtn" type="button" value="작성" onclick="before_submit_replyComment(this.form)"/>
												</div>
											</form>
			            				</div>
			            				
			            			</div>
	            				</c:forEach>
	            			</c:if>
            			</section>
            				
            			
   						<div id="write_comment">
           					<form action="${contextPath}/community/addParentComment.do" method="post" id="writeComment" name="writeComment">
           						<textarea id="comment_textarea" rows="5" cols="100" name="comment_content"></textarea>
           						<input type="hidden" value="${id }" name="id">
           						<input type="hidden" value="${board.board_num }" name="board_num">
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