//2글자 이상 검색해야 검색 가능. (summernote가 img의 파일경로와 이름까지 board_content에 저장해서 한글자만 검색하면 필터링이 잘 안될까봐 방지하기위해..) 
function before_submit(frm){
	var search_community=$('#search_community').val();
	
	if(search_community.trim().length == 1){
		alert("2글자 이상 입력해주세요.");
		return false;
	}
	frm.submit();
}
