<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<form method="post" action="/member/login" name="Frm">

<div class="member_wrap login">

	<h1 class="title">로그인</h1>


	<ul class="login_input">
		<li><input type="text" id="ID" name="ID" value="" placeholder="아이디"></li>
		<li><input type="password" id="PW" name="PW" placeholder="비밀번호"></li>
		<li><span id="loginCheck" style="color:red; font-size: 17px;"></span></li>
	</ul>
	<a href="javascript:loginChk();" class="btn01"><span>로그인</span></a>

	<!-- 로그인유지 -->
	<label class="ck_login cklabel mgt5">
		<span class="iconfont ftic-success"></span>
		<input type="checkbox" id="autoLogin" name="autoLogin" class="ckbox">
		자동로그인
	</label>
	<p class="tipTxt">보안을 위해 개인PC에서만 이용해주세요</p>
	<!-- 로그인유지 끝 -->


	<div class="member_link">
		<a href="/member/join">회원가입</a> |
		<a href="/member/find_id">아이디찾기</a> |
		<a href="/member/find_pw">비밀번호찾기</a>
	</div>
	

</div>

</form>

<script>

/*if("${result}" == "fail"){
	$("#ID").val("${id}")
	
	alert("아이디/비밀번호를 확인해주세요.");
}*/

$(document).ready(function(){
	
	var prevPage = "${prevPage}";

	$("#ID").focus();
	$("#ID, #PW").keydown(function(){
		if (event.which == 13) loginChk();
	});

	if($("#autoLogin").prop("checked")){
		$("#autoLogin").parent().closest("label").addClass("on");
	}else{
		$("#autoLogin").parent().closest("label").removeClass("on");
	}

	$("#autoLogin").click(function(){
		var there = $(this).parent().closest("label");
		if($(this).prop("checked")){
			there.addClass("on");
		}else{
			there.removeClass("on");
		}
	});

});

function loginChk() {
	var uid = $("#ID").val();
	var pass = $("#PW").val();
	var isSave = $(":radio[name=isSave]:checked").val();
	var token = $("#token").val();

	if (chkNull(uid)) {
		alert("아이디를 입력해 주세요.");
		$("#ID").focus();
		return;
	}
	if (chkNull(pass)) {
		alert("비밀번호를 입력해 주세요.");
		$("#PW").focus();
		return;
	}
	
	// 자동로그인 체크값 반환할 변수
    //const autoLogin = $('input[name=autoLogin]').is(":checked");
	
   // console.log(autoLogin);
	
    /* const userInfo = {
            autoLogin : autoLogin
    }; */
    
	// ajax로 로그인 처리
	var data = $(document.Frm).serialize();
	//data += JSON.stringify(userInfo);
	//data += "&autoLogin2=" + autoLogin; // 로그인정보에 자동로그인 사용유무 추가
	//console.log(data);
	$.ajax({
		type : "POST",
		async : false ,
		data : data ,
		url  : "/member/login",
		success : function(data) {
			if(data == "pwfail"){
				$('#loginCheck').html("아이디/비밀번호를 확인해주세요.");
			}else if(data == "idfail"){
				$('#loginCheck').html("등록된 정보가 없습니다.");
			}else{ // 로그인 성공
				if(window.location.pathname != "/member/login"){ // 로그인이필요한 페이지를 들어가서 튕겨온경우
					window.location.replace(window.location.href); // 이전페이지로 이동
				}else{ // 로그인이 필요없는 페이지 또는 메인에서 온경우
					window.location.replace(document.referrer); // 이전페이지(현재페이지에 저장된 url)로 이동
				}
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});

	//document.Frm.submit();
}
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>




