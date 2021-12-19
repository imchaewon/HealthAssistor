<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>

<form method="post" action="/member/login_ok" name="Frm">

<div class="member_wrap login">

	<h1 class="title">로그인</h1>


	<ul class="login_input">
		<li><input type="text" id="id" name="id" value="" placeholder="아이디"></li>
		<li><input type="password" id="pass" name="pass" placeholder="비밀번호"></li>
		<li><span id="loginCheck" style="color:red; font-size: 17px;"></span></li>
	</ul>
	<a href="javascript:loginChk();" class="btn1 sitebg1"><span>로그인</span></a>

	<!-- 로그인유지 -->
	<label for="isSave" class="ck_login cklabel mgt5">
		<div class="iconfont ftic-success"></div>
		<input type="checkbox" id="isSave" name="isSave" class="ckbox" value="T">
		아이디저장
	</label>
	<!-- 로그인유지 끝 -->


	<div class="member_link">
		<!-- <a href="javascript:;" class="join_pop_cls">회원가입</a> | -->
		<a href="./join.asp?redirect=https://demo3.mallup.co.kr/Default.asp">회원가입</a> |
		<a href="./find_id_sms.asp">아이디찾기</a> |
		<a href="./find_pw_sms.asp">비밀번호찾기</a>
	</div>
	

</div>

</form>

<script>

$(document).ready(function(){
	$("#id").focus();
	$("#pass").keypress(function(){
		if (event.which == 13) loginChk();
	});

	if($("#isSave").prop("checked"))
	{
		$("#isSave").parent().closest("label").addClass("on");
	}
	else
	{
		$("#isSave").parent().closest("label").removeClass("on");
	}

	$("#isSave").click(function(){
		var there = $(this).parent().closest("label");
		if($(this).prop("checked")){
			there.addClass("on");
		}else{
			there.removeClass("on");
		}
	});

});

function loginChk() {
	var uid = $("#id").val();
	var pass = $("#pass").val();
	var isSave = $(":radio[name=isSave]:checked").val();
	var token = $("#token").val();

	if (chkNull(uid)) {
		alert("아이디를 입력해 주세요.");
		$("#id").focus();
		return;
	}
	if (chkNull(pass)) {
		alert("비밀번호를 입력해 주세요.");
		$("#pass").focus();
		return;
	}
	if(chkNull(isSave)){
		isSave = "F";
	}


	// 2017-01-05 로그인 미리 체크하고 텍스트 뿌려주기 위함.
	/* var data = $("#Frm").serialize();
	$.ajax({
		type : "POST",
		async : false ,
		data : data ,
		url  : "./login_ajaxCheck.asp",
		success : function(data) {
			if(data == "T"){
				document.Frm.submit();
			}else{
				$('#loginCheck').html(data);
				return false;
			}
		}
	}); */

	document.Frm.submit();
}
</script>

<%@ include file="../includes/footer.jsp" %>




