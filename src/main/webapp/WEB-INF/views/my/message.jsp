<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<style type="text/css">

</style>


<div class="sub_content">



<%@ include file="/WEB-INF/views/includes/my_left.jsp" %>
<form method="post" action="config_site_ok.do" name="Frm">


<div class="conWrap">
	<h1 class="titleS1">받은 쪽지</h1>
	
	<div class="subTitleS1">
		<b style="color:steelblue;vertical-align:middle"><fmt:formatNumber value="${pageMaker.total}" pattern="#,###" /></b>개의 게시글이 있습니다
	</div>
	
	
	<table class="tlS2">
		<colgroup>
			<col width="60">
			<col width="60">
			<col width="220">
			<col width="*">
			<col width="120">
		</colgroup>
		
		<tr align="center">
			<th><label><input type="checkbox" name="cbListAll" onclick="checkCbListAll()"><span></span></label></th>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		
		<tr>
			<td><label><input type="checkbox" name="cbListAll" onclick="checkCbListAll()"><span></span></label></td> <!-- 아이디 -->
			<td>14</td>
			<td>제목</td>
			<td>내용</td>
			<td>2021-12-27</td>
		</tr>
		
	</table>
	
	
	<div class="paging">
		<a href="#" class="sitebg2">1</a>
		<a href="#" class="page_select">2</a>
		<a href="#" class="page_select">3</a>
		<a href="#" class="page_select">4</a>
		<a href="#" class="page_select">5</a>
	</div>
	
	
	<div class="mgt20 btnWrap">
		<a href="javascript:submitChk()" class="btn03" style="margin-right:10px;" onkeyup="if(event.keyCode == 32) submitChk()">확인</a>
		<a href="javascript:history.go(-1)" class="btn03 bg_gray">취소</a>
	</div>
	
	
</div>

</form>


</div>




<script type="text/javascript">

</script>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>




