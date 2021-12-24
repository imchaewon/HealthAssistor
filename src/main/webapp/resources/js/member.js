

function idChkOk(iii){
	var f = document.Frm;
	f.chkID.value = f.chkID.value;
	f.ID.value = f.chkID.value;
}

//아이디체크
function idChk() {
	var f = document.Frm;
	var chkID = f.chkID.value;
	
	//길이가 안될경우 중복검사 X
	if (chkID.length < 4){
		$("#span_chkID").html("");
		return false;
	}
	
	var tmpID=chkID;
	if (tmpID == "") {
		f.id.value = "";
		$('#span_chkID').html('');
		return;
	}

	var sw = 0;
	$.ajax({
		type:'post',
		async:false,
		url:'/member/getByID',
		data:chkID.trim(),
		success:function(result){
			if (result){
				$('#span_chkID').css({ "color":"red" }).html('사용 불가능한 아이디 입니다.');
				f.ID.value = "";
			}else{
				$('#span_chkID').css({ "color":"blue" }).html('사용 가능한 ID 입니다.');
				idChkOk(tmpID);
				sw = 1;
			}
		}
	});
	return sw;
	
}

//비밀번호체크 (숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력)
function pwChk($this) {
	var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

	var txt = $("#pwResult").text();
	if(!regExpPw.test($this.value)){ // 검사규칙에 안맞을떄
		$("#pwResult").html("<span style='color:red'>*" + txt.replace("*","") + "</span>")
		return 0;
	}else{ //통과
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
	
	sameChk();
	
}

function sameChk(){
	// 비밀번호가 일치하는지 검사
	if($("#REPW").val() != ""){
		if($("#PW").val() === $("#REPW").val()){
			$("#rePwResult").html("<span style='color:blue'>*일치하는 비밀번호입니다.</span>")
		}else{
			$("#rePwResult").html("<span style='color:red'>*비밀번호와 일치하지 않습니다.</span>")
		}
	}
}










