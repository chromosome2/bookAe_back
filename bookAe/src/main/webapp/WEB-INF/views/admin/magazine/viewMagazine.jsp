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
    <script src="${contextPath }/resources/js/summernote-lite.js"></script>
    <script src="${contextPath }/resources/js/lang/summernote-ko-KR.js"></script>
    
    <script type="text/javascript">
  		
  		//게시글 삭제
  		function fn_deleteArticle() {
  			var magazine_num=${magazine.magazine_num};
			if(confirm("게시글을 정말 삭제하시겠습니까?")){
				var data={"magazine_num" : magazine_num};
  				$.ajax({
    				type:'POST',
					dataType:"json",
					data: data,
    				url:'${contextPath}/community/delMagazine.do',
    				success:function(data){
    					alert("삭제 완료했습니다.");
    					location.href="${contextPath}/community/Magazine.do";
    				},
    				error : function(data){
    					alert('삭제를 실패했습니다. 1:1 문의를 이용해 주세요.');
    				}
    			})
			}
  		}
  		
  		//수정버튼 눌렀을 시 이동
  		function fn_modArticle() {
  			var magazine_num=${magazine.magazine_num};
  			location.href='${contextPath}/community/modMagazineForm.do?magazine_num='+magazine_num;
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
    
    	<jsp:include page="../../common/header.jsp"/>
    	
    	<!--감상평 게시판 시작-->
        <div class="communityMenu">
            <h2><a href="${contextPath}/community/magazine.do"><img src="${contextPath }/resources/images/community.png" alt="게시판 로고" width="50">매거진</a></h2>
            <section>
            	<div id="article_box">
            		<div id="article_header_box">
            			<p id="article_title"><span id="article_genre">&lt;${magazine.magazine_genre}&gt;</span> 
            			${magazine.magazine_title}</p>
            			<p id="article_header_info"><span id="article_view">조회 ${magazine.magazine_view}</span> / <span>${magazine.magazine_date}</span> / <span>관리자</span></p>
            		</div>
            		<div id="article_content_box">
            			<span id="content">${magazine.magazine_content}</span>
            		</div>
            		<div id="article_footer_box">
            			
            			<p id="articleInfo">
	            			<c:if test="${admin=='y' }">
	            				<input type="button" value="수정" class="articleInfoBtn modifyArticle btn" onclick="fn_modArticle()"/>
	            				 | <input type="button" value="삭제" class="articleInfoBtn deleteArticle btn" onclick="fn_deleteArticle()"/>
	            			</c:if>
            			</p>
            			
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