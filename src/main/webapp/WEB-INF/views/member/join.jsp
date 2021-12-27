<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<script type="text/javascript" src="/resources/js/member.js"></script>


<div style="width:1200px;margin:auto">

<div class="joinstep">
	<ul style="border:none;">
		<li class="on">
			<div class="step">
				<div class="icon"><span class="iconfont ftic-write"></span></div>
				<div class="text">
					<span>STEP 01</span> <br>
					<strong>회원정보입력</strong>
				</div>
			</div>
			<div class="next"><span class="iconfont ftic-next"></span></div>
		</li>
		<li>
			<div class="step">
				<div class="icon"><span class="iconfont ftic-id"></span></div>
				<div class="text">
					<span>STEP 02</span> <br>
					<strong>가입완료</strong>
				</div>
			</div>
		</li>
	</ul>
</div>

<div class="member_wrap" style="margin-bottom:150px">

	<h1 class="title"><i class="iconfont ftic-join"></i> 회원가입</h1>

	<p class="warnt">* 필수입력</p>



	<form name="Frm" method="post" autocomplete="off">
	
	<input type="hidden" id="ID" name="ID">
	<input type="hidden" id="PW_QUESTION_SQ" name="PW_QUESTION_SQ">
	<input type="hidden" id="BIRTH" name="BIRTH">

	<ul class="join_list">

	<li>
		<input id="chkID" name="chkID" class="text" maxlength="25" type="text" placeholder="아이디 입력 *" onkeyup="chkEng_N_Num(event)" onblur="idChk();">
		<div id="span_chkID"></div>
	</li>

	<li>
		<input name="PW" id="PW" class="text" type="password" maxlength="20" placeholder="비밀번호 입력 *" onblur="pwChk(this)" onkeyup="sameChk()">
		<p class="notif" id="pwResult">영문/숫자/특수문자의 조합으로 8~20자 내외로 정해주세요</p>
	</li>

	<li class="mgt20">
		<input name="REPW" id="REPW" class="text" type="password" maxlength="20" placeholder="비밀번호 재입력 *" onkeyup="rePwChk(this)">
		<div id="rePwResult"></div>
	</li>

	<li style="display:flex;justify-content:space-between">
		<!-- 셀렉트 -->
		<div class="select_option" style="width:250px">
			<!-- 체크된 내용 -->
			<div class="active_cont">
				<span class="txt">비밀번호 찾기 질문 선택 *</span>
			</div>
			<!-- 체크된 내용 끝 -->
			<!-- 셀렉트 리스트 -->
			<ul class="option_list" id="pwq">
				<c:forEach items="${pwq}" var="list">
					<li data-value="${list.PW_QUESTION_SQ}">${list.QUESTION}</li>
				</c:forEach>
			</ul>
			<!-- 셀렉트 리스트 끝 -->
		</div>
		<input name="PW_FIND_A" id="PW_FIND_A" class="text" type="text" maxlength="10" placeholder="비밀번호 찾기  답 *" style="width:calc(100% - 260px)" value="">
	</li>
	
	<li class="mgt20">
		<!-- 셀렉트 -->
		<div class="select_option" style="width:222px;">
			<!-- 체크된 내용 -->
			<div class="active_cont">
				<span class="txt">생년월일 *</span>
			</div>
			<!-- 체크된 내용 끝 -->
			<!-- 셀렉트 리스트 -->
			<ul class="option_list" id="yearSel">
				<c:forEach var="i" begin="1" end="100">
					<li data-value="${nowYear - i}">
						<span class="txt">${nowYear - i}년</span>
					</li>
				</c:forEach>
			</ul>
			<!-- 셀렉트 리스트 끝 -->
		</div>
		<!-- 셀렉트 끝 -->

		<!-- 셀렉트 -->
		<div class="select_option" style="width:174px;">
			<!-- 체크된 내용 -->
			<div class="active_cont">
				<span class="txt">월</span>
			</div>
			<!-- 체크된 내용 끝 -->
			<!-- 셀렉트 리스트 -->
			<ul class="option_list" id="monthSel">
				<c:forEach var="i" begin="1" end="12">
					<li data-value="${i}">
						<span class="" txt"">${i}월</span>
					</li>
				</c:forEach>
			</ul>
			<!-- 셀렉트 리스트 끝 -->
		</div>
		<!-- 셀렉트 끝 -->

		<!-- 셀렉트 -->
		<div class="select_option" style="width:174px;">
			<!-- 체크된 내용 -->
			<div class="active_cont">
				<span class="txt">일</span>
			</div>
			<!-- 체크된 내용 끝 -->
			<!-- 셀렉트 리스트 -->
			<ul class="option_list" id="daySel">
				<c:forEach var="i" begin="1" end="31">
					<li data-value="${i}">
						<span class="" txt"">${i}일</span>
					</li>
				</c:forEach>
			</ul>
			<!-- 셀렉트 리스트 끝 -->
		</div>
		<!-- 셀렉트 끝 -->
	</li>
	
	<li class="radio mgt20">
		<p>성별을 선택해 주세요 *</p>
		<label><input type="radio" name="GNDR" value="M"><span class="cr"><span class="cr-icon"><span class="star-five"></span></span></span>남자</label>
		<label><input type="radio" name="GNDR" value="F"><span class="cr"><span class="cr-icon"><span class="star-five"></span></span></span>여자</label>
	</li>
	
	<li class="radio actType mgt20">
		<p>활동대사 유형을 선택해 주세요 *</p>
		<label><input type="radio" name="AMR" value="1.2"><span class="cr"><span class="cr-icon"><span class="star-five"></span></span></span>
			비활동적 - 사무직을 갖고있고 운동이나 집안일을 거의 하지 않는다.
		</label>
		<label><input type="radio" name="AMR" value="1.375"><span class="cr"><span class="cr-icon"><span class="star-five"></span></span></span>
			저활동적 - 집안일을 하고 긴 산책을 하거나 일주일에 1~3일 이상 운동을 한다.
		</label>
		<label><input type="radio" name="AMR" value="1.55"><span class="cr"><span class="cr-icon"><span class="star-five"></span></span></span>
			활동적 - 낮에 많이 움직이고 일주일에 3~5일 이상 운동(적당한 노력)한다.
		</label>
		<label><input type="radio" name="AMR" value="1.725"><span class="cr"><span class="cr-icon"><span class="star-five"></span></span></span>
			매우 활동적 - 일주일에 5~6일 스포츠를 하거나 격렬한 운동을 한다.
		</label>
		<label><input type="radio" name="AMR" value="1.9"><span class="cr"><span class="cr-icon"><span class="star-five"></span></span></span>
			극한 활동적 - 신체 활동을 주업으로 거의 매일 격렬한 운동을 한다.
		</label>
	</li>
	
	</ul>
	
	</form>
	
	
	<div class="flex-b mgt30">
		<a href="javascript:submitChk()" class="btn02">회원가입</a>
		<a href="javascript:history.back()" class="btn02" style="background:#92979b">취소</a>
	</div>


