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
    <link rel="stylesheet" href="${contextPath }/resources/css/myPagePrivacy.css">
    <script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/js/common.js"></script>
    <script src="${contextPath }/resources/js/join.js"></script>
    <script src="${contextPath }/resources/js/myPageView1.js"></script>
	<title>북愛 - 감상평 페이지</title>
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
		                    <p class="mini_title">※ 개인정보 수정</p>
		                    <form action="${contextPath}/myPage/privacyChange.do" method="post" id="privacyChange" name="privacyChange">
		                        <div class="privacyBox">
				                    <p class="oneBox">
				                    	<span class="obj">아이디</span>
				                        <input type="text" id="id" name="id" value="${member.id }" readonly required placeholder="아이디">
				                    </p>
		                            <p class="oneBox">
		                            	<span class="obj">이름</span>
				                        <input type="text" id="name" name="name" value="${member.name }" required placeholder="이름">
				                    </p>   
				                    <p class="oneBox">
				                    	<span class="obj">비밀번호</span>
				                        <input type="password" id="pw" name="pw" required placeholder="비밀번호">
				                    </p>
				                    <p class="oneBox">
				                    	<span class="obj">비밀번호 확인</span>
				                        <input type="password" id="passwordCheck" name="passwordCheck" required placeholder="비밀번호 확인" onkeyup="passCheck()">
				                        <span class="logInfo passCInfo"></span>
                        				<input type="hidden" id="pwCheckBeforeJoin" value="false">
				                    </p>
				                    <p class="oneBox">
				                    	<span class="obj">닉네임</span>
				                        <input type="text" id="nickname" name="nickname" maxlength=7 value="${member.nickname }" required placeholder="닉네임" onchange="nicknameCheck()">
				                        <span class="logInfo nickInfo"></span>
                        				<input type="hidden" id="nickCheckBeforeJoin" value="true">
				                    </p>
				                    <p class="oneBox">
				                    	<span class="obj">전화번호</span>
				                        <input type="tel" id="tel" name="tel" maxlength="11" value="0${member.tel }" placeholder="전화번호" required onkeyup="telCheck()">
				                        <span class="logInfo telInfo"></span>
                        				<input type="hidden" id="telCheckBeforeJoin" value="true">
				                    </p>
				                    <p class="emailArea oneBox">
				                    	<span class="obj">이메일</span>
				                        <input type="text" id="email" name="email" value="${member.email }" required placeholder="이메일">
				                        <a>@</a>
				                        <input type="text" id="email_add" name="email_add" value="${member.email_add }" required readonly value="naver.com">
				                        <select id="email_after" name="email_after">
				                            <option value="naver">naver.com</option>
				                            <option value="daum">daum.net</option>
				                            <option value="google">gmail.com</option>
				                            <option value="nate">nate.com</option>
				                            <option value="1">직접 입력</option>
				                        </select>
				                    </p>
				                    <p class="news oneBox">
				                        <span>북애의 소식을 받으시겠습니까?</span>
				                        <label class="telNews"><input type="checkbox" name="newsCheck" value="tel"><i class="circle"></i>핸드폰</label>
				                        <label><input type="checkbox" name="newsCheck" value="mail"><i class="circle"></i>이메일</label>
				                    </p>
				                    <div class="modBtnArea">
				                        <input type="button" class="modBtn" onclick="beforeSubmit(this.form)" value="가입하기">
				                    </div>
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
<script type="text/javascript">
	//닉네임중복 체크
	function nicknameCheck(){
		var nickname=document.getElementById('nickname').value;
		var origin_nickname='<c:out value="${member.nickname}"/>';
		
		if(origin_nickname!=nickname){
			var data={"nickname" : nickname};
			$.ajax({
				type:'POST',
				dataType:"json",
				data: data,
				url:'${contextPath}/join/nicknameCheck.do',
				success:function(data){
					if(data['result']=='true'){
						$('.nickInfo').text('* 이미 사용중인 닉네임입니다.');
						$('#nickCheckBeforeJoin').attr('value','false');
						$('.nickInfo').css('color','rgb(226, 42, 42)');
					}else{
						$('.nickInfo').text('* 사용 가능한 닉네임입니다.');
						$('#nickCheckBeforeJoin').attr('value','true');
						$('.nickInfo').css('color','rgb(42, 148, 42)');
					}
				},
				error : function(data){
					alert('실패했습니다. 1:1 문의를 이용해 주세요.');
					$('#nickCheckBeforeJoin').attr('value','false');
				}
			})
		}else{
			$('.nickInfo').text('* 사용 가능한 닉네임입니다.');
			$('#nickCheckBeforeJoin').attr('value','true');
			$('.nickInfo').css('color','rgb(42, 148, 42)');
		}
		
		
	}
	
	
	//경고문을 제대로 지키지 않았을 시 alert
	function beforeSubmit(frm){
		var pwCheckBeforeJoin=$('#pwCheckBeforeJoin').val();
		var nickCheckBeforeJoin=$('#nickCheckBeforeJoin').val();
		var telCheckBeforeJoin=$('#telCheckBeforeJoin').val();
		
		if(pwCheckBeforeJoin!='true' || nickCheckBeforeJoin!='true' || telCheckBeforeJoin!='true'){
			alert("제대로 입력해주세요.");
			return null;
		}else{
			frm.submit();
		}
	}
</script>
</html>