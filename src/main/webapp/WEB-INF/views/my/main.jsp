<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<style type="text/css">

.use_more,
.use_bmr,
.use_hnw{display:none;}
.use_more.on,
.use_bmr.on,
.use_hnw.on{display:table-row;}

</style>


<div class="sub_content">

<%@ include file="/WEB-INF/views/includes/my_left.jsp" %>



<div class="conWrap">
	<h1 class="titleS1">내 정보 추가/수정</h1>
	
	<form method="post" action="/my/main_edit_ok" name="Frm">
	
	<table class="tlS1 cbrdS1 mgt20">
		<tr>
			<th width="20%" align="center">아이디</th>
			<td width="30%">
				${loginInfo.ID}
			</td>
			<th width="20%" align="center">비밀번호</th>
			<td width="30%">
				<input type="password" name="PW" class="box" value="" style="width:80px;" maxlength="12" onkeyup="if(event.keyCode == 13) submitChk()">
			</td>
		</tr>
		<tr>
			<th align="center">생년월일</th>
			<td colspan="3">
				${loginInfo.BIRTH.substring(0,2)>30?19+=loginInfo.BIRTH.substring(0,2):20+=loginInfo.BIRTH.substring(0,2)}년&nbsp;&nbsp;
				${loginInfo.BIRTH.substring(2,4)}월&nbsp;&nbsp;
				${loginInfo.BIRTH.substring(4,6)}일
			</td>
		</tr>
		<tr>
			<th align="center">성별</th>
			<td colspan="3">
				<label><input name="GNDR" type="radio" value="M"><span></span>남자</label>
				<label><input name="GNDR" type="radio" value="F"><span></span>여자</label>
			</td>
		</tr>
		<tr>
			<th align="center">활동대사 유형</th>
			<td colspan="3">
				<label><input type="radio" name="AMR" value="1.2"><span></span>비활동적 - 사무직을 갖고있고 운동이나 집안일을 거의 하지 않는다.</label><br>
				<label><input type="radio" name="AMR" value="1.375"><span></span>저활동적 - 집안일을 하고 긴 산책을 하거나 일주일에 1~3일 이상 운동을 한다.</label><br>
				<label><input type="radio" name="AMR" value="1.55"><span></span>활동적 - 낮에 많이 움직이고 일주일에 3~5일 이상 운동(적당한 노력)한다.</label><br>
				<label><input type="radio" name="AMR" value="1.725"><span></span>매우 활동적 - 일주일에 5~6일 스포츠를 하거나 격렬한 운동을 한다.</label><br>
				<label><input type="radio" name="AMR" value="1.9"><span></span>극한 활동적 - 신체 활동을 주업으로 거의 매일 격렬한 운동을 한다.</label>
			</td>
		</tr>
		<tr>
			<th align="center">칼로리/영양 계산기 이용 여부</th>
			<td colspan="3">
				<label class="switch">
					<input type="checkbox" id="useMore">
					<div class="slider round"></div>
				</label>
			</td>
		</tr>
		<tr class="use_more">
			<th align="center">계산 방법</th>
			<td colspan="3">
				<label><input type="radio" name="WAY" value="BMR"><span></span>기초대사량</label>
				<label><input type="radio" name="WAY" value="HNW"><span></span>키/몸무게</label>
			</td>
		</tr>

		<tr class="use_bmr">
			<th align="center">※ 기초대사량</th>
			<td colspan="5">
				<input type="text" name="BMR" id="BMR" class="box" value="${myInfo.BMR}" size="5" maxlength="4" onkeyup="chkNumber(event)">kcal
			</td>
		</tr>
		
		<tr class="use_hnw">
			<th align="center">※ 신장</th>
			<td colspan="3">
				<input type="text" name="HGHT" id="HGHT" class="box" value="${myInfo.HGHT}" size="4" maxlength="6" onkeyup="chkNumberDot(event)">cm
			</td>
		</tr>
		<tr class="use_hnw">
			<th align="center">※ 체중</th>
			<td colspan="3">
				<input type="text" name="WGHT" id="WGHT" class="box" value="${myInfo.WGHT}" size="4" maxlength="6" onkeyup="chkNumberDot(event)">kg
			</td>
		</tr>

	</table>
	<p class="tipBox">
		- 기초대사량을 등록하시면 맞춤 칼로리/영양소를 조회하실 수 있습니다.<br>
		- 기초대사량을 모르실 경우는 키와 몸무게를 입력해주세요. (Harris Benedict Formula 계산법을 이용해 기초대사량을 구합니다.)
	</p>
	
	<div class="mgt20 btnWrap">
		<a href="javascript:submitChk()" class="btn03" style="margin-right:10px;" onkeyup="if(event.keyCode == 32) submitChk()">확인</a>
		<a href="javascript:history.go(-1)" class="btn03 bg_gray">취소</a>
	</div>
	
	</form>
	
