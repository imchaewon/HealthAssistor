<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<script src="/resources/js/member.js"></script>


<style type="text/css">
	.conWrap ul{width:400px;margin:auto;}
	.conWrap li{list-style:none;}
	.conWrap input.text{width:100%;height: 55px;padding: 0 20px;margin-left: 5px;color: #92979b;font-weight: bold;line-height: 50px;margin:0;}
	.conWrap .notif{padding:5px 5px 15px;margin:0;}
	.conWrap .btnWrap{width:400px;text-align:right;margin:auto}
</style>


<form name="Frm">


<div class="sub_content">

<%@ include file="/WEB-INF/views/includes/my_left.jsp" %>

	<div class="conWrap">
		
		<p class="titleS2">비밀번호 변경하기</p>
		<ul>
			<li>
				<input name="PW" id="PW" class="text" type="password" maxlength="20" placeholder="비밀번호 입력 *" onblur="pwChk(this)" onkeyup="sameChk()">
				<p class="notif" id="pwResult">영문/숫자/특수문자의 조합으로 8~20자 내외로 정해주세요</p>
			</li>
		
			<li>
				<input name="REPW" id="REPW" class="text" type="password" maxlength="20" placeholder="비밀번호 재입력 *" onkeyup="rePwChk(this)">
				<div id="rePwResult"></div>
			</li>
		</ul>
		
		<div class="mgt20 btnWrap">
			<a href="javascript:submitChk()" class="btn03" style="margin-right:10px;" onkeyup="if(event.keyCode == 32) submitChk()">확인</a>
			<a href="javascript:history.go(-1)" class="btn03 bg_gray">취소</a>
		</div>
		
		
	</div>

</div>

</form>


<script type="text/javascript">

function submitChk(){
	var f = document.Frm;
	
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
	
	$.ajax({
		type:"POST",
		url:"/member/change_pw_ok",
		data:$(f).serialize() + "&ID=${loginInfo.ID}",
		async:false,
		success:function(result){
			// console.log(result);
			if(result){
				alert("비밀번호가 변경되었습니다.");
				location.href = "";
			}
		},
		error:function(a,b,c){
			console.log(a,b,c);
		}
	});
}

</script>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>




