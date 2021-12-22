function idCheckOk(id) {
	var f = document.Frm;
	f.chkID.value = f.chkID.value;
	f.id.value = f.chkID.value;
}

//아이디중복체크
function idDuplChk() {
	var f = document.Frm;
	var chkID = f.chkID.value;
	var formData = "ID="+chkID.trim();

	$.ajax({
		type:'post',
		async: false ,
		url:'/member/list',
		data:formData,
		success:function(asd){
			console.log(asd)
			if (asd === 1){
				idCheckOk(tmpID);
				$('#span_chkID').css({ "color":"blue" }).html('사용 가능한 ID 입니다.');
			}else{
				f.id.value = "";
				$('#span_chkID').css({ "color":"red" }).html('사용 불가능한 아이디 입니다.');
			}
		}
	});
	
}

//비밀번호체크 (숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력)
function pwChk($this) {
	var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

	var txt = $("#pwResult").text();
	// 규칙에 안맞을때 규칙글자색 빨간색으로 변경
	if(!regExpPw.test($this.value)){
		$("#pwResult").html("<span style='color:red'>*" + txt.replace("*","") + "</span>")
		return 0;
	}else{
		$("#pwResult").html(txt.replace("*",""));
		return 1;
	}

}

function rePwChk($this){

	// 비밀번호를 입력 안하고왔을경우 돌아가기
	if($("#PW").val() === ""){
		$("#rePwResult").html("<span style='color:red'>*비밀번호를 입력해 주세요.</span>")
		$("#PW").focus();
		return;
	}
	
	// 비밀번호유효성 재검사
	var result = pwChk($("#PW")[0]);
	if(!result){
		$("#PW").focus();
		return;
	}
	
	// 비밀번호가 일치하는지 검사
	if($("#ID").val() === $this.value){
		$("#rePwResult").html("<span style='color:blue'>*일치하는 비밀번호입니다.</span>")
	}else{
		$("#rePwResult").html("<span style='color:red'>*비밀번호와 일치하지 않습니다.</span>")
	}
	
}











