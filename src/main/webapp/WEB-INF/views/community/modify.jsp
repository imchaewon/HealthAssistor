<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<form>
	<input type="hidden" name="POST_SQ" value="${vo.POST_SQ}">
	<input type="hidden" name="MEMBER_SQ" value="${loginInfo.MEMBER_SQ}">
	<input type="hidden" name="pageNum" value="${cri.pageNum}">
	<input type="hidden" name="amount" value="${cri.amount}">
	<input type="hidden" name="type" value="${cri.type}">
	<input type="hidden" name="keyword" value="${cri.keyword}">
	
	
<div class="community_detail">
	<h1 class="page-header"></h1>
	<table class="tlS1">
		<colgroup>
			<col width="15%">
			<col width="*">
		</colgroup>
		<tr>
			<th>제목</th>
			<td><input type="text" name="TIT" value="<c:out value='${vo.TIT}'/>" style="width:100%"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="form-control" rows="3" name="CON"><c:out value='${vo.CON}'/></textarea></td>
		</tr>
		<tr>
			<th>첨부이미지</th>
			<td></td>
		</tr>
	</table>
	
	<div class="btnWrap">
		<a href="#" class="btn03" data-oper="modify">수정</a>
		<a href="#" class="btn03" data-oper="remove">삭제</a>
		<a href="#" class="btn03 bg_gray" data-oper="list">목록으로</a>
	</div>
	

</div>


                      
</form>


<script>
	var form = $("form");

	$(document).ready(function(){
		if("${vo.POST_SQ}" === ""){
			form.attr("action","/community/null")
			.attr("method","GET")
			.submit();
		}
	});

	$(".btnWrap a").on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");	
//		console.log(operation);
		
		if(operation === "list"){
			form.attr("method","GET")
			form.attr("action","/community")
			form.find("input[name='POST_SQ']").remove();
			form.find("input[name='TIT']").remove();
			form.find("textarea[name='CON']").remove();
//			form.find("input[name='WRITER']").remove();
			form.submit();
		}else if(operation === "modify"){
			form.attr("method","POST")
			.attr("action","/community/modify")
			.submit();
		}else if(operation === "remove"){
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type:"POST",
					url:"/community/remove/", //필수:: 응답 프로그램 주소(acrion)
					data:form.serialize(),
					async:false, //선택:: true(동기) or false(비동기) (기본값:false)
	 				success:function(result){ //선택:: 돌려받는 데이터가 있을때만 구현
						//console.log(result);
						location.replace("/community?pageNum=" + $("input[name='pageNum']").val() +
								"&amount=" + $("input[name='amount']").val() +
								"&type=" + $("input[name='type']").val() +
								"&keyword=" + $("input[name='keyword']").val() +
								"&POST_SQ=" + $("input[name='POST_SQ']").val() +
								"&modType=" + "r"
						);
					},
					error:function(a,b,c){//선택:: 예외처리 이벤트(catch절)
						console.log(a,b,c);
					}
				});
			
				/*form.attr("method","POST")
				.attr("action","/board/remove")
				.submit();*/
			}
		}
		
		
		
	})
</script>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>




