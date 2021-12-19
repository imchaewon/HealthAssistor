<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>


	<div class="sub_contents sbc_width best_wrap">
		<div class="left_none">
<script language="JavaScript">
<!--
$(document).ready(function(){

	 $("input:text[numberOnly]").on("keyup", function() {
		$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	 });

	/* 기본정보 */
	//$(":input[name=chkID]").blur(idCheck);
	$('input[name="chkID"]').keyup(idCheck)
	$(":input[name=rec_member]").keyup(recCheck);
	$("#emailSel li").click(function(){
		$("#emailDomain").val($(this).data("value"));
	});
	$("#o_ChEmailSel li").click(function(){
		$("#o_ChEmailDomain").val($(this).data("value"));
	});
	$("#emailSel2 li").click(function(){
		$("#emailDomain2").val($(this).data("value"));
	});
	$("#yearSel li").click(function(){
		$("#birthYear").val($(this).data("value"));
	});
	$("#monthSel li").click(function(){
		$("#birthMonth").val($(this).data("value"));
	});
	$("#daySel li").click(function(){
		$("#birthDay").val($(this).data("value"));
	});
//	$("#telSel li").click(function(){
//		$("#tel1").val($(this).data("value"));
//	});
//	$("#mobileSel li").click(function(){
//		$("#mobile1").val($(this).data("value"));
//	});

	/* 기본체크 */
	$(".ckbox").each(function(index){
		if($(this).prop("checked"))
		{
			if($(this).hasClass("termsAll")) /* 전체선택체크 */
			{
				$(".cklabel").not(".ck_mail").removeClass("on");
				$(".ckbox").not(".ck_mail").prop("checked",false);
				$(".cklabel").not(".ck_mail").addClass("on");
				$(".ckbox").not(".ck_mail").prop("checked",true);
			}
			else
			{
				$(".cklabel").eq(index).addClass("on");
			}
		}
		else
		{
			$(".cklabel").eq(index).removeClass("on");
		}


		$(this).change(function(){
			if($(this).prop("checked"))
			{
				if($(this).hasClass("termsAll")) /* 전체선택체크 */
				{
					$(".cklabel").not(".ck_mail").addClass("on");
					$(".ckbox").not(".ck_mail").prop("checked",true);
				}
				else
				{
					$(".cklabel").eq(index).addClass("on");
				}
			}
			else
			{
				if($(this).hasClass("termsAll")) /* 전체선택체크 */
				{
					$(".cklabel").not(".ck_mail").removeClass("on");
					$(".ckbox").not(".ck_mail").prop("checked",false);
				}
				else
				{
					$(".cklabel").eq(index).removeClass("on");
				}
			}
		});

	});


	setQuick();
	resetSelectEvent(); // 신규셀렉트 생성시 한번리셋
});

function reset_domain(){
	$("#emailDomain").val('');
}


//-->
</script>
<script>
//아이디 계정 부분을 선택했을때도 아이디중복체크
$(document).ready(function(){
	$("#emailSel").on("click", "li", function(){
			var f = document.Frm;
			if ( $(this).data("value").trim() == '' ){ $("#idresult").html("");return; }

		   var userWriteId = $('input:text[name="chkID"]').val();
		   if ( userWriteId.trim() != "" ){
			   $('input:text[name="chkID"]').trigger("keyup");
		   }
	})
});
//비밀번호와 확인용비밀번호 일치여부체크
function passwordCheck(obj){
	var f = document.Frm;
	if (checkEmpty(f.pass)) {
		$("#rePassResult").html("<span style='color:red;'>*비밀번호를 입력해 주세요.</span>");
		$(obj).val("");
		f.pass.focus();
		return ;
	}
	if (!checkPass(f.pass.value, 8, 20) || !checkEngNum(f.pass.value)){
		$("#rePassResult2").html("<span style='color:red;'>*비밀번호는 영문/숫자/특수문자의 조합으로 8~20자 내외로 정해주세요</span>");
		$(obj).val("");
		f.pass.focus();
		return ;
	}else{
		$("#rePassResult2").html("영문/숫자/특수문자의 조합으로 8~20자 <span id='rePassResult2'> </span>");
	}

	if (f.id.value == f.pass.value){
		$("#rePassResult").html("<span style='color:red;'>*비밀번호는 아이디와 동일하게 할 수 없습니다.</span>");
		f.pass.value = "";
		$(obj).val("");
		f.pass.focus();
		return ;
	}

	if (checkEmpty(f.rePass)) {
		$("#rePassResult").html("<span style='color:red;'>*비밀번호와 일치하지 않습니다.</span>");
		return ;
	}

	if (f.pass.value != f.rePass.value){
		$("#rePassResult").html("<span style='color:red;'>*비밀번호와 일치하지 않습니다.</span>");
		return ;
	}
	if(f.pass.value == f.rePass.value){
	$("#rePassResult").html("<span style='color:blue;'>*일치하는 비밀번호입니다.</span>");}

}


