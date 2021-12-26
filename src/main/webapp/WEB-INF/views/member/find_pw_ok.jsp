<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/popup_header.jsp"%>


<style>
	body{min-height:auto;}
	.title{font-size: 22px;text-align: center;margin: 35px 0 25px;}
	.title.noInfo{margin:0;display:flex;justify-content:center;align-items:center;position:absolute;left:0;right:0;top:0;bottom:0;text-indent:-9999px;}
	.title.noInfo:before{content:"일치하는 정보가 없습니다.";text-indent:0;}
	ul{padding:0 40px;}
	li{list-style:none;}
	.box input{width:100%;height: 55px;padding: 0 20px;margin-left: 5px;color: #92979b;font-weight: bold;line-height: 50px;margin:0;}
	.box .notif{padding:5px 5px 15px;margin:0;}
	
</style>

<div class="box">
<c:if test="${ID != null}">
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
		<a href="javascript:complete()" class="btn03" style="margin-right:10px;">확인</a>
		<a href="javascript:window.close()" class="btn03 bg_gray">취소</a>
	</div>
</c:if>
<c:if test="${ID == null}">
	<p class="title noInfo">일치하는 정보가 없습니다.</p>
</c:if>
</div>


<script>
	
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>




