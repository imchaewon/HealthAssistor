<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<style type="text/css">
	.conWrap ul{width:500px;margin:auto;}
	.conWrap li{list-style:none;}
	.conWrap input.text{width:100%;height: 55px;padding: 0 20px;margin-left: 5px;color: #92979b;font-weight: bold;line-height: 50px;margin:0;}
	.conWrap .notif{padding:5px 5px 15px;margin:0;}
	.conWrap .btnWrap{width: 500px;text-align: right;margin: auto}
</style>


<form method="post" action="config_site_ok.do" name="Frm">


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
			<a href="javascript:window.close()" class="btn03 bg_gray">취소</a>
		</div>
		
		
	</div>

</div>

</form>


<script type="text/javascript">

</script>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>