function submitChk(checkColunmList, checkColunmListName) {
	var f = document.Frm;
	var objItem;

	if (checkEmpty(f.chkID)) {
		alert("아이디를 입력해 주세요.");
		f.chkID.focus();
		return;
	}

	if (!checkID(f.chkID.value, 4, 20)){
		alert("아이디는 영문 혹은 숫자 4자~20자리로 해주세요.");
		f.chkID.focus();
		return;
	}

	if (f.id.value != f.chkID.value){
		alert("아이디는 사용중입니다. 다시 입력해주세요.");
		f.chkID.focus();
		return;
	}
	if (checkEmpty(f.pass)) {
		alert("비밀번호를 입력해 주세요.");
		f.pass.focus();
		return;
	}
	if (!checkPass(f.pass.value, 8, 20) || !checkEngNum(f.pass.value)){
		alert("비밀번호는 영대/영소/숫자/특수문자의 3조합 이상으로 8~20자 내외로 정해주세요");
		f.pass.focus();
		return;
	}
	if (f.id.value == f.pass.value){
		alert("비밀번호는 아이디와 동일하게 할 수 없습니다.");
		f.pass.focus();
		return;
	}
	if (checkEmpty(f.rePass)) {
		alert("비밀번호 확인을 입력해 주세요.");
		f.rePass.focus();
		return;
	}
	if (f.pass.value != f.rePass.value){
		alert("비밀번호를 다시 확인해 주세요.");
		f.rePass.focus();
		return;
	}
	if (checkEmpty(f.name)) {
		alert("이름을 입력해 주세요.");
		f.name.focus();
		return;
	}
// 회원가입 설정 - 시작
// 입력해야 되는 페이지 체크.
	var colunmList = checkColunmList.split(',');
	var colunmListName = checkColunmListName.split(',');
	for (var i = 0; i < colunmList.length; i++){
		if (colunmList[i] == 'email'){	// 이메일 체크
			if (checkEmpty(f.emailID)) {
				alert("이메일 주소를 입력해 주세요.");
				f.chkEmailID.focus();
				return ;
			}
			var email = f.emailID.value + (checkEmpty(f.emailDomain)?"":"@" + f.emailDomain.value);
			if (!checkEmail(email)) {
				alert("형식에 맞지 않는 이메일 주소입니다.\n\n이메일 주소를 정확하게 입력해 주세요.");
				f.chkEmailID.focus();
				return ;
			}
        }else if (colunmList[i] == 'mobile'){	// 휴대폰 체크
//			if (checkEmpty(f.mobile1)){
//				alert("휴대폰번호를 입력해 주세요.");
//				f.mobile2.focus();
//				return ;
//			}else if (checkEmpty(f.mobile2)){
//				alert("휴대폰번호를 입력해 주세요.");
//				f.mobile2.focus();
//				return ;
//			}else if (checkEmpty(f.mobile2)){
//				alert("휴대폰번호를 입력해 주세요.");
//				f.mobile3.focus();
//				return ;
//			}
			// kyh
			if (checkEmpty(f.mobile)){
				alert("휴대폰번호를 입력해 주세요.");
				f.mobile.focus();
				return ;
			}
		}else if (colunmList[i] == 'tel'){	// 전화번호 체크
//			if (checkEmpty(f.tel1)){
//				alert("전화번호를 입력해 주세요.");
//				f.tel2.focus();
//				return ;
//			}else if (checkEmpty(f.tel2)){
//				alert("전화번호를 입력해 주세요.");
//				f.tel2.focus();
//				return ;
//			}else if (checkEmpty(f.tel3)){
//				alert("전화번호를 입력해 주세요.");
//				f.tel3.focus();
//				return ;
//			}
			if (checkEmpty(f.tel)){
				alert("전화번호를 입력해 주세요.");
				f.tel.focus();
				return ;
			}
        }else if (colunmList[i] == 'smsCertification'){	// 휴대폰 인증
			if ($('#certification_mobile').val() != '1'){
				alert('휴대폰 인증을 받아주세요.');
				return;
			}
		}else if (colunmList[i] == 'emailCertification'){	// 이메일 인증
			if ($('#certification_email').val() != '1'){
				alert('이메일 인증을 받아주세요.');
				return;
			}
		}else if (colunmList[i] == 'birthDate'){	// 생일 인증
			if (checkEmpty(f.birthYear) || checkEmpty(f.birthMonth) || checkEmpty(f.birthDay)) {
				alert("생년월일을 입력해 주세요.");
				f.birthYear.focus();
				return ;
			}
		}
		else if (colunmList[i] == 'sex'){	// 성별 인증
//'180228 edit bhc : isRealName (본인인증 사용여부) 조건 추가
			if ( $("#isRealName").val() == "F" )
			{
				if (getRadioVal(f.gender)==""){
					alert("성별을 입력해 주세요")
					f.gender[0].focus();
					return ;
				}
			}
		}
		else if (colunmList[i] == 'addr'){	// 주소
			if (checkEmpty(f.post) || checkEmpty(f.addr)) {
				alert("주소를 입력해 주세요.");
				f.post.focus();
				return ;
			}
			if (checkEmpty(f.addrDetail)) {
				alert("주소를 입력해 주세요.");
				f.addrDetail.focus();
				return ;
			}
		}else if (colunmList[i] == 'rec_member'){	// 추천인
			if(f.rec_chk.value == "Y" && f.rec_member.value == ''){
				f.rec_chk.value = "N";
			}
			if(f.rec_chk.value == "N" && f.rec_member.value != ''){
				alert("해당 추천인이 없습니다.");
				f.rec_member.focus();
				return;
			}
			if(f.rec_chk.value != "Y" ){
				alert("추천인을 입력해주세요.");
				f.rec_member.focus();
				return;
			}
		}else if (colunmList[i] == 'o_BizNo'){	// 사업자 번호
			if (checkEmpty(f.o_BizNo1)) {
				alert("사업자 번호를 입력해주세요.");
				f.o_BizNo1.focus();
				return;
			}else if (checkEmpty(f.o_BizNo2)) {
				alert("사업자 번호를 입력해주세요.");
				f.o_BizNo2.focus();
				return;
			}if (checkEmpty(f.o_BizNo3)) {
				alert("사업자 번호를 입력해주세요.");
				f.o_BizNo3.focus();
				return;
			}
		}else if (colunmList[i] == 'o_ChEmail'){	// 담당자 이메일 체크
			if (checkEmpty(f.o_ChEmailID)) {
				alert("이메일 주소를 입력해 주세요.");
				f.o_ChEmailID.focus();
				return ;
			}
			var email = f.o_ChEmailID.value + (checkEmpty(f.o_ChEmailDomain)?"":"@" + f.o_ChEmailDomain.value);
			if (!checkEmail(email)) {
				alert("형식에 맞지 않는 이메일 주소입니다.\n\n이메일 주소를 정확하게 입력해 주세요.");
				f.o_ChEmailID.focus();
				return ;
			}
        }else if (colunmList[i] == 'o_Addr'){	// 회사 주소 체크
			if (checkEmpty(f.officepost) || checkEmpty(f.officeaddr)) {
				alert("회사 주소를 입력해 주세요.");
				f.officepost.focus();
				return;
			}
			if (checkEmpty(f.officeaddrDetail)) {
				alert("회사 주소를 입력해 주세요.");
				f.officeaddrDetail.focus();
				return;
			}
        }else if (colunmList[i] != ''){	// 새로추가한 필드들 체크.
			var inputType = $("input[name='"+colunmList[i]+"']").attr('type');
			if (inputType == 'text'){
				if ($("input[name='"+colunmList[i]+"']").val() == ''){
					alert(colunmListName[i]+"(을)를 입력해주세요.");
					$("input[name='"+colunmList[i]+"']").focus();
					return;
				}
			}else if (inputType == 'radio'){
				var checkCnt = $("input[name='"+colunmList[i]+"']:checked").size();
				if (checkCnt <= 0){
					alert(colunmListName[i]+"(을)를 선택해주세요.");
					$("input[name='"+colunmList[i]+"']").focus();
					return;
				}
			}else if (inputType == 'checkbox'){
				var objCb = $("input[name='"+colunmList[i]+"']");
				var cbLen = $("input[name='"+colunmList[i]+"']").size();
				var cbChkCnt = 0;
				for (var x=0; x<cbLen; x++) {
					if (objCb[x].checked) {
						++cbChkCnt;
					}
				}
				if (cbChkCnt == 0){
					alert(colunmListName[i]+"(을)를 선택해주세요.");
					$("input[name='"+colunmList[i]+"']").focus();
					return;
				}
			}else if (inputType == 'file'){
				if ($("input[name='"+colunmList[i]+"']").val() == ''){
					alert(colunmListName[i]+"(을)를 넣어주세요.");
					$("input[name='"+colunmList[i]+"']").focus();
					return;
				}
			}else if (inputType == 'hidden'){	// select를 pc에서는 hidden 값으로 체크해야함
				if ($("input[name='"+colunmList[i]+"']").val() == ''){
					alert(colunmListName[i]+"(을)를 선택해주세요.");
					$("input[name='"+colunmList[i]+"']").focus();
					return;
				}
			}else {	// select
				if ($("select[name='"+colunmList[i]+"']").val() == ''){
					alert(colunmListName[i]+"(을)를 선택해주세요.");
					$("input[name='"+colunmList[i]+"']").focus();
					return;
				}
			}

//			//2018-11-09 khs : 기업코드 
//			if (colunmListName[i]=="기업코드" && SHA512($("input[name='"+colunmList[i]+"']").val())!='d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db'){
//				alert("정확한 "+colunmListName[i]+"(을)를 입력해주세요.");
//				$("input[name='"+colunmList[i]+"']").focus();
//				return;
//			}
        }
    }

	// 여기까지 일단 테스트해야함.

	var Li_result=$("input:checkbox[name='agreeLicensing']").is(":checked");
	var pri_result=$("input:checkbox[name='agree_po']").is(":checked");
	var agree_age=$("input:checkbox[name='agree_age']").is(":checked");
	if (Li_result==false) {
		alert("약관에 동의해 주세요.");
		return ;
	}
	if (pri_result==false) {
		alert("개인정보 수집 및 이용에 동의해 주세요.");
		return ;
	}
	if (agree_age==false) {
		alert("만 14세 미만인 경우 회원가입이 불가합니다.");
		return ;
	}
	//방식변경//jings3, 2019-06-25 //(Begin)
		//var pass = f.pass.value;
		//f.pwd.value = SHA512(pass.trim());
	//방식변경//jings3, 2019-06-25 //(End)

	if (confirm("회원가입을 하시겠습니까?")) {
		f.target = "_self";
		f.action = "joinOK.asp";
		f.submit();
	}
}
</script>


