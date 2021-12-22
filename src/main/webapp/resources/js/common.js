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

//[숫자]이외 거르기(제이쿼리)
$("input:text[numberOnly]").on("keyup", function() {
	$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
});









