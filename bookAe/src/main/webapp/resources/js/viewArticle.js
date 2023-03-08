$(function () {
	//좋아요 버튼 클릭시 ui변경
	/*$('#like_btn').click(function() {
		like_sw=!like_sw;
		if(like_sw){
			$(this).attr('class','like');
		}else{
			$(this).attr('class','unlike');
		}
	});*/
});

//댓글 내용을 작성하지 않았을 시 경고
function before_submit(frm){
	var content= $('[name="comment_content"]').val();
	
	if(content.trim() == ''){
		alert("내용을 입력해주세요.");
		return false;
	}
	frm.submit();
}

//좋아요 버튼
/*function fn_like_btn() {
	var obj=new Object();
	obj.board_like=$("#board_like").val();
	
	$.ajax({
		url: "community/setBoardLike",
		type: "POST",
		dataType: "json",
		processData: true,
		contentType: "application/json; charset=UTF-8",
		data: JSON.stringify(obj)
	})
}*/