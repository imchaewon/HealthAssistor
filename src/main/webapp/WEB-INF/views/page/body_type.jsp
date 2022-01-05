<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>

</style>

<form name="Frm">


	<div class="body_type">
		<h1 class="tit">내 체형 알아보기</h1>
		<p class="stit">※ 인바디 정보로 계산된 평균체중과 내 체형에 맞는 식단/운동법을 확인하실수 있습니다.</p>
		
		<div class="gender cbrdS1">
			<label><input type="radio" name="GNDR" value="M" onclick="return(false)"><span></span>남자</label>
			<label><input type="radio" name="GNDR" value="F" onclick="return(false)"><span></span>여자</label>
		</div>
		
		<div class="info">
			<dl>
				<dt>신장</dt>
				<dd><input type="text" name="HGHT" maxlength="5" value="${loginInfo.HGHT}"> cm</dd>
			</dl>
			<dl>
				<dt>체중</dt>
				<dd><input type="text" name="WGHT" maxlength="5" value="${loginInfo.WGHT}"> kg</dd>
			</dl>
			<dl>
				<dt>체지방률</dt>
				<dd><input type="text" name="BF" maxlength="5"> %</dd>
			</dl>
			<dl>
				<dt>골격근량</dt>
				<dd><input type="text" name="SMM" maxlength="5"> kg</dd>
			</dl>
		</div>
		
		<p>* 단위는 소수 두자리까지 입력 가능합니다</p>
		
		<a href="javascript:complete()" class="btn03">체형 확인하기</a>
		
		<div class="ani">
			<p>.</p>
			<p>.</p>
			<p>.</p>			
		</div>
		
		<div id="result">
		</div>
		
		
	</div>



</form>

<script>

$(document).ready(function(){
	
	$("input[name='GNDR']").each(function(){
		if($(this).val() == "${loginInfo.GNDR}"){
			$(this).prop("checked",true)
		}
	});
	
});

$("input[type=text]").on("keyup",function(e){
	chkNumberDot(e);
});

function complete(){
	var f = document.Frm;
	
	if(chkEmpty(f.HGHT)){
		alert("신장을 입력해주세요")
		f.HGHT.focus();
		return;
	}
	if(chkEmpty(f.WGHT)){
		alert("체중을 입력해주세요")
		f.WGHT.focus();
		return;
	}
	if(chkEmpty(f.BF)){
		alert("체지방률을 입력해주세요")
		f.BF.focus();
		return;
	}
	if(chkEmpty(f.SMM)){
		alert("골격근량을 입력해주세요")
		f.SMM.focus();
		return;
	}
	
	var regex1 = /^([0-9]{1,3})(\.[0-9]{1,2})?$/;
	var regex2 = /^[0-9]{1,2}(\.[0-9]{1,2})?$/;
	
	var txt = "올바른 값을 입력해주세요.";

	if(!regex1.test(f.HGHT.value)){
		alert(txt);
		$("input[name=HGHT]").focus();
		return;
	}
	if(!regex1.test(f.WGHT.value)){
		alert(txt);
		$("input[name=WGHT]").focus();
		return;
	}
	if(!regex2.test(f.BF.value)){
		alert(txt);
		$("input[name=BF]").focus();
		return;
	}
	if(!regex2.test(f.SMM.value)){
		alert(txt);
		$("input[name=SMM]").focus();
		return;
	}
	
	var data = {
			GNDR: f.GNDR.value,
			HGHT: f.HGHT.value,
			WGHT: f.WGHT.value,
			BF: f.BF.value,
			SMM: f.SMM.value
	}
	
	$.ajax({
		type:"POST",
		url:"/body_type",
		data:JSON.stringify(data),
		contentType: "application/json; charset-utf-8",
		async:false,
		success:function(data){
			//console.log(data);
			$(".ani").addClass("on");
			
			setTimeout(function(){
				$("#result").html(
					"<div class='tit'>" +
					"	<p class='type'>내 체형은 <b><img src='/resources/images/bg_wave.png' class='wave'>" + data.TIT + "<img src='/resources/images/ico_star.png' class='star'></b>입니다." +
					"	</p>" +
					"	<p class='val'>" +
					"		<span class='std'>표준체중:<b>" + Math.round(data.stdWGHT*100) / 100 + "</b>kg</span>" +
					"		<span class='bmi'>(BMI:" + data.R_BMI + ")</p>" +
					"	</p>" +
					"</div>" +
					"<div class='con'>" +
					"	<dl class='exr'>" +
					"		<dt>운동 <span>tip</span></dt>" +
					"		<dd>" + data.EXR_HOW + "</dd>" +
					"	</dl>" +
					"	<dl class='diet'>" +
					"		<dt>식단 <span>tip</span></dt>" +
					"		<dd>" + data.DIET_HOW + "</dd>" +
					"	</dl>" +
					"</div>"
				);
			},500);
		},
		error:function(a,b,c){
			console.log(a,b,c);
		}
	});

}
	
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>




