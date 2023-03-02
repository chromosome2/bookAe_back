$(document).ready(function() {
	//summernote API
  $('#summernote').summernote({
		  height: 700,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: ''	//placeholder 설정
          
	});
});
		
//장르, 제목, 내용 선택 안했을 시 alert로 경고
function before_submit(frm){
	var board_genre=$('#board_genre').val();
	var title= $('#board_title').val();
	var content= $('[name="board_content"]').val();
	
	if(board_genre.trim() == 'none'){
		alert("장르를 선택해주세요.");
		return false;
	}else if(title.trim() == ''){
		alert("제목을 입력해주세요.");
		return false;
	}else if(content.trim() == ''){
		alert("내용을 입력해주세요.");
		return false;
	}
	frm.submit();
}

//취소 버튼시 community로 돌아가기
function cancelWriteCommunity() {
	location.href="${contextPath}/community/community.do";
}

