<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/popup_header.jsp"%>

<script src="/resources/js/member.js"></script>

<style>
	body{min-height:auto;}
	.noInfo{justify-content:center;align-items:center;position:absolute;left:0;right:0;top:calc(50% - 50px);}
	.title{font-size: 22px;text-align: center;margin: 35px 0 25px;}
	.noInfo .title{margin-top:0;}
	ul{padding:0 40px;}
	li{list-style:none;}
	input.text{width:100%;height: 55px;padding: 0 20px;margin-left: 5px;color: #92979b;font-weight: bold;line-height: 50px;margin:0;}
	.notif{padding:5px 5px 15px;margin:0;}
	
</style>

<form name="Frm" autocomplete="off">
<input type="hidden" name="ID" id="" value="${ID}">

<c:if test="${ID != null}">
<div>
	<p class="title">비밀번호 변경하기</p>
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
	
	<div class="al-c mgt20">
		<a href="javascript:submitChk()" class="btn03" style="margin-right:10px;" onkeyup="if(event.keyCode == 32) submitChk()">확인</a>
		<a href="javascript:window.close()" class="btn03 bg_gray">취소</a>
	</div>
</div>
</c:if>
<c:if test="${ID == null}">
<div class="noInfo">
	<p class="title">일치하는 정보가 없습니다.</p>
	<div class="al-c mgt-20">
		<a href="javascript:window.close()" class="btn03 bg_gray">닫기</a>
	</div>
</div>
</c:if>

</form>

<script>

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
	
	f.setAttribute("method","post")
	f.setAttribute("action","/member/change_pw_ok")
	//f.submit();
	
	$.ajax({
		type:"POST",
		url:"/member/change_pw_ok",
		data:$(f).serialize(),
		async:true,
		success:function(result){
			//console.log(result);
			if(result){
				var c = confirm("비밀번호가 변경되었습니다. 로그인하시겠습니까?");
				if(c){
					opener.parent.location.replace("/member/login");
				}else{
					opener.parent.location.replace("/");
				}
				self.close();
				//window.close();
			}
		},
		error:function(a,b,c){
			console.log(a,b,c);
		}
	});

}
	
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>