</div>


</div>

<script>

$(document).ready(function(){
	
	resetSelectEvent();
	
	/* 기본정보 */
	$('input[name="chkID"]').keyup(idChk) //키업시에도 체크
	$("#pwq li").click(function(){
		$("#PW_QUESTION_SQ").val($(this).data("value"));
	});
	var birthY = "";
	var birthM = "";
	var birthD = "";
	$("#yearSel li").click(function(){
		birthY = $(this).data("value");
		birthTest();
	});
	$("#monthSel li").click(function(){
		birthM = $(this).data("value");
		birthTest();
	});
	$("#daySel li").click(function(){
		birthD = $(this).data("value");
		birthTest();
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

	if (chkEmpty(f.chkID)) {
		alert("아이디를 입력해 주세요.");
		f.chkID.focus();
		return;
	}
	if (f.chkID.value.length < 4){
		alert("아이디는 영문 혹은 숫자 4자~20자리로 해주세요.");
		f.chkID.focus();
		return;
	}
	if (f.ID.value != f.chkID.value){
		alert("아이디가 이미 사용중입니다. 다시 입력해주세요.");
		f.chkID.focus();
		return;
	}
	if (chkEmpty(f.PW)) {
		alert("비밀번호를 입력해 주세요.");
		f.PW.focus();
		return;
	}
	if(!pwChk(f.PW)){
		alert("비밀번호는 영문자/숫자/특수문자의 조합으로 8~20자 내외로 정해주세요");
		f.PW.focus();
		return;
	}
	if (f.ID.value === f.PW.value){
		alert("비밀번호는 아이디와 동일하게 할 수 없습니다.");
		f.PW.focus();
		return;
	}
	if (chkEmpty(f.REPW)) {
		alert("비밀번호 확인을 입력해 주세요.");
		f.REPW.focus();
		return;
	}
	if (f.PW.value !== f.REPW.value) {
		alert("비밀번호가 일치하지 않습니다.");
		f.REPW.focus();
		return;
	}
	if (chkEmpty(f.PW_QUESTION_SQ)){
		alert("비밀번호 찾기 질문을 선택해 주세요.");
		return;
	}
	if (chkEmpty(f.PW_FIND_A)){
		alert("비밀번호 찾기 답을 입력해 주세요.");
		f.PW_FIND_A.focus();
		return;
	}
	if (chkEmpty(f.BIRTH)){
		alert("생년월일을 선택해 주세요.");
		return;
	}
	if (chkEmpty(f.GNDR)){
		alert("성별을 선택해 주세요.");
		return;
	}
	if (chkEmpty(f.AMR)){
		alert("활동대사 유형을 선택해 주세요.");
		return;
	}
	
	f.setAttribute("target","/member/join")
	f.submit();

}





	
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>




