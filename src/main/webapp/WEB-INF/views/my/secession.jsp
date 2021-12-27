<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<style type="text/css">
	.mainTxt{font-size: 22px;font-weight: bold;text-align: center;color: #333;line-height: 40px}
</style>


<form method="post" action="config_site_ok.do" name="Frm">


<div class="sub_content">

<%@ include file="/WEB-INF/views/includes/my_left.jsp" %>

	<div class="conWrap">
		
		<p class="titleS2">회원탈퇴</p>
		
		<div class="mainTxt">등록된 모든 정보가 삭제됩니다.<br>정말 탈퇴하시겠습니까?</div>
		
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