<div class="joinstep">
	<ul style="border:none;">
		<!--
		<li>
			<div class="step">
				<div class="icon"><span class="iconfont ftic-success"></span></div>
				<div class="text">
					<span>STEP 01</span> <br>
					<strong>약관동의/본인인증</strong>
				</div>
			</div>
			<div class="next"><span class="iconfont ftic-next"></span></div>
		</li>
		-->
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

<!-- 회원가입 -->
<div class="member_wrap">

<h1 class="title"><i class="iconfont ftic-join"></i> 회원가입</h1>


	<p class="warnt">* 필수입력</p>

	<form name="Frm" method="post" enctype="multipart/form-data" autocomplete="off">
		<input type="hidden" id="token" name="token" value="5TPAL4WFLO9MJ9LF26F7">
		<input type="hidden" id="dental_login_chk" name="dental_login_chk">
		<input type="hidden" id="id" name="id" value="">
		
		<input type="hidden" id="emailID" name="emailID" value="admin">
		<input type="hidden" id="emailDomain" name="emailDomain">
		<input type="hidden" id="emailDomain2" name="emailDomain2">


		<input type="hidden" id="birthYear" name="birthYear" value="">
		<input type="hidden" id="birthMonth" name="birthMonth" value="">
		<input type="hidden" id="birthDay" name="birthDay" value="">


		<!-- <input type="hidden" id="tel1" name="tel1"> -->
		<!-- <input type="hidden" id="mobile1" name="mobile1"> -->
		<input type="hidden" id="rec_chk" name="rec_chk" value="N">
		<input type="hidden" id="certification" value="0">
		<input type="hidden" id="sns_id" name="sns_id" value="">
		<input type="hidden" id="officeType" name="officeType" value=""> <!-- 기업회원 체크 -->
		<input type="hidden" id="certification_email" name="certifications" value="">
		<input type="hidden" id="certification_mobile" name="certifications" value="0">
		<input type="hidden" id="agreeMarketingchk" name="agreeMarketingchk" value="">
		<input type="hidden" id="o_ChEmailDomain" name="o_ChEmailDomain">

		<input type="hidden" id="emailGo" value="0">
		<input type="hidden" id="mobileGo" value="0">


		<input type="hidden" name="isRealName" id="isRealName" value="F">	
		<input type="hidden" id="DI" name="DI" value="">	
		<input type="hidden" id="redirect" name="redirect" value="">	
		<input type="hidden" name="orgMobile" id="orgMobile" value="">


				<ul class="join_list">
					<!-- <h1>기본정보입력</h1> -->

					<li>
						<input id="chkID" name="chkID" class="text" maxlength="25" type="text" placeholder="아이디 입력 *" style="ime-mode:disabled; width:100%;" value="" onblur="idCheck();" autocomplete="off">
						<div id="span_chkID" style="width:100%;"></div>
					</li>

					<li>
						<input name="pass" id="pass" class="text" type="password" maxlength="15" placeholder="비밀번호 입력 *" value="" style="width:100%;">
						<p class="notif" id="rePassResult2">영문/숫자/특수문자의 조합으로 8~20자 내외로 정해주세요</p>
					</li>

					<li>
						<input name="rePass" id="rePass" class="text" type="password" maxlength="15" placeholder="비밀번호 재입력 *" onkeyup="passwordCheck(this)" style="width:100%;" value="">
						<div id="rePassResult" style="width:100%;"></div>
					</li>

					<li>
						<input id="name" name="name" class="text" type="text" placeholder="이름 입력 *" value="" style="width:100%;">
					</li>

					<li class="mgt20">
						<input type="text" id="chkEmailID" name="chkEmailID" class="text" placeholder="이메일" maxlength="50" style="width:371px;" autocomplete="off" onkeyup="document.Frm.emailID.value=this.value;" onblur="document.Frm.emailID.value=this.value; emailCheck();">
						<!-- 셀렉트 -->
						<div class="select_option" style="width:204px;">
							<!-- 체크된 내용 -->
							<div class="active_cont">
								<span class="txt">직접입력</span>
							</div>
							<!-- 체크된 내용 끝 -->
							<!-- 셀렉트 리스트 -->
							<ul class="option_list" id="emailSel">
								<li data-value=""><span class="txt" onclick="reset_domain();">직접입력</span></li>
								<li data-value="naver.com">	<span class="txt">naver.com</span></li><li data-value="daum.net">	<span class="txt">daum.net</span></li><li data-value="hanmail.net">	<span class="txt">hanmail.net</span></li><li data-value="gmail.com">	<span class="txt">gmail.com</span></li><li data-value="nate.com">	<span class="txt">nate.com</span></li>
							</ul>

							
							<!-- 셀렉트 리스트 끝 -->
						</div>
					</li>

					<label for="isMailing" class="cklabel ck_mail mgt5">
						<div class="iconfont ftic-success"></div>
						<input type="checkbox" id="isMailing" name="isMailing" value="T" class="ckbox ck_mail">
						이메일 수신에 동의합니다.
					</label>

					<li>
						<!-- 셀렉트 -->
						<!-- <div class="select_option" style="width:222px;"> -->
							<!-- 체크된 내용 -->
							<!-- <div class="active_cont"> -->
								<!-- <span class="txt">전화번호 입력</span> -->
							<!-- </div> -->
							<!-- 체크된 내용 끝 -->
							<!-- 셀렉트 리스트 -->
							<!-- <ul class="option_list" id="telSel"> -->
								
							<!-- </ul> -->
							<!-- 셀렉트 리스트 끝 -->
						<!-- </div> -->
						<!-- 셀렉트 끝 -->
						<!-- <input type="text" id="tel2" name="tel2" class="text" style="width:174px;" numberOnly="true" maxlength="4"/>
						<input type="text" id="tel3" name="tel3" class="text" style="width:174px;" numberOnly="true" maxlength="4" /> -->
						<input type="text" id="tel" name="tel" class="text" style="width:100%;" numberonly="true" maxlength="20" value="" placeholder=" 전화번호 입력 (숫자만 입력하세요)">
					</li>

					<li>
						<!-- 셀렉트 -->
						<!-- <div class="select_option" style="width:222px;"> -->
							<!-- 체크된 내용 -->
							<!-- <div class="active_cont">
								<span class="txt phone_cls" >휴대전화 입력</span>
							</div> -->
							<!-- 체크된 내용 끝 -->
							<!-- 셀렉트 리스트 -->
							<!-- <ul class="option_list" id="mobileSel"> -->
								
							<!-- </ul> -->
							<!-- 셀렉트 리스트 끝 -->
						<!-- </div> -->
						<!-- 셀렉트 끝 -->
						<!-- <input type="text" id="mobile2" name="mobile2" class="text" style="width:174px;" numberOnly="true" maxlength="4" value=""/>
						<input type="text" id="mobile3" name="mobile3" class="text" style="width:174px;" numberOnly="true" maxlength="4" value="" /> -->
						<input type="text" id="mobile" name="mobile" class="text" style="width:100%;" numberonly="true" maxlength="11" value="" placeholder=" * 휴대전화 입력 (숫자만 입력하세요)">
					</li>

					<label for="isSms" class="cklabel ck_mail mgt5">
						<div class="iconfont ftic-success"></div>
						<input type="checkbox" id="isSms" name="isSms" value="T" class="ckbox ck_mail">
						SMS 수신에 동의 합니다.
					</label>



















					<li class="mgt20">
						<span class="btn_gray_board" onclick="openNewAddr('');">우편번호찾기</span>
						<input type="hidden" id="post" name="post">
						<input type="text" id="addr" name="addr" class="text" style="width:388px;">
					</li>

					<li><input type="text" id="addrDetail" name="addrDetail" class="text" placeholder="상세주소 입력" style="width:100%;"></li>

					<li>
						<!-- 셀렉트 -->
						<div class="select_option" style="width:222px;">
							<!-- 체크된 내용 -->
							<div class="active_cont">
								<span class="txt">생년월일 *</span>
							</div>
							<!-- 체크된 내용 끝 -->
							<!-- 셀렉트 리스트 -->
							<ul class="option_list" id="yearSel">
							 <li data-value="2021">
 	<span class="txt">2021년</span>
 </li>
 <li data-value="2020">
 	<span class="txt">2020년</span>
 </li>
 <li data-value="2019">
 	<span class="txt">2019년</span>
 </li>
 <li data-value="2018">
 	<span class="txt">2018년</span>
 </li>
 <li data-value="2017">
 	<span class="txt">2017년</span>
 </li>
 <li data-value="2016">
 	<span class="txt">2016년</span>
 </li>
 <li data-value="2015">
 	<span class="txt">2015년</span>
 </li>
 <li data-value="2014">
 	<span class="txt">2014년</span>
 </li>
 <li data-value="2013">
 	<span class="txt">2013년</span>
 </li>
 <li data-value="2012">
 	<span class="txt">2012년</span>
 </li>
 <li data-value="2011">
 	<span class="txt">2011년</span>
 </li>
 <li data-value="2010">
 	<span class="txt">2010년</span>
 </li>
 <li data-value="2009">
 	<span class="txt">2009년</span>
 </li>
 <li data-value="2008">
 	<span class="txt">2008년</span>
 </li>
 <li data-value="2007">
 	<span class="txt">2007년</span>
 </li>
 <li data-value="2006">
 	<span class="txt">2006년</span>
 </li>
 <li data-value="2005">
 	<span class="txt">2005년</span>
 </li>
 <li data-value="2004">
 	<span class="txt">2004년</span>
 </li>
 <li data-value="2003">
 	<span class="txt">2003년</span>
 </li>
 <li data-value="2002">
 	<span class="txt">2002년</span>
 </li>
 <li data-value="2001">
 	<span class="txt">2001년</span>
 </li>
 <li data-value="2000">
 	<span class="txt">2000년</span>
 </li>
 <li data-value="1999">
 	<span class="txt">1999년</span>
 </li>
 <li data-value="1998">
 	<span class="txt">1998년</span>
 </li>
 <li data-value="1997">
 	<span class="txt">1997년</span>
 </li>
 <li data-value="1996">
 	<span class="txt">1996년</span>
 </li>
 <li data-value="1995">
 	<span class="txt">1995년</span>
 </li>
 <li data-value="1994">
 	<span class="txt">1994년</span>
 </li>
 <li data-value="1993">
 	<span class="txt">1993년</span>
 </li>
 <li data-value="1992">
 	<span class="txt">1992년</span>
 </li>
 <li data-value="1991">
 	<span class="txt">1991년</span>
 </li>
 <li data-value="1990">
 	<span class="txt">1990년</span>
 </li>
 <li data-value="1989">
 	<span class="txt">1989년</span>
 </li>
 <li data-value="1988">
 	<span class="txt">1988년</span>
 </li>
 <li data-value="1987">
 	<span class="txt">1987년</span>
 </li>
 <li data-value="1986">
 	<span class="txt">1986년</span>
 </li>
 <li data-value="1985">
 	<span class="txt">1985년</span>
 </li>
 <li data-value="1984">
 	<span class="txt">1984년</span>
 </li>
 <li data-value="1983">
 	<span class="txt">1983년</span>
 </li>
 <li data-value="1982">
 	<span class="txt">1982년</span>
 </li>
 <li data-value="1981">
 	<span class="txt">1981년</span>
 </li>
 <li data-value="1980">
 	<span class="txt">1980년</span>
 </li>
 <li data-value="1979">
 	<span class="txt">1979년</span>
 </li>
 <li data-value="1978">
 	<span class="txt">1978년</span>
 </li>
 <li data-value="1977">
 	<span class="txt">1977년</span>
 </li>
 <li data-value="1976">
 	<span class="txt">1976년</span>
 </li>
 <li data-value="1975">
 	<span class="txt">1975년</span>
 </li>
 <li data-value="1974">
 	<span class="txt">1974년</span>
 </li>
 <li data-value="1973">
 	<span class="txt">1973년</span>
 </li>
 <li data-value="1972">
 	<span class="txt">1972년</span>
 </li>
 <li data-value="1971">
 	<span class="txt">1971년</span>
 </li>
 <li data-value="1970">
 	<span class="txt">1970년</span>
 </li>
 <li data-value="1969">
 	<span class="txt">1969년</span>
 </li>
 <li data-value="1968">
 	<span class="txt">1968년</span>
 </li>
 <li data-value="1967">
 	<span class="txt">1967년</span>
 </li>
 <li data-value="1966">
 	<span class="txt">1966년</span>
 </li>
 <li data-value="1965">
 	<span class="txt">1965년</span>
 </li>
 <li data-value="1964">
 	<span class="txt">1964년</span>
 </li>
 <li data-value="1963">
 	<span class="txt">1963년</span>
 </li>
 <li data-value="1962">
 	<span class="txt">1962년</span>
 </li>
 <li data-value="1961">
 	<span class="txt">1961년</span>
 </li>
 <li data-value="1960">
 	<span class="txt">1960년</span>
 </li>
 <li data-value="1959">
 	<span class="txt">1959년</span>
 </li>
 <li data-value="1958">
 	<span class="txt">1958년</span>
 </li>
 <li data-value="1957">
 	<span class="txt">1957년</span>
 </li>
 <li data-value="1956">
 	<span class="txt">1956년</span>
 </li>
 <li data-value="1955">
 	<span class="txt">1955년</span>
 </li>
 <li data-value="1954">
 	<span class="txt">1954년</span>
 </li>
 <li data-value="1953">
 	<span class="txt">1953년</span>
 </li>
 <li data-value="1952">
 	<span class="txt">1952년</span>
 </li>
 <li data-value="1951">
 	<span class="txt">1951년</span>
 </li>
 <li data-value="1950">
 	<span class="txt">1950년</span>
 </li>
 <li data-value="1949">
 	<span class="txt">1949년</span>
 </li>
 <li data-value="1948">
 	<span class="txt">1948년</span>
 </li>
 <li data-value="1947">
 	<span class="txt">1947년</span>
 </li>
 <li data-value="1946">
 	<span class="txt">1946년</span>
 </li>
 <li data-value="1945">
 	<span class="txt">1945년</span>
 </li>
 <li data-value="1944">
 	<span class="txt">1944년</span>
 </li>
 <li data-value="1943">
 	<span class="txt">1943년</span>
 </li>
 <li data-value="1942">
 	<span class="txt">1942년</span>
 </li>
 <li data-value="1941">
 	<span class="txt">1941년</span>
 </li>
 <li data-value="1940">
 	<span class="txt">1940년</span>
 </li>
 <li data-value="1939">
 	<span class="txt">1939년</span>
 </li>
 <li data-value="1938">
 	<span class="txt">1938년</span>
 </li>
 <li data-value="1937">
 	<span class="txt">1937년</span>
 </li>
 <li data-value="1936">
 	<span class="txt">1936년</span>
 </li>
 <li data-value="1935">
 	<span class="txt">1935년</span>
 </li>
 <li data-value="1934">
 	<span class="txt">1934년</span>
 </li>
 <li data-value="1933">
 	<span class="txt">1933년</span>
 </li>
 <li data-value="1932">
 	<span class="txt">1932년</span>
 </li>
 <li data-value="1931">
 	<span class="txt">1931년</span>
 </li>
 <li data-value="1930">
 	<span class="txt">1930년</span>
 </li>
 <li data-value="1929">
 	<span class="txt">1929년</span>
 </li>
 <li data-value="1928">
 	<span class="txt">1928년</span>
 </li>
 <li data-value="1927">
 	<span class="txt">1927년</span>
 </li>
 <li data-value="1926">
 	<span class="txt">1926년</span>
 </li>
 <li data-value="1925">
 	<span class="txt">1925년</span>
 </li>
 <li data-value="1924">
 	<span class="txt">1924년</span>
 </li>
 <li data-value="1923">
 	<span class="txt">1923년</span>
 </li>
 <li data-value="1922">
 	<span class="txt">1922년</span>
 </li>
 <li data-value="1921">
 	<span class="txt">1921년</span>
 </li>

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
							 <li data-value="01">
 	<span class="txt">1월</span>
 </li>
 <li data-value="02">
 	<span class="txt">2월</span>
 </li>
 <li data-value="03">
 	<span class="txt">3월</span>
 </li>
 <li data-value="04">
 	<span class="txt">4월</span>
 </li>
 <li data-value="05">
 	<span class="txt">5월</span>
 </li>
 <li data-value="06">
 	<span class="txt">6월</span>
 </li>
 <li data-value="07">
 	<span class="txt">7월</span>
 </li>
 <li data-value="08">
 	<span class="txt">8월</span>
 </li>
 <li data-value="09">
 	<span class="txt">9월</span>
 </li>
 <li data-value="10">
 	<span class="txt">10월</span>
 </li>
 <li data-value="11">
 	<span class="txt">11월</span>
 </li>
 <li data-value="12">
 	<span class="txt">12월</span>
 </li>

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
							 <li data-value="01">
 	<span class="txt">1일</span>
 </li>
 <li data-value="02">
 	<span class="txt">2일</span>
 </li>
 <li data-value="03">
 	<span class="txt">3일</span>
 </li>
 <li data-value="04">
 	<span class="txt">4일</span>
 </li>
 <li data-value="05">
 	<span class="txt">5일</span>
 </li>
 <li data-value="06">
 	<span class="txt">6일</span>
 </li>
 <li data-value="07">
 	<span class="txt">7일</span>
 </li>
 <li data-value="08">
 	<span class="txt">8일</span>
 </li>
 <li data-value="09">
 	<span class="txt">9일</span>
 </li>
 <li data-value="10">
 	<span class="txt">10일</span>
 </li>
 <li data-value="11">
 	<span class="txt">11일</span>
 </li>
 <li data-value="12">
 	<span class="txt">12일</span>
 </li>
 <li data-value="13">
 	<span class="txt">13일</span>
 </li>
 <li data-value="14">
 	<span class="txt">14일</span>
 </li>
 <li data-value="15">
 	<span class="txt">15일</span>
 </li>
 <li data-value="16">
 	<span class="txt">16일</span>
 </li>
 <li data-value="17">
 	<span class="txt">17일</span>
 </li>
 <li data-value="18">
 	<span class="txt">18일</span>
 </li>
 <li data-value="19">
 	<span class="txt">19일</span>
 </li>
 <li data-value="20">
 	<span class="txt">20일</span>
 </li>
 <li data-value="21">
 	<span class="txt">21일</span>
 </li>
 <li data-value="22">
 	<span class="txt">22일</span>
 </li>
 <li data-value="23">
 	<span class="txt">23일</span>
 </li>
 <li data-value="24">
 	<span class="txt">24일</span>
 </li>
 <li data-value="25">
 	<span class="txt">25일</span>
 </li>
 <li data-value="26">
 	<span class="txt">26일</span>
 </li>
 <li data-value="27">
 	<span class="txt">27일</span>
 </li>
 <li data-value="28">
 	<span class="txt">28일</span>
 </li>
 <li data-value="29">
 	<span class="txt">29일</span>
 </li>
 <li data-value="30">
 	<span class="txt">30일</span>
 </li>
 <li data-value="31">
 	<span class="txt">31일</span>
 </li>

							</ul>
							<!-- 셀렉트 리스트 끝 -->
						</div>
						<!-- 셀렉트 끝 -->
					</li>

						<li>
							<input type="text" id="rec_member" name="rec_member" class="text" placeholder="추천인을 입력해주세요." maxlength="50" style="width:100%;">
							<p class="notif" id="recMsg">추천인을 추가하시면 많은 혜택을 받을 수 있습니다.</p>
						</li>
						
					<li class="mgt20">
						<input type="text" id="smsConfirm" name="smsConfirm" class="text" placeholder="인증번호 입력 *" style="width:77%;" onkeyup="Numbers(this); cntCheck('sms');" maxlength="6">
						<label class="smsSubmit">
							
								<span class="btn_check" onclick="smsSend();">휴대폰인증</span>
							
						</label>
						<label class="smsDisplayCount notif" style="font-size:16px; padding-top:10px; display:none;">
							<span class="smsCountTimeMinute">0</span>분
							<span class="smsCountTimeSecond">0</span>초
						</label>
					</li>
					
