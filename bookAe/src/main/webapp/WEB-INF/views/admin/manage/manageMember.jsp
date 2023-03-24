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
    <script src="${contextPath }/resources/js/manageMember.js"></script>
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
    
    	<jsp:include page="../../common/header.jsp"/>
    	
    	<!--감상평 게시판 시작-->
        <div class="mainContents">
        	
        	<section>
        	
        		<!-- header시작 -->
    			<div id="manageMemberHeader">
            		<h2 id="manageMemberTitle"><a href="${contextPath}/admin/manageMember.do">회원 관리</a></h2>
           		</div>
           		<!-- header시작 -->
            		
           		<div class="manageMemberContents">
           			
           			<div class="contents_wrapper">
           			
           				<form action="${contextPath}/admin/manageMember.do" method="get" id="searchMember">
		                    <select name="head" id="searchHeadBox">
		                        <option value="id">아이디</option>
		                        <option value="name">이름</option>
		                        <option value="nickname">닉네임</option>
		                        <option value="tel">전화번호</option>
		                        <option value="email">이메일</option>
		                        <option value="joindate">가입 날짜</option>
		                    </select>
		                    <input type="text" id="search_member_keyword" name="search_community" required>
		                    <input id="submitBtn" class="subBtn" type="submit" value="검색"/>
		                </form>
	                    
	                    <table class="tableCommu">
	                    
		                    <tr id="title">
		                        <th>번호</th><th>아이디</th><th>이름</th><th>닉네임</th><th>전화번호</th><th>이메일</th><th>가입일</th><th>삭제</th>
		                    </tr>
		                    
		                    <!-- 게시글 -->
		                    <c:if test="${empty memberList }">
		                    	<tr>
		                    		<td colspan="8" align="center">회원이 없습니다.</td>
		                    	</tr>
		                    </c:if>
		                    <c:if test="${!empty memberList }">
			                    <c:forEach var="member" items="${memberList }" varStatus="memberNum">
				                    <tr>
				                        <td>${((paging.nowPage-1)*8)+memberNum.count }</td>
				                        <td>${member.id}</td>
				                        <td>${member.name}</td>
				                        <td>${member.nickname }</td>
				                        <td>0${member.tel }</td>
				                        <td>${member.email }</td>
				                        <td>${member.joindate }</td>
				                        <td><input type="button" value="정보 삭제" onclick="delMember('${member.id}')"></td>
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
		                		<a href="${contextPath }/admin/manageMember.do?nowPage=${paging.startPage - 1 }&head=${head}&search_community=${keyword}">&lt;</a>
		                	</c:if>
		                	
		                	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		                		<c:choose>
		                			<c:when test="${p == paging.nowPage }">
		                				<span class="present_page">${p }</span>
		                			</c:when>
		                			<c:when test="${p != paging.nowPage }">
		                				<a href="${contextPath }/admin/manageMember.do?nowPage=${p }&head=${head}&search_community=${keyword}">${p }</a>
		                			</c:when>
		                		</c:choose>
		                	</c:forEach>
		                	
		                	<!-- 화면의 끝 페이지랑 전체마지막페이지랑 같지않다면 '>'추가 -->
		                	<c:if test="${paging.endPage !=paging.lastPage }">
		                		<a href="${contextPath }/admin/manageMember.do?nowPage=${paging.startPage - 1 }&head=${head}&search_community=${keyword}">&gt;</a>
		                	</c:if>
		                </div>
             		</div>
	                
           		</div>
            	
            </section>
            
        </div>
        <!--감상평 게시판 종료-->
        
        <jsp:include page="../../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->
</body>
<script type="text/javascript">
	//멤버 삭제
	function delMember(id){
		var admin='<%=(String)session.getAttribute("id")%>';
		if(admin=='admin'){
			if(confirm("회원을 정말 삭제하시겠습니까?")){
				var data={"id" : id};
				$.ajax({
  					type:'POST',
					dataType:"json",
					data: data,
  					url:'${contextPath}/admin/delMember.do',
  					success:function(data){
  						alert("삭제 완료했습니다.");
  						location.href='${contextPath}/admin/manageMember.do';
  					},
  					error : function(data){
  						alert('삭제를 실패했습니다. 서버로 문의해주세요.');
  					}
  				})
			}
		}else{
			alert("잘못된 접근입니다. 다시 시도해주세요.");
		}
	}
</script>
</html>