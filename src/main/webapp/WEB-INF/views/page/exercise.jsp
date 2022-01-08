<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<form method="get" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name="type" value="${pageMaker.cri.type}"> <!-- 종류 -->
	<input type="hidden" name="type2" value="${pageMaker.cri.type2}"> <!-- 부위 -->
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
</form>

<form method="get" id="searchForm">
	<input type="hidden" name="type"> <!-- 종류 -->
	<input type="hidden" name="type2"> <!-- 부위 -->
	<input type="hidden" name="sword">
</form>

<div class="recom_exr">

	<div class="titleS3"><a href="exercise">운동 추천</a></div>

	<div class="view_type_box">
		<p id="kind" class="total_cont">
			<a href="/exercise" class="all"><span>전체운동</span></a>
			<a href="/exercise?type=E" class="equip"><span>기구운동</span></a>
			<a href="/exercise?type=P" class="physic"><span>맨몸운동</span></a>
		</p>
	
		<div class="search">
			<input type="text" name="sword" class="text" placeholder="" value="">
			<div onclick="search()" class="search_btn"><span class="iconfont ftic-search"></span></div>
		</div>
	
		<!-- 셀렉트 -->
		<div class="select_option">
			<!-- 체크된 내용 -->
			<div class="active_cont">
				<span class="txt">운동 부위</span>
			</div>
			<!-- 체크된 내용 끝 -->
			<!-- 셀렉트 리스트 -->
			<ul class="option_list" id="partSel">
			<c:forEach items="${partList}" var="item">
				<li data-value="${item.CODE}">
					<span class="txt">${item.NAME}</span>
				</li>
			</c:forEach>
			</ul>
			<!-- 셀렉트 리스트 끝 -->
		</div>
		<!-- 셀렉트 끝 -->
	</div>

	<div class="exrList">
		<ul>
		<c:forEach var="item" items="${list}">
			<li>
				<div class="liWrap">
					<div class="tit">${item.NAME}</div>
					<div class="groupWrap">
						<span class="kind">${item.KIND == "E" ? "기구" : "맨몸"}</span>
						<span class="part">
						<c:forEach var="part" items="${item.PART_LIST}">
							<span>${part}</span>
						</c:forEach>
						</span>
					</div>
					<div class="txt">${item.EXP}</div>
					<!-- <div class="botWrap">
						달력에추가?
					</div> -->
				</div>
			</li>
		</c:forEach>
		</ul>
	</div>

	<div class="paging">
<c:if test="${pageMaker.prev}">
		<a href="javascript:" class="prev" data-link="${pageMaker.startPage - 1}">Previous</a>
</c:if>
<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		<a href="javascript:" class="bullet${pageMaker.cri.pageNum == num ? ' on' : ''}" data-link="${num}">${num}</a>
</c:forEach>
<c:if test="${pageMaker.next}">
		<a href="javascript:" class="next" data-link="${pageMaker.endPage + 1}">Next</a>
</c:if>
	</div>


</div>


<script>

$(document).ready(function(){
	resetSelectEvent();
	
	const url = new URL(window.location.href);
	const urlParams = url.searchParams;
	if(urlParams.get('type') == "E"){
		$("#kind .equip").addClass("on");
	}else if(urlParams.get('type') == "P"){
		$("#kind .physic").addClass("on");
	}else{
		$("#kind .all").addClass("on");
	}
});
	
// 페이징
$(".paging a").on("click",function(e){
	e.preventDefault();
	
	var f = $("#actionForm");
	
	var targetPage = $(this).data("link");
	
	f.attr("action","/exercise");
	f.find("input[name='pageNum']").val(targetPage);
	
	f.submit();
});

$("#partSel li").on("click",function(){
	var f = $("#actionForm");
	
	f.type2 = $(this).data("value");
	
	f.submit();
});

// 검색
/* function search(){
	var f = $("#searchForm")
	
	f.sword = ;
	
} */

	
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>




