<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<style>
	.member_wrap .find_cont .form_list > li{width:594px;margin:5px auto 0;}
	
	#resultList{margin-top:20px;overflow:hidden;}
	
	.select_option,
	#PW_FIND_A{box-sizing:content-box;}
	
</style>

<form name="Frm" method="post" action="/member/find_pw_ok" target="popup">

	<div class="member_wrap">
	
		<h1 class="title"><i class="iconfont ftic-id"></i> 아이디/비밀번호 찾기</h1>
	
		<div class="tab03">
			<a href="./find_id">아이디 찾기</a>
			<a href="./find_pw" class="on">비밀번호 찾기</a>
		</div>
		<div class="find_cont">

			<input type="hidden" name="PW_QUESTION_SQ" id="PW_QUESTION_SQ">
			
			<ul class="form_list">
				<li class="mgt20">
					<input type="text" name="ID" id="ID" class="text" placeholder="아이디를 입력해 주세요."  onkeyup="chkEng_N_Num(event)" maxlength="25" style="width:100%">
				</li>
				<li style="display:flex;justify-content:space-between">
					<!-- 셀렉트 -->
					<div class="select_option" style="width:230px">
						<!-- 체크된 내용 -->
						<div class="active_cont">
							<span class="txt">비밀번호 찾기 질문</span>
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
					<input name="PW_FIND_A" id="PW_FIND_A" class="text" type="text" maxlength="10" placeholder="비밀번호 찾기  답" style="width:calc(100% - 240px)" value="">
					
					<div class="resultBox">
					</div>
					
					<!-- 셀렉트 끝 -->
				</li>
	
			</ul>
			
			
			<div class="al-c mgt20">
				<a href="javascript:complete()" class="btn03" style="margin-right:10px;">확인</a>
				<a href="javascript:history.go(-1);" class="btn03 bg_gray">취소</a>
			</div>
			
		</div>
	
	</div>


</form>


<script>
	
	$(document).ready(function(){
		resetSelectEvent();
		
		$("#pwq li").click(function(){
			$("#PW_QUESTION_SQ").val($(this).data("value"));
		});
	});
	
	
	function complete(){
		var f = document.Frm;

		if (chkEmpty(f.ID)) {
			alert("아이디를 입력해 주세요.");
			f.ID.focus();
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

		var popWidth = 600;
		var popHeight = 350;
		var popLeft = (screen.availWidth - popWidth) / 2;
		var popTop = (screen.availHeight - popHeight) / 2;
		window.open("", "popup", "width=" + popWidth + ", height=" + popHeight + ", left=" + popLeft + ", top=" + popTop);
		
		f.submit();
		
	}
	
	
	
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>




