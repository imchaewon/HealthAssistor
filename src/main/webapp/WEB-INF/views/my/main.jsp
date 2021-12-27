<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<style type="text/css">

</style>


<div class="sub_content">

<%@ include file="/WEB-INF/views/includes/my_left.jsp" %>



<div class="conWrap">
	<h1 class="titleS1">내 정보 추가/수정</h1>
	
	<form method="post" action="config_site_ok.do" name="Frm">
	
	<table class="tlS1 cbrdS1 mgt20">
		<tr>
			<th width="20%" align="center">아이디</th>
			<td width="30%">
				<input type="text" name="ID" class="box" value="${loginInfo.ID}" style="width:140px;" maxlength="12">
			</td>
			<th width="20%" align="center">비밀번호</th>
			<td width="30%">
				<input type="PW" name="pw" class="box" value="" style="width:80px;" maxlength="12">
			</td>
		</tr>
		<tr>
			<th align="center">생년월일</th>
			<td colspan="3">
				<input type="text" name="birthYear" class="box" size="4" value="${loginInfo.BIRTH.substring(0,2)>30?19+=loginInfo.BIRTH.substring(0,2):20+=loginInfo.BIRTH.substring(0,2)}" readonly>년&nbsp;&nbsp;&nbsp;
				<input type="text" name="birthMonth" class="box" size="2" value="${loginInfo.BIRTH.substring(2,4)}" readonly>월&nbsp;&nbsp;&nbsp;
				<input type="text" name="birthDay" class="box" size="2" value="${loginInfo.BIRTH.substring(4,6)}" readonly>일&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<th align="center">신장</th>
			<td colspan="3">
				<input type="text" name="HGHT" class="box" value="${loginInfo.HGHT}" size="4" maxlength="3">cm
			</td>
		</tr>
		<tr>
			<th align="center">체중</th>
			<td colspan="3">
				<input type="text" name="WGHT" class="box" value="${loginInfo.WGHT}" size="4" maxlength="3">kg
			</td>
		</tr>
		<tr>
			<th align="center">성별</th>
			<td colspan="3">
				<label><input name="GENDER" type="radio" value="M"><span></span>남자</label>
				<label><input name="GENDER" type="radio" value="F"><span></span>여자</label>
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
	</table>
	
	<div class="mgt20 btnWrap">
		<a href="javascript:submitChk()" class="btn03" style="margin-right:10px;" onkeyup="if(event.keyCode == 32) submitChk()">확인</a>
		<a href="javascript:window.close()" class="btn03 bg_gray">취소</a>
	</div>
	
	</form>
	
</div>

</div>


<script type="text/javascript">
	
	$("input[name=GENDER]").each(function(){
		$(this).prop("checked",true)
	})
	$("input[name=AMR]").eq(0).prop("checked",true);
	
	
	
</script>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>





