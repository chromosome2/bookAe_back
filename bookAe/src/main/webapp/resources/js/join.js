$(function () {
    //logInfo 시작
    var cont=['5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.',
            '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
            '비밀번호가 일치하지 않습니다.',
            '이미 사용중인 닉네임입니다.',
            '특수기호(-)없이 숫자만 입력해주세요.'];
    //logInfo 종료

    //이메일주소 시작
    $('#email_after').change(function () {
        $('#email_after option:selected').each(function () {
            if($(this).val()=='1'){
                $('#email_add').attr('readonly',false);
                $('#email_add').val('');
            }else{
                $('#email_add').val($(this).text());
                $('#email_add').attr('readonly',true);
            }
        });
    });
    //이메일주소 종료
});

//비밀번호 맞는지 확인
function passCheck(){
    var pass=document.getElementById('pw').value;
    var passC=document.getElementById('passwordCheck').value;
    if(pass==passC){
        $('.passCInfo').text('* 일치합니다.');
        $('#pwCheckBeforeJoin').attr('value','true');
        $('.passCInfo').css('color','rgb(42, 148, 42)');
    }else{
        $('.passCInfo').text('* 비밀번호가 일치하지 않습니다.');
        $('#pwCheckBeforeJoin').attr('value','false');
        $('.passCInfo').css('color','rgb(226, 42, 42)');
    }
};

//전화번호에 하이픈(-)안들어가게
function telCheck() {
	var tel=document.getElementById('tel').value;
	
	if(tel.indexOf('-')!=-1){
		$('.telInfo').text('* 하이픈(-) 없이 입력해주세요.');
		$('#telCheckBeforeJoin').attr('value','false');
		$('.telInfo').css('color','rgb(226, 42, 42)');
	}else{
		$('.telInfo').text('');
		$('#telCheckBeforeJoin').attr('value','true');
	}
}