<!-- 이용약관 구조 추가 2019-09-09 kyh, 필수선택만 솔루션에 가져옴 -->


			<div class="joinPop_textInfo">
				<div class="join_allChkBox">
					<p>※ 동의 시 이용약관, 개인정보 수집 및 이용에 동의 됨을 알려드립니다.</p>
					<input type="checkbox" name="agree_all" value="T" id="Join_allCheck" onchange="primemCkBox(this, 'a')"> <label for="Join_allCheck">내용 확인 및 전체 동의</label>
				</div>

				<div class="joinPop_textWrap">

					<ul class="joinPop_infoCont">

						<li class="on" id="tab-1">
							<!-- <iframe src="/html/info_dumy.asp" frameborder="0" style="width:100%; height:177px; border:1px solid #EEE; background-color:#f9f9f9; overflow:hidden;"></iframe> -->
							<div class="itaBox itaBox2">
								<div class="itaBoxWrap">
									<div class="close-all-menu" onclick="closeIta(this);"><img src="/images/close_2.png" alt="close"></div>
									<div class="itaBoxHead">이용약관 </div>
									<div class="itaBoxBody">


<style>
.mgt0 {margin-top:0 !important;}
.guide_wrap {margin:20px 0; padding:40px 7%; border:1px solid #e7e7e7; background:#fff; font-size:14px;}
.guide_wrap p {margin:20px 0 0 0; font-size:14px; line-height:18px;}
.guide_wrap ol {margin-top:30px; font-size:18px; line-height:24px;}
.guide_wrap ol li {margin-top:10px; font-weight:bold;}
.guide_wrap h2 {margin-top:50px; font-size:18px; line-height:24px;}
</style>


<div class="guide_wrap">
<h2 class="mgt0">1조 (목적)</h2>
<p>이 약관은 ( “데모몰 DEMOMALL” ) 에서 제공하는 쇼핑몰을 이용함에 있어 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.</p>
<h2>제2조 (정의)</h2>
<p>① 쇼핑몰이라 함은 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보 통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다.</p>
<p>② 이용자라 함은 쇼핑몰에 접속하여 서비스를 받는 회원 및 비회원을 말합니다.</p>
<p>③ 회원이라 함은 쇼핑몰에 개인정보를 제공하여 회원등록을 한 자로서, 쇼핑몰의 정보를 지속적으로 제공받으며, 서비스를 이용할 수 있는 자를 말합니다.</p>
<p>④ 비회원이라 함은 회원에 가입하지 않고 쇼핑몰이 제공하는 서비스를 이용하는 자를 말합니다.</p>
<h2>제3조 (약관의 명시와 개정)</h2>
<p>① (“데모몰 DEMOMALL )은 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 쇼핑몰의 초기 서비스화면(전면)에 게시합니다.</p>
<p>② 쇼핑몰은 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p>
<p>③ 쇼핑몰이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.</p>
<p>④ 쇼핑몰은 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 “이용자가 상당한 기간 내에 변경 약관에 대한 동의 여부를 표명하지 아니하는 때에는 변경약관의 적용을 받는 것으로 본다”는 내용의 취지를 통지를 하였음에도 동의 여부를 표명하지 아니한 경우 또는 부득이한 사유로 그러한 통지를 할 수 없는 경우에도 개정약관이 적용됩니다.</p>
<p>⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</p>
<h2>제4조 (서비스의 제공 및 변경)</h2>
<p>① 쇼핑몰은 다음과 같은 업무를 수행합니다.</p>
<p>가. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</p>
<p>나. 구매계약이 체결된 재화 또는 용역의 배송</p>
<p>다. 기타 쇼핑몰이 정하는 업무</p>
<p>② 쇼핑몰은 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화·용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화·용역의 내용 및 제공일자를 명시하여 현재의 재화·용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다.</p>
<p>③ 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우 쇼핑몰은 이로 인하여 이용자가 입은 손해를 배상합니다. 단, 쇼핑몰의 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.</p>
<h2>제5조 (서비스의 중단)</h2>
<p>① 쇼핑몰은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</p>
<p>② 제1항에 의한 서비스 중단의 경우에는 쇼핑몰 이용약관 제8조에 정한 방법으로 이용자에게 통지합니다.</p>
<p>③ 쇼핑몰은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 쇼핑몰에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.</p>
<h2>제6조 (회원가입)</h2>
<p>① 이용자는 쇼핑몰이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 하며, 자동적으로 연합사이트인 쇼핑몰의 회원자격을 부여합니다.</p>
<p>② 쇼핑몰은 다음 각 호에 해당하면 쇼핑몰 회원으로 등록거부를 할 수 있습니다.</p>
<p>가. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 다만 제7조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 쇼핑몰의 회원 재 가입 승낙을 얻은 경우에는 예외로 한다.</p>
<p>나. 등록 내용에 허위, 기재누락, 오기가 있는 경우</p>
<p>다. 기타 회원으로 등록하는 것이 쇼핑몰 기술상 현저히 지장이 있다고 판단되는 경우</p>
<p>라. 만 14세 미만으로 보호자 동의가 없는경우</p>
<p>③ 회원가입계약의 성립 시기는 승낙이 회원에게 도달한 시점으로 합니다.</p>
<p>④ 회원은 본 쇼핑몰 및 쇼핑몰의 다양한 이벤트를 받을 수 있으며, 원치 않는 경우 본 쇼핑몰을 통해 탈퇴할 수 있습니다.</p>
<p>⑤ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 직접변경 및 전자우편 기타 방법으로 쇼핑몰에 대하여 그 변경사항을 알려야 합니다.</p>
<h2>제7조 (회원 탈퇴 및 자격 상실 등)</h2>
<p>① 회원은 쇼핑몰에서 언제든지 탈퇴를 요청할 수 있으며 쇼핑몰은 즉시 회원탈퇴를 처리합니다.</p>
<p>② 회원이 다음 각 호의 사유에 해당하는 경우, 쇼핑몰은 회원자격을 제한 및 정지시킬 수 있습니다.</p>
<p>i. 가입 신청 시에 허위 내용을 등록한 경우</p>
<p>ii. 가입시 제 6조 ②항에 해당되는 경우</p>
<p>iii. 쇼핑몰을 이용하여 구입한 재화·용역 등의 대금, 기타 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</p>
<p>iv. 다른 사람의 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우</p>
<p>v. 쇼핑몰을 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</p>
<p>③ 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 회원자격을 상실 시킬 수 있습니다.</p>
<p>④ 쇼핑몰에서 회원자격을 상실 시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.</p>
<h2>제8조 (회원에 대한 통지)</h2>
<p>① 회원에 대한 통지를 하는 경우, 회원이 쇼핑몰에 제출한 전자우편 주소로 할 수 있습니다.</p>
<p>② 불특정다수 회원에 대한 통지의 경우 1주일이상 공지사항 및 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.</p>
<h2>제9조 (구매신청)</h2>
<p>쇼핑몰 이용자는 이하의 방법에 의하여 구매를 신청합니다.</p>
<p>가.성명, 주소, 전화번호, 이메일 입력</p>
<p>나.재화 또는 용역의 선택</p>
<p>다.결제방법의 선택</p>
<p>라.구매내용 확인후 최종결정(예, “주문완료”마우스 클릭)</p>
<h2>제10조 (계약의 성립)</h2>
<p>① 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다.</p>
<p>가.신청 내용에 허위, 기재누락, 오기가 있는 경우</p>
<p>나.미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</p>
<p>다.기타 구매신청에 승낙하는 것이 기술상 현저히 지장이 있다고 판단하는 경우</p>
<p>② 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</p>
<h2>제11조 (지급방법)</h2>
<p>쇼핑몰에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다.</p>
<p>가.계좌이체</p>
<p>나.신용카드결제</p>
<p>다.온라인무통장입금</p>
<p>라.쇼핑몰에서 지급한 적립금 또는 e-cash에 의한 결제 등</p>
<h2>제12조 (수신확인통지·구매신청 변경 및 취소)</h2>
<p>① 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</p>
<p>② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.</p>
<p>③ 배송 전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다.</p>
<h2>제13조 (배송)</h2>
<p>이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다.</p>
<h2>제14조 (환급, 반품 및 교환)</h2>
<p>① 이용자가 구매 신청한 재화 또는 용역이 품절 등의 사유로 재화의 인도 또는 용역의 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 사전에 재화 또는 용역의 대금을 받은 경우에는 대금을 받은 날부터 영업일 기준 3일 이내에, 그렇지 않은 경우에는 그 사유발생일로부터 영업일 기준 3일 이내에 계약해제 및 환급절차를 취합니다.</p>
<p>② 다음 각 호의 경우에는 배송된 재화일지라도 재화를 반품 받은 다음 영업일 이내에 이용자의 요구에 따라 즉시 환급, 반품 및 교환 조치를 합니다. 다만 그 요구기한은 배송된 날로부터 20일 이내로 합니다.</p>
<p>가.배송된 재화가 주문내용과 상이하거나 쇼핑몰이 제공한 정보와 상이할 경우</p>
<p>나.배송된 재화가 파손, 손상되었거나 오염되었을 경우</p>
<p>다.재화가 광고에 표시된 배송기간보다 늦게 배송된 경우</p>
<p>라.방문판매 등에 관한 법률 제18조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우</p>
<p>단, 재화 등의 내용이 표시, 광고 내용 또는 계약내용과 다르게 이행된 경우에는, 당해 재화를 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회를 할 수 있습니다.</p>
<h2>제15조 (개인정보보호)</h2>
<p>① 이용자의 정보수집 시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.</p>
<p>가.성명</p>
<p>나.주민등록번호(회원의 경우)</p>
<p>다.주소</p>
<p>라.전화번호 및 이동전화번호</p>
<p>마.희망ID(회원의 경우)</p>
<p>바.비밀번호(회원의 경우)</p>
<p>사.E-mail (회원의 경우)</p>
<p>아.메일수신 여부 (회원의 경우)</p>
<p>② 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.</p>
<p>③ 제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 쇼핑몰이 집니다. 다만, 다음의 경우에는 예외로 합니다.</p>
<p>가.배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우</p>
<p>나.통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우</p>
<p>다.여행 상품 이용 시 여행 상품 제공을 목적으로 해당 기관에 알려주는 경우</p>
<p>라.고객의 제세공과금(원천징수 세금 포함) 관련 해당 기관에 통보하는 경우</p>
<p>마.당사가 제공하는 서비스의 질을 향상시키기 위한 당사의 비즈니스 파트너와의 제휴 서비스, 당사가 운영하는 콜 센터의 텔레 마케팅 서비스(보험, 신용카드 등)를 위하여 최소한의 정보를 이용하는 경우</p>
<p>바.당사의 사후 불만처리 업무 및 고객서비스 업무를 수행하는 제3자에게 최소한의 정보를 제공하는 경우</p>
<p>④ 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공 받는 자, 제공목적 및 제공할 정보의 내용)등 정보통신망이용촉진 등에 관한 법률 제16조제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</p>
<p>⑤ 이용자는 언제든지 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 쇼핑몰은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</p>
<p>⑥ 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</p>
<p>⑦ 쇼핑몰 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다. 단, 쇼핑몰에서 지급된 적립금 및&nbsp;e-cash를 이용과 관련한 개인정보는 관련 회계처리가 모두 종료되는 시점에 파기합니다.</p>
<h2>제16조 (쇼핑몰의 의무)</h2>
<p>①&nbsp; 쇼핑몰은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다.</p>
<p>②&nbsp; 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.</p>
<p>③&nbsp; 상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</p>
<p>④&nbsp; 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</p>
<h2>제17조 ( 회원의 ID 및 비밀번호에 대한 의무)</h2>
<p>①&nbsp; 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.</p>
<p>②&nbsp; 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</p>
<p>③&nbsp; 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 쇼핑몰에 통보하고 안내가 있는 경우에는 그에 따라야 합니다.</p>
<h2>제18조 (이용자의 의무)</h2>
<p>이용자는 다음 행위를 하여서는 안됩니다.</p>
<p>가. 신청 또는 변경 시 허위내용의 등록</p>
<p>나. 쇼핑몰에 게시된 정보의 변경</p>
<p>다. 쇼핑몰이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시</p>
<p>라. 쇼핑몰 또는 기타 제3자의 저작권 등 지적재산권에 대한 침해</p>
<p>마. 쇼핑몰 또는 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</p>
<p>바. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</p>
<h2>제19조 (연결 몰과 피연결 몰 간의 관계)</h2>
<p>①&nbsp; 상위 몰과 하위 몰이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 몰(웹 사이트)이라고 하고 후자를 피연결 몰(웹사이트)이라고 합니다.</p>
<p>②&nbsp; 연결몰은 피연결몰이 독자적으로 제공하는 재화·용역에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결몰의 사이트에서 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.</p>
<h2>제20조 (저작권의 귀속 및 이용제한)</h2>
<p>①&nbsp; 쇼핑몰이 작성한 저작물에 대한 저작권 기타 지적재산권은 쇼핑몰에 귀속합니다.</p>
<p>②&nbsp; 이용자는 쇼핑몰을 이용함으로써 얻은 정보를 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</p>
<h2>제21조 (분쟁해결)</h2>
<p>①&nbsp; 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.</p>
<p>②&nbsp; 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.</p>
<p>③&nbsp; 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의<br>&nbsp;조정에 따를 수 있습니다.</p>
<h2>제22조 (재판권 및 준거법)</h2>
<p>①&nbsp; 이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.</p>
<p>②&nbsp; 이용자간에 제기된 전자거래 소송에는 한국 법을 적용합니다.</p>
<h2>제23조 (e-cash, 적립금 소멸 및 양도)</h2>
<p>①&nbsp; 고객이 회원을 탈퇴한 경우에,&nbsp;e-cash&nbsp;적립금 모두 소멸되며 재 적립되지 않습니다.</p>
<p>②&nbsp;e-cash&nbsp;적립금은 타인에게 양도될 수 없습니다.</p>
</div>

