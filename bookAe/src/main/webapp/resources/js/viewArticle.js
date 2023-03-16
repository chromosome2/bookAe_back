$(document).ready(function() {
	$('.replyBox').css('display','none');
	$('.mod_comment').css('display','none');
});

//댓글 수정 닫기
function modCommentClose(){
	$('.mod_comment').css('display','none');
}

function fn_modComment(comment_num){
	//모든 수정, 답글 textarea 닫기(하나만 띄우기 위해)
	$('.replyBox').css('display','none');
	$('.mod_comment').css('display','none');
	
	//답글창 하나 보이기
	var modBox = document.getElementById('mod_comment'+comment_num);
	$(modBox).css('display','block');
}

//댓글 답글기능
function fn_replyComment(board_num, parent_num, child_num) {
	//모든 수정, 답글 textarea 닫기(하나만 띄우기 위해)
	$('.replyBox').css('display','none');
	$('.mod_comment').css('display','none');
	
	//답글창 하나 보이기
	var replybox = document.getElementById('replyBox'+parent_num);
	$(replybox).css('display','block'); 
	
	//부모댓글에 답댓인지 자식댓글에 답댓인지 확인 후 input에 필요한 value넣어주기
	if(child_num == 0){//부모댓글 답댓
		$('.reply_comment_annot').attr('value',parent_num);
	}else{
		$('.reply_comment_annot').attr('value',child_num);
	}
	$('.reply_board_num').attr('value',board_num);
	
}

//답글 닫기
function replyClose(){
	$('.replyBox').css('display','none');
}

//답글 전송
function before_submit_replyComment(frm) {
	var content= $('#reply_textarea').val();
	
	if(content.trim() == ''){
		alert("내용을 입력해주세요.");
		return false;
	}
	
	frm.submit();
}