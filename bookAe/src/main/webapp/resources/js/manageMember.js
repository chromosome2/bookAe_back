$(document).ready(function() {
	
	//joindate 선택시 input 바뀌게
	$('#searchHeadBox').change(function() {
		var val=$('#searchHeadBox option:selected').val();
		if(val=='joindate'){
			$('#search_member_keyword').attr('type','date');
		}
	});
}); 