</div>
								</div>
								<div class="itaDim"></div>
							</div>


							<script type="text/javascript">addEvent(window, 'load', function() { resizeImageAll('tbContent'); });</script>
							<input type="checkbox" name="agreeLicensing" value="T" id="join_detailChkBox1" onchange="primemCkBox(this, 'y')"> <label for="join_detailChkBox1">서비스 이용약관 동의<span class="join_Essential">(필수)</span></label>
							<span onclick="openIta(this);" class="viewDetail">내용보기</span>
						</li>

						<li id="tab-2">
							<!-- <iframe src="/html/info_dumy02.asp" frameborder="0" style="width:100%; height:177px; border:1px solid #EEE; background-color:#f9f9f9; overflow:hidden;"></iframe> -->

							<div class="itaBox itaBox2">
								<div class="itaBoxWrap">
									<div class="close-all-menu" onclick="closeIta(this);"><img src="/images/close_2.png" alt="close"></div>
									<div class="itaBoxHead">개인정보 수집 및 이용안내 </div>
									<div class="itaBoxBody">


<style>
.mgt0 {margin-top:0 !important;}
.guide_wrap {margin:20px 0; padding:40px 7%; border:1px solid #e7e7e7; background:#fff; font-size:14px;}
.guide_wrap p {margin:20px 0 0 0; font-size:14px; line-height:18px;}
.guide_wrap ol {margin-top:30px; font-size:14px; line-height:24px;}
.guide_wrap ol li {margin-top:10px; font-weight:bold;}
.guide_wrap h2 {margin-top:50px; font-size:14px; line-height:24px;}
</style>


<div class="guide_wrap">
<p class="mgt0">정보통신부에서 시행하는 정보통신망 이용촉진 등에 관한 법률상의 개인정보 보호제도에 따라 회원들의 개인정보 관리에 만전을 기하고 있으며 회원들이 모든 서비스를 안심하고 이용할수 있도록 하기 위해 항상 최선을 다하고 있습니다.</p>
<p>"데모몰 DEMOMALL" 의 개인정보처리방침은 다음과 같은 내용을 담고 있습니다.</p>
<ol>
<li>가. 수집하는 개인정보 항목 및 수집방법</li>
<li>나. 개인정보의 수집 및 이용목적</li>
<li>다. 수집한 개인정보의 공유 및 제공</li>
<li>라. 개인정보처리 위탁</li>
<li>마. 수집한 개인정보의 보유 및 이용기간</li>
<li>바. 개인정보의 파기절차 및 방법</li>
<li>사. 이용자 및 법정대리인의 권리와 그 행사방법</li>
<li>아. 개인정보 자동 수집 장침의 설치 (운영 및 그 거부에 관한 사항)</li>
<li>자. 개인정보 관리책임자 및 담당자의 소속 (성명 및 연락처)</li>
</ol>
<h2>가. 수집하는 개인정보 항목 및 수집방법</h2>
<p>"데모몰 DEMOMALL"은 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
<p>▶ 이름, 이메일, <!--주민등록번호, -->주소, 연락처, 핸드폰 번호, 월소득, 직업</p>
<p>또한 서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.</p>
<p>▶ 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 이용정지 기록</p>
<p>"데모몰 DEMOMALL"은 다음과 같은 방법으로 개인정보를 수집합니다.</p>
<p>▶ 홈페이지, 서면양식, 전화</p>
<p>- 팩스를 통한 회원가입, 상담 게시판, 경품 행사 응모, 배송 요청</p>
<p>▶ 제휴사로부터의 제공</p>
<p>▶ 생성정보 수집 툴을 통한 수집</p>
<h2>나. 개인정보 수집 및 이용목적</h2>
<p>"데모몰 DEMOMALL" 는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
<p>▶ 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</p>
<p>- 콘텐츠 제공, 물품배송 또는 청구서 등 발송, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금 결재, 요금추심</p>
<p>▶ 회원 관리</p>
<p>- 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달</p>
<p>▶ 마케팅 및 광고에 활용</p>
<p>- 신규 서비스(제품) 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계, 이벤트 등 광고성 정보 전달</p>
<h2>다. 개인정보의 공유 및 제공</h2>
<br>
<p>[제3자 제공 안할 경우]</p>
<p>"데모몰 DEMOMALL"은 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
<p>- 이용자들이 사전에 동의한 경우</p>
<p>- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>
<br>
<p>[제3자 제공할 경우]</p>
<p>"데모몰 DEMOMALL"은 회원에 대하여 보다 더 질 높은 서비스 제공 등을 위해 아래와 같이 귀하의 개인정보를 제공하고 있습니다.</p>
<p>▶ 제공정보의 이용 목적 : 제휴 마케팅</p>
<p>- 제공 정보 : 이름, 이메일, 핸드폰 번호, 주소, 생년월일</p>
<p>- 제공 정보의 보유 및 이용 기간 : 데모몰 DEMOMALL 회원 탈퇴 시까지</p>
<br>
<p>다만, 아래의 경우에는 예외로 합니다.</p>
<p>- 이용자들이 사전에 동의한 경우</p>
<p>- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</p>
<h2>라. 수집한 개인정보 처리 위탁</h2>
<br>
<p>[업무위탁 안 할 경우]</p>
<p>"데모몰 DEMOMALL"은 고객님의 동의 없이 고객님의 개인정보 처리를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.</p>
<br>
<p>[업무위탁 할 경우]</p>
<p>"데모몰 DEMOMALL"은 서비스 이행을 위해 아래와 같이 개인정보 처리 업무를 외부 전문업체에 위탁하여 운영하고 있습니다.</p>
<p>▶ 데모몰 DEMOMALL 컨설팅</p>
<p>- 위탁업무 내용 : 상담업무 효율성 제고를 위한 고객센터 운영</p>
<h2>마. 수집한 개인정보의 보유 및 이용기간</h2>
<p>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
<p>&lt;내부 방침에 의한 정보보유 사유&gt;</p>
<p>▶ 회원 ID</p>
<p>- 보존 이유 : 서비스 이용의 혼선방지</p>
<p>- 보존 기간 : 탈퇴후 6개월</p>
<h2>바. 개인정보 파기절차 및 방법</h2>
<p>"데모몰 DEMOMALL"은 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.</p>
<p>▶ 파기절차</p>
<p>- 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어 집니다.</p>
<p>동 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.</p>
<p>▶ 파기방법</p>
<p>- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고</p>
<p>- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</p>
<h2>사. 이용자 및 법정 대리인의 권리와 그 행사방법</h2>
<p>이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.</p>
<p>이용자 혹은 만 14세 미만 아동의 개인정보 조회</p>
<p>- 수정을 위해서는 ‘개인정보변경’(또는 ‘회원정보수정’ 등)을, 가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.</p>
<p>혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.</p>
<p>귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.</p>
<p>"데모몰 DEMOMALL"은 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “데모몰 DEMOMALL이 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</p>
<h2>아. 개인정보의 자동 수집 장치의 설치</h2>
<p>- 운영 및 그 거부에 관한 사항</p>
<p>"데모몰 DEMOMALL"은 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등 개인정보를 자동으로 수집하는 장치를 설치/운용합니다.</p>
<p>쿠키란 "데모몰 DEMOMALL" 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다</p>
<p>"데모몰 DEMOMALL"은 다음과 같은 목적을 위해 쿠키 등을 사용합니다.</p>
<p>▶ 쿠키 사용 목적</p>
<p>- 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공</p>
<p>귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.</p>
<p>▶ 쿠키 설정 거부 방법</p>
<p>예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.</p>
<p>설정방법 예(인터넷 익스플로어의 경우): 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보</p>
<p>단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</p>
<h2>자. 개인정보 관리 책임자</h2>
<p>"데모몰 DEMOMALL"은 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.</p>
<p>▶ 개인정보관리책임자</p>
<p>성명 : 정지영</p>
<p>전화번호 : 02-866-3255</p>
<p>이메일 : manpul@ncgglobal.co.kr</p>
<p>귀하께서는 “데모몰 DEMOMALL" 의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.</p>
</div>

</div>
									<p class="check_notice">※ 귀하는 ㈜데모몰 DEMOMALL에서 수집하는 개인정보 수집 및 이용에 거부할 권리가 있습니다. 다만, 필수항목 동의를 거부할 경우에는 데모몰 DEMOMALL 회원 서비스 가입 및 이용을 할 수 없습니다.</p>
								</div>
								<div class="itaDim"></div>
							</div>


							<input type="checkbox" name="agree_po" value="T" id="join_detailChkBox2" onchange="primemCkBox(this, 'y')"> <label for="join_detailChkBox2">개인정보 수집 및 이용 동의<span class="join_Essential">(필수)</span></label>
							<span onclick="openIta(this);" class="viewDetail">내용보기</span>
						</li>

						<li id="tab-3">
							<input type="checkbox" name="agree_age" value="T" id="join_detailChkBox3" onchange="primemCkBox(this, 'y')"> <label for="join_detailChkBox3">만 14세 이상입니다.<span class="join_Essential">(필수)</span></label>
						</li>
						
						<li id="tab-4">
							<div class="itaBox itaBox4">
								<div class="itaBoxWrap">
									<div class="close-all-menu" onclick="closeIta(this);"><img src="/images/close_2.png" alt="close"></div>
									<div class="itaBoxHead">이벤트 혜택 등 광고 수신여부 </div>
									<div class="itaBoxBody">

<style>
.mgt0 {margin-top:0 !important;}
.guide_wrap {margin:20px 0; padding:40px 7%; border:1px solid #e7e7e7; background:#fff; font-size:14px;}
.guide_wrap p {margin:20px 0 0 0; font-size:14px; line-height:18px;}
.guide_wrap ol {margin-top:30px; font-size:14px; line-height:24px;}
.guide_wrap ol li {margin-top:10px; font-weight:bold;}
.guide_wrap h2 {margin-top:50px; font-size:14px; line-height:24px;}
</style>

<div class="guide_wrap">
<p class="mgt0">서비스 이용에 있어서 관련 상품 및 서비스의 정보 제공/홍보, 이용권유 활동과 제반 프로모션 이벤트 혜택 정보 제공 등의 목적으로 전화,휴대폰 문자메시지,이메일 등을 이용한 전송 방법을 통해 정보/광고를 전송·제공할 수 있습니다.</p>
<p>본 안내 수신을 원치 않으시는 경우 동의하지 않을 수 있으며, 동의하셨더라도 개인정보 이용 및 보호에 관한 법률에 따라 고객센터를 통해 언제라도 중단요청할 수 있습니다.</p>
<p>다만, 동의하지 않을 경우에는 편의제공 및 사은행사(사은품,할인 등) 안내 등 혜택의 제한이 있을 수 있습니다.</p>
<p>(서비스 변경 안내 등 필수 고지사항은 본 동의 대상에서 제외됩니다.)</p>
</div>

</div>
								</div>
								<div class="itaDim"></div>
							</div>

							<input type="checkbox" name="agree_event_ad" value="T" id="join_detailChkBox4" onchange="primemCkBox(this, 'y')"> <label for="join_detailChkBox4">이벤트 혜택 등 광고 수신여부 (선택)</label>
							<span onclick="openIta(this);" class="viewDetail">내용보기</span>
						</li>
						
					</ul>
				</div> <!-- joinPop_textWrap 끝 -->
			</div> <!-- joinPop_textInfo 끝 -->




<!-- /////////////	이용약관 구조 추가 끝 -->

<script type="text/javascript">
	// 회원가입 팝업창 약관변경
	$(".joinPop_infoTitle li").click(function(){
		var tab_id = $(this).attr("data-tab");

		$(".joinPop_infoTitle li").removeClass("on");
		$(".joinPop_infoCont li").removeClass("on");
		$(".join_detailChkBox > div").removeClass("on");

		$(this).addClass("on");
		$("#"+tab_id).addClass("on");
	});

	function openIta(target){
		var target = $(target).parent().find(".itaBox");

		target.addClass("on");
	}

	function closeIta(target){
		$(target).closest(".itaBox").removeClass("on");
	}

</script>

				
			</ul> <!-- 페이지 전환 div -->


	</form>
	<!-- 약관 끝 -->

	<div class="etc_type">
		<ul class="etc_btn">
			<li class="align_left"><a href="javascript:submitChk(',mobile', ',휴대폰번호');" class="btn_yellow02"> 회원가입</a></li>
			<li class="align_right"><a href="javascript:history.back();" class="btn_gray02">취소</a></li>
		</ul>
	</div>

</div>
<!-- 회원가입 끝 -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<div id="popAddr"></div>


<!-- quick -->
<!--include virtual="/_include/quick.asp"-->
<!-- quick -->

<!-- copyright -->

		</div>
	</div>


<script>
	
</script>

<%@ include file="../includes/footer.jsp" %>




