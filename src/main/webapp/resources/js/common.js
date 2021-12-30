function chkNull(obj) {
	if (obj == "" || typeof(obj) == "undefined") {
		return true;
	}
	else {
		return false;
	}
}

/* 셀렉트박스 디자인 리셋 */
function resetSelectEvent(){
	$(".select_option").unbind("click");

	$(".select_option").click(function(){
		$(".select_option").not($(this)).removeClass("focus");
		$(this).toggleClass("focus");
		return false;
	});
	$(document).click(function(){
		$(".focus").removeClass("focus");
	});
	$(".select_option").each(function(a){
		$(".select_option").eq(a).find(".option_list li").click(function(){
			$(".select_option").eq(a).find(".active_cont").find(".txt").html($(this).html());
		});
	});
}

// [숫자, 영문] 이외 거르기
function chkEng_N_Num(e){
	var el = e.target;
	var regExpId = /^[a-zA-Z0-9]*$/;
	
	if(!regExpId.test(el.value)){
		var str = "";
		for (var item of el.value.split("")) {
			if(regExpId.test(item)){
				str += item;
			}
		}
		el.value = str;
	}
}

//[숫자]이외 거르기
function chkNumber(e){
	var el = e.target;
	var regExpId = /^[0-9]*$/;
	
	if(!regExpId.test(el.value)){
		var str = "";
		for (var item of el.value.split("")) {
			if(regExpId.test(item)){
				str += item;
			}
		}
		el.value = str;
	}
}

// 공백 확인
function chkEmpty(data){
	if(data.value == "" || data.value == null){
		return 1;
	}else{
		return 0;
	}
}

// 아이디 확인 ##################################################
/*function checkID(value, min, max) {
	var RegExp = /^[a-zA-Z0-9_]*$/i;
	var returnVal = RegExp.test(value) ? true : false;
	if (typeof(min) != "undefined" && value.length < min) returnVal = false;
	if (typeof(max) != "undefined" && value.length > max) returnVal = false;
	return returnVal;
}

// 비밀번호 확인 ##################################################
function checkPass(value, min, max) {
	var RegExp = /^[a-zA-Z0-9\`\~\!\@\#\$\%\^\&\*\_\+\=\|\\\[\]\{\}\:\(\)\;\,\<\.\>\/\?\'\"]*$/i;
	var returnVal = RegExp.test(value) ? true : false;
	if (typeof(min) != "undefined" && value.length < min) returnVal = false;
	if (typeof(max) != "undefined" && value.length > max) returnVal = false;
	return returnVal;
}*/











