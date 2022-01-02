<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<form method="post" action="/community/register_ok">

<input type="hidden" name="MEMBER_SQ" value="${loginInfo.MEMBER_SQ}">


<div class="community_detail">
	<h1 class="page-header"></h1>
	<table class="tlS1">
		<colgroup>
			<col width="15%">
			<col width="*">
		</colgroup>
		<tr>
			<th>제목</th>
			<td><input type="text" name="TIT" value="" style="width:100%" placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="CON" rows="3" placeholder="내용을 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<th>첨부이미지</th>
			<td></td>
		</tr>
	</table>
	

	<div class="btnWrap">
		<a href="#" id="write" class="btn03">등록</a>
		<a href="javascript:history.go(-1)" class="btn03 bg_gray">취소</a>
	</div>

</div>


</form>


<script>
	
	var sw = false; //뒤로가기 도배 방지
	
	function isNull(e){
		return e.val() === null || e.val() === "";
	}
	
	var form = $("form");
	
	form.find("#write").on("click",function(e){
		e.preventDefault();
		
		if(sw)
			return;
		
		var title = $("input[name='TIT']");
		var content = $("textarea[name='CON']");
		var writer = $("input[name='WRITER']");
		
		if(isNull(title)){
			alert("제목을 입력하십시오.");
			title.focus();
			return;
		};
		
		if(isNull(content)){
			alert("내용을 입력하십시오.");
			content.focus();
			return;
		};
		
		sw = true;
		
		form.submit();
		
	});
	
	
	window.onpageshow = function (event){
		if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
			//window.location.reload(); //새로고침
		}
	}
</script>
			

<%@include file="/WEB-INF/views/includes/footer.jsp"%>




