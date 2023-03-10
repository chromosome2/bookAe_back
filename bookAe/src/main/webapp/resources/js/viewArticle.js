//댓글 내용을 작성하지 않았을 시 경고
function before_submit(frm){
	var content= $('[name="comment_content"]').val();
	
	if(content.trim() == ''){
		alert("내용을 입력해주세요.");
		return false;
	}
	frm.submit();
}