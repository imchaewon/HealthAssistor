<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<div class="community">

	<h1 class="titleS3">커뮤니티</h1>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<b><fmt:formatNumber value="${pageMaker.total}" pattern="#,###" /></b>
			<span>건의 게시글이 있습니다</span>
		</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<table class="table table-striped">
				<colgroup>
					<col width="10%">
					<col width="50%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
<c:forEach items="${list}" var="vo">
					<tr class="odd gradeX">
						<td>${vo.POST_SQ}</td>
						<td class="tit"><a href="#">${vo.TIT}(${vo.COMMENT_CNT})</a></td>
						<td>${vo.WRITER}</td>
						<td><fmt:formatDate value="${vo.WRT_DATE}" pattern="yyyy-MM-dd" /></td>
						<td>${vo.VIEW_CNT}</td>
					</tr>
</c:forEach>
				</tbody>
			</table>
			<!-- /.table-responsive -->
			
			
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

			
			<div class="wrap">
				<form method="get" action="/community" id="searchForm">
					<select name="type">
						<%-- <option value="" ${pageMaker.cri.type == null ? "selected" : ""}>---</option> --%>
						<option value="T" ${pageMaker.cri.type eq 'T' ? "selected" : ""}>제목</option>
						<option value="C" ${pageMaker.cri.type eq 'C' ? "selected" : ""}>내용</option>
						<option value="W" ${pageMaker.cri.type eq 'W' ? "selected" : ""}>작성자</option>
						<option value="TC" ${pageMaker.cri.type eq 'TC' ? "selected" : ""}>제목+내용</option>
						<option value="TCW" ${pageMaker.cri.type eq 'TCW' ? "selected" : ""}>제목+내용+작성자</option>
					</select>
					<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<button class="btn03 btn_gray">검색</button>
				</form>
				
				<a href="javascript:write()" class="btn03 btnReg">글쓰기</a>
			</div>
			
			
			
			<form method="get" id="actionForm">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
			
		</div>
		<!-- /.panel-body -->
	</div>
	
	<div class="modal" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<div class="modal-body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn04" data-dismiss="modal">확인</button>
				<button type="button" class="btn04 bg_gray" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


</div>


<script>

$(window).on("load",function(){
	var result = "<c:out value='${result}'/>";
	var type = "<c:out value='${modType}'/>";
	
	/* 알림 모달창 */
	const url = new URL(window.location.href); // url객체 가져오기
	const urlParams = url.searchParams; // url객체에서 파라미터객체 가져오기
	
	if(urlParams.has('POST_SQ')) 
		result = urlParams.get('POST_SQ');
	if(urlParams.has('modType'))
		type = urlParams.get('modType');
		
	checkModal(result, type);
	
	history.replaceState({}, null, null);
});



(function(){

var actionForm = $("#actionForm");

// 페이징
$(".paging a").on("click",function(e){
	e.preventDefault();
	
	var targetPage = $(this).data("link");
	
	actionForm.attr("action","/community");
	actionForm.find("input[name='pageNum']").val(targetPage);
	
	actionForm.submit();
	
});

// 글 클릭시 해당 글로 이동
$(".tit a").on("click",function(e){
	e.preventDefault();
	
	var num = $(this).parent().prev();
	
	actionForm.find("input[name='POST_SQ']").remove(); // 뒤로가기시 안남아있도록
	actionForm.append("<input type='hidden' name='POST_SQ' value='" + num.text() + "'>") // 이동할 페이지값을 폼전송시 같이 전송시키기
	actionForm.attr("action","/community/get");
	
	actionForm.submit();
});

})();


// 글 검색
var searchForm = $("#searchForm");
searchForm.find("button").on("click",function(e){
	e.preventDefault();
	
	/*if(searchForm.find("select[name='type']").val() === "" && 
		searchForm.find("input[name='keyword']").val() !== "") {
		alert("검색 항목을 선택하세요.");
		return;
	}*/
	if(searchForm.find("input[name='keyword']").val() === "" &&
		searchForm.find("select[name='type']").val() !== "") {
		//alert("검색어를 입력하세요.");
		
		//검색어가 비어있으면 검색조건 제거
		searchForm[0].type.value = "";
		
	}
	
	searchForm.find("input[name='pageNum']").val(1); //검색시 1페이지로 이동
	
	searchForm.submit();
});



function checkModal(result, type){
	
	if(history.state){
		return;
	}
	
	if (parseInt(result) > 0) {
		if (type === ""){
			//$(".modal-body").html(result + "번 게시글이 등록되었습니다.")
			return;
		}else if (type === "r") {
			$(".modal-body").html(result + "번 게시글이 삭제되었습니다.")
		}else if (type === "m") {
			$(".modal-body").html(result + "번 게시글이 수정되었습니다.")
		}
		
		$("#myModal").modal("show");
	}
	
}

function write(){
	/* if ("${loginInfo.ID}" == "") {
		location.href = "/member/login";
		return;
	} */
	location.href = "/community/register";
}








</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>




