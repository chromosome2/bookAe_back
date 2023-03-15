

//댓글수정 내용을 작성하지 않았을 시 경고
function before_submit_modComment(frm, writer, id){
	var content= $('[name="comment_content"]').val();
	
	//제대로 된 접근인지 확인
	if(id == writer){
		if(content.trim() == ''){
 				alert("내용을 입력해주세요.");
 				return false;
 			}
 			frm.submit();
	}else{
		alert("잘못된 접근입니다.")
	}
}