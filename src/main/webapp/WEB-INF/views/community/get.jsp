<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<div class="community_detail">
		<h1 class="page-header"></h1>
		<table class="tlS1">
			<colgroup>
				<col width="15%">
				<col width="*">
			</colgroup>
			<tr>
				<th>제목</th>
				<td>
					<span class="tit"><c:out value='${vo.TIT}'/></span>
					<span class="cnt">(${vo.VIEW_CNT})</span>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><c:out value='${vo.WRITER}'/></td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td><fmt:formatDate value="${vo.WRT_DATE}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div class="content"><c:out value='${vo.CON}'/></div></td>
			</tr>
			<tr>
				<th>첨부이미지</th>
				<td></td>
			</tr>
		</table>
		
		<form method="get" id="actionForm">
			<input type="hidden" name="POST_SQ" value="${vo.POST_SQ}">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">
			<input type="hidden" name="type" value="${cri.type}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
		</form>
		
		<div class="comment">
			<ul>
<c:forEach items="${cmtvo}" var="list">
				<li>
					<span class="writer">${list.WRITER}</span>
					<span class="content">${list.CON}</span>
					<span class="date"><fmt:formatDate value="${list.WRT_DATE}" pattern="yyyy-MM-dd hh:mm:ss" /></span>
				</li>
</c:forEach>
<c:if test="${cmtvo == '[]'}">
				<li class="empty">
					<p>댓글이 없습니다</p>
				</li>
</c:if>
			</ul>
		</div>
		
		<div class="writeCmt">
			<textarea name="cmtCon"></textarea>
			<a href="javascript:btnWriteCmt()" class="btn03 btnWriteCmt" onkeyup="if(event.keyCode == 32) btnWriteCmt()">확인</a>
		</div>
		
		<div class="btnWrap">
<c:if test="${loginInfo.ID.equals(vo.WRITER)}">
			<a href="#" class="btn03 btnMod">수정/삭제</a>
</c:if>
			<a href="#" class="btn03 bg_gray btnList">목록</a>
		</div>
		
		
	</div>


<script type="text/javascript">
														
	var actionForm = $("#actionForm");
	
	$(document).ready(function(){
		if("${vo.POST_SQ}" === ""){
			actionForm.attr("action","/board/null")
			.submit();
		}
	});

	// 목록으로 이동
	$(".btnList").click(function(e){
		e.preventDefault();
		actionForm.find("input[name='POST_SQ']").attr("disabled","true");
		actionForm.attr("action","/community");
		actionForm.submit();
	});
	
	// 수정/삭제
	$(".btnMod").click(function(e){
		e.preventDefault();
		actionForm.find("input[name='POST_SQ']");
		actionForm.attr("action","/community/modify");
		actionForm.submit();
	});
	
	function btnWriteCmt(){
		
		if ("${loginInfo}" == "") {
			alert("로그인 후 이용해주세요.")
			return;
		}
		
		$.ajax({
			type:"POST",
			url:"/community/comment_write",
			data:JSON.stringify({
				"POST_SQ": "${vo.POST_SQ}",
				"MEMBER_SQ": "${loginInfo.MEMBER_SQ}",
				"CON": $("textarea[name='cmtCon']").val()
			}),
			async:false,
			contentType: "application/json; charset-utf-8",
			success:function(data){
				//console.log(data);
				
				if(data == 1){
					location.href = "";
				}else{
					alert("댓글 작성 실패");
				}
			},
			error:function(a,b,c){
				console.log(a,b,c);
			}
		});
	}
	
	
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>




