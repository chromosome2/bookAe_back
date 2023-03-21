<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
    <link rel="stylesheet" href="${contextPath }/resources/css/join.css">
    <script src="${contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <script src="${contextPath }/resources/js/join.js"></script>
    <script src="${contextPath }/resources/js/common.js"></script>
	<title>북愛 - 가입 페이지</title>
</head>
<body>
    <!--건너뛰기 링크 시작-->
    <a id="skipNav" href="mainContents">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--#wrapper 시작-->
    <div id="wrapper">
    
    	<jsp:include page="../common/header.jsp"/>
    
    <!--메인컨텐츠 시작-->
        <section class="memberJoin">
            <h2>회원가입</h2>
            <form action="${contextPath }/join/joinMember.do" method="post" id="joinForm" name="joinForm">
                <fieldset>
                    <legend>회원가입 정보 입력 폼</legend>
                    <p>
                        <input type="text" id="name" name="name" required placeholder="이름">
                    </p>
                    <p>
                        <input type="text" id="id" name="id" required placeholder="아이디" onchange="idCheck()">
                        <span class="logInfo idInfo"></span>
                        <input type="hidden" id="IdCheckBeforeJoin" value="false">
                    </p>
                    <p>
                        <input type="password" id="pw" name="pw" required placeholder="비밀번호">
                        <span class="logInfo"></span>
                    </p>
                    <p>
                        <input type="password" id="passwordCheck" name="passwordCheck" required placeholder="비밀번호 확인" onkeyup="passCheck()">
                        <span class="logInfo passCInfo"></span>
                        <input type="hidden" id="pwCheckBeforeJoin" value="false">
                    </p>
                    <p>
                        <input type="text" id="nickname" name="nickname" maxlength=7 required placeholder="닉네임" onchange="nicknameCheck()">
                        <span class="logInfo nickInfo"></span>
                        <input type="hidden" id="nickCheckBeforeJoin" value="false">
                    </p>
                    <p>
                        <input type="tel" id="tel" name="tel" maxlength="11" placeholder="전화번호" required onkeyup="telCheck()">
                        <span class="logInfo telInfo"></span>
                        <input type="hidden" id="telCheckBeforeJoin" value="false">
                    </p>
                    <p class="emailArea">
                        <input type="text" id="email" name="email" required placeholder="이메일">
                        <a>@</a>
                        <input type="text" id="email_add" name="email_add" required readonly value="naver.com">
                        <select id="email_after" name="email_after">
                            <option value="naver">naver.com</option>
                            <option value="daum">daum.net</option>
                            <option value="google">gmail.com</option>
                            <option value="nate">nate.com</option>
                            <option value="1">직접 입력</option>
                        </select>
                    </p>
                    <p class="news">
                        <span>북애의 소식을 받으시겠습니까?</span>
                        <label class="telNews"><input type="checkbox" name="newsCheck" value="tel"><i class="circle"></i>핸드폰</label>
                        <label><input type="checkbox" name="newsCheck" value="mail"><i class="circle"></i>이메일</label>
                    </p>
                    <div class="btnJoinArea">
                        <input type="button" class="btnJoin" onclick="beforeSubmit(this.form)" value="가입하기">
                    </div>
                </fieldset>
            </form>
        </section>
        <!--메인컨텐츠 종료-->
        
        <jsp:include page="../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->

</body>
<script type="text/javascript">
	//닉네임중복 체크
	function nicknameCheck(){
		var nickname=document.getElementById('nickname').value;
		
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
		
	}
	

	//아이디 확인
	function idCheck(){
		var id=document.getElementById('id').value;
		
		var data={"id" : id};
		$.ajax({
			type:'POST',
			dataType:"json",
			data: data,
			url:'${contextPath}/join/idCheck.do',
			success:function(data){
				if(data['result']=='true'){
					$('.idInfo').text('* 이미 사용중인 아이디입니다.');
					$('#IdCheckBeforeJoin').attr('value','false');
					$('.idInfo').css('color','rgb(226, 42, 42)');
				}else if(data['result']=='false'){
					$('.idInfo').text('* 사용 가능한 아이디입니다.');
					$('#IdCheckBeforeJoin').attr('value','true');
					$('.idInfo').css('color','rgb(42, 148, 42)');
				}else if(data['result']=='yesMark'){
					$('.idInfo').text('* 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
					$('#IdCheckBeforeJoin').attr('value','false');
					$('.idInfo').css('color','rgb(226, 42, 42)');
				}
			},
			error : function(data){
				alert('실패했습니다. 1:1 문의를 이용해 주세요.');
				$('#IdCheckBeforeJoin').attr('value','false');
			}
		})
	}
	
	//경고문을 제대로 지키지 않았을 시 alert
	function beforeSubmit(frm){
		var IdCheckBeforeJoin=$('#IdCheckBeforeJoin').val();
		var pwCheckBeforeJoin=$('#pwCheckBeforeJoin').val();
		var nickCheckBeforeJoin=$('#nickCheckBeforeJoin').val();
		var telCheckBeforeJoin=$('#telCheckBeforeJoin').val();
		
		if(IdCheckBeforeJoin != 'true' || pwCheckBeforeJoin!='true' || nickCheckBeforeJoin!='true' || telCheckBeforeJoin!='true'){
			alert("제대로 입력해주세요.");
			return null;
		}else{
			frm.submit();
		}
	}
</script>
</html>