<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="../includes/header.jsp" %>

	<h2 style="padding:20px 0">잘못된 경로입니다. 목록으로 이동합니다...</h2>
	
	<script>
		$(document).ready(function(){
			setTimeout(function(){
				var url = "/board/list?pageNum=${cri.pageNum}" +
					"&amount=${cri.amount}" +
					"&type=${cri.type}" +
					"&keyword=${cri.keyword}";
				location.replace(url);
			},100);
		});
	</script>


<%@ include file="../includes/footer.jsp" %>