</div>

</div>



<script type="text/javascript">
	
$(document).ready(function(){
	/* 초기화 */
	if("${myInfo.WAY}" != ""){
		$("#useMore").prop("checked",true);
		$(".use_more").addClass("on");
		
		if("${myInfo.WAY}" == "BMR"){
			$("input[value='BMR']").prop("checked",true);;
			$(".use_bmr").addClass("on");
		}else if("${myInfo.WAY}" == "HNW"){
			$("input[value='HNW']").prop("checked",true);;
			$(".use_hnw").addClass("on");
		}
	}

	/* 변경시 */
	$("#useMore").change(function(){
		if($(this).prop("checked")){
			$(".use_more").addClass("on");
			if ($("input[name='WAY']:checked").val() == "BMR") {
				$(".use_bmr").addClass("on");
			}else if($("input[name='WAY']:checked").val() == "HNW"){
				$(".use_hnw").addClass("on");				
			}
		}else{
			$(".use_more").removeClass("on");
			$(".use_bmr").removeClass("on");
			$(".use_hnw").removeClass("on");			
		}
	});
	
	$("input[name='WAY']").change(function(){
		if($(this).val() == "BMR"){
			$(".use_bmr").addClass("on");
			$(".use_hnw").removeClass("on");
		}else if($(this).val() == "HNW"){
			$(".use_hnw").addClass("on");			
			$(".use_bmr").removeClass("on");
		}
	});
	
	$("input[name=GNDR]").each(function(){
		if($(this).val() == "${myInfo.GNDR}"){
			$(this).prop("checked",true)
		}
	});
	
	$("input[name=AMR]").each(function(){
		if($(this).val() == "${myInfo.AMR}"){
			$(this).prop("checked",true)
		}
	});
	
	
	function birthTest(){
		var birth = (birthY+"").substring(2,4) + (birthM+"").padStart(2,"0") + (birthD+"").padStart(2,"0");
		if(birth.length === 6 && birthM != "" && birthD != ""){
			$("#BIRTH").val(birth);
		}
	}
	

});

function submitChk(){
	var f = document.Frm;
	var regex1 = /^([0-9]{1,3})(\.[0-9]{1,2})?$/;
	var alertTxt = "올바른 값을 입력해주세요.";
	var pass = 0;
	
	if($("#useMore").prop("checked")){ // 칼로리/영양 계산기 이용을 체크했을때
		if($("input[name='WAY']:checked").val() == "BMR"){
			if($("#BMR").val() == ""){
				alert("기초대사량을 입력해주세요.")
				return;
			}
		}else if($("input[name='WAY']:checked").val() == "HNW"){
			if($("#HGHT").val() == "" && $("#WGHT").val() == ""){
				alert("신장과 체중을 입력해주세요.")
				return;
			}else if($("#HGHT").val() == ""){
				alert("신장을 입력해주세요.")
				return;
			}else if($("#WGHT").val() == ""){
				alert("체중을 입력해주세요.")
				return;
			}
		}else{
			alert("기초대사량과 몸무게 중 계산될 값을 선택해주세요.");
			return;
		}
	}
	
	if(chkEmpty(f.PW)){
		alert("비밀번호를 입력해주세요");
		f.PW.focus();
		return;
	}

	if(!regex1.test(f.HGHT.value)){
		alert(alertTxt);
		$("input[name=HGHT]").focus();
		return;
	}
	if(!regex1.test(f.WGHT.value)){
		alert(alertTxt);
		$("input[name=WGHT]").focus();
		return;
	}
	
	$.ajax({ // 비밀번호 체크
		type:"POST",
		url:"/my/main",
		data:$(f).serialize(),
		async:false,
		success:function(result){
			//console.log(result);
			if(!result){
				alert("비밀번호를 확인해주세요");
				f.PW.focus();
				return;
			}
			pass = 1;
		},
		error:function(a,b,c){
			console.log(a,b,c);
		}
	});
	
	if(!pass){
		return;
	}
	
	$.ajax({ // 정보 수정
		type:"POST",
		url:"/my/main_ok",
		data:$(f).serialize(),
		async:false,
		success:function(data){
			alert(data);
			location.href = "";
		},
		error:function(a,b,c){
			console.log(a,b,c);
		}
	});
	

}




		
	
</script>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>





