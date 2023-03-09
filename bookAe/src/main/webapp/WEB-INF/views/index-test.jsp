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
    <link rel="shortcut icon" href="resources/images/그림2.ico">
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/normalize.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    <script src="resources/js/index.js"></script>
    <script src="resources/js/common.js"></script>
	<title>북愛 - 메인 페이지</title>
	<style type="text/css">
		#like_btn{
			width: 120px;
		    height: 65px;
		    font-size: 0.9em;
		    border-radius: 5%;
		    background-color: #fff;
		}
		.unlike{
		    border: 3px solid #ccc;
		}
		.unlike:hover{
			border: 3px solid #ffb7b7;
		}
		.like{
			border: 3px solid #ffb7b7;
		}
		#heart{
			display: inline-block;
		    width: 23px;
		    text-indent: 23px;
		    overflow: hidden;
		    white-space: nowrap;
		}
		.unlike #heart::before{
			position: relative;
		    left: -20px;
		    top: 3px;
		    content: "♡";
			color: rgb(245, 27, 27);
		}
		.unlike:hover #heart::before{
			content: "♥";
		}
		.like #heart::before{
			position: relative;
		    left: -20px;
		    top: 3px;
		    content: "♥";
			color: rgb(245, 27, 27);
		}
	</style>
	<script type="text/javascript">
	    function find() {
	    	var name=document.getElementById("name").value;
	    	if(!name){
	    		alert("전화번호를 입력하삼");
	    		return;
	    	}
	    	
	    	var data={"name":name};
	    	
	    	$.ajax({
	    		type:"post",
	    		dataType:"json",
	    		data: data,
	    		url: "${contextPath}/community/test.do",
	    		success:function(result){
	    			$("#place").html("");
	    			$("#place").append(
   						"<h2>고객님의 전화번호는 "+result['tel']+"입니다.</h2>"
   					);
	    		}
	    	})
	    }
	    
	    function like() {
	    	var id="tnwls356";
	    	var board_num=10;
	    	var board_like=2;
	    	
	    	var data={"id" : id, "board_num":board_num};
	    	
	    		$.ajax({
	    			type:"post",
	    			dataType:"json",
	    			data: data,
	    			url:'${contextPath}/community/addLike.do',
    				success:function(data){
    					alert('좋아요 성공!');
    					$("#like_btn").attr('class','like');
    					$("#board_like").text(board_like+1);
    				}
	    		})
	    	
	    }
	</script>
</head>
<body>
    <input type="text" id="name">
    <input type="button" value="찾기" onclick="find()">
    <div id="place"></div>
    
    <button id="like_btn" class="unlike" onclick="like()"><span id="heart">추천수</span><br><span id="board_like">2</span></button>
</body>
</html>