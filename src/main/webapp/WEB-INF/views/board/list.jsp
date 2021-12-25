<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="display:flex;justify-content:space-between;align-items:center">
							<p><b style="color:steelblue;vertical-align:middle"><fmt:formatNumber value="${pageMaker.total}" pattern="#,###" /></b>건의 게시글이 있습니다</p>
                            <button type="submit" id="btnReg" class="btn btn-primary">글쓰기</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>BNO</th>
                                        <th>Title</th>
                                        <th>Writer</th>
                                        <th>RegDate</th>
                                        <th>UpdateDate</th>
                                    </tr>
                                </thead>
                                <tbody>
<c:forEach items="${list}" var="vo">
                                    <tr class="odd gradeX">
                                        <td>${vo.bno}</td>
                                        <td><a href="${vo.bno}" class="move">${vo.title}</a></td>
                                        <td>${vo.writer}</td>
                                        <td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" /></td>
                                        <td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy-MM-dd" /></td>
                                    </tr>
</c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
							<form method="get" action="/board/list" id="searchForm">
								<select name="type">
									<option value="" ${pageMaker.cri.type == null ? "selected" : ""}>---</option>
									<option value="T" ${pageMaker.cri.type eq 'T' ? "selected" : ""}>제목</option>
									<option value="C" ${pageMaker.cri.type eq 'C' ? "selected" : ""}>내용</option>
									<option value="W" ${pageMaker.cri.type eq 'W' ? "selected" : ""}>작성자</option>
									<option value="TC" ${pageMaker.cri.type eq 'TC' ? "selected" : ""}>제목+내용</option>
									<option value="TCW" ${pageMaker.cri.type eq 'TCW' ? "selected" : ""}>제목+내용+작성자</option>
								</select>
								<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								<button class="btn btn-default">Search</button>
							</form>
                            
                            <div class="pull-right">
                            	<ul class="pagination">
<c:if test="${pageMaker.prev}">
                            		<li class="page-item"><a class="page-link" href="${pageMaker.startPage - 1}">Previous</a></li>
</c:if>
<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            		<li class="page-item${pageMaker.cri.pageNum == num ? ' active' : ''}"><a class="page-link" href="${num}">${num}</a></li>
</c:forEach>
<c:if test="${pageMaker.next}">
									<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}">Next</a></li>
</c:if>
                            	</ul>
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
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

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
        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<script>
	$(window).on("load",function(){
		//ajax로 처리하기위한 코드
		const url = new URL(window.location.href);
		const urlParams = url.searchParams;
		
		var result = "<c:out value='${result}'/>";
		var type = "<c:out value='${modType}'/>";
		
		//ajax로 처리하기위한 코드
		if(urlParams.has('bno')) 
			result = urlParams.get('bno');
		if(urlParams.has('modType'))
			type = urlParams.get('modType');
			
		checkModal(result, type);
		
		history.replaceState({}, null, null);
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
	
	$("#btnReg").click(function(){
		location.href = "register";
	});
	
	var actionForm = $("#actionForm");
	
	$(".pagination a").on("click",function(e){
		e.preventDefault();
		
		var targetPage = $(this).attr("href");
		
		actionForm.attr("action","/board/list");
		actionForm.find("input[name='pageNum']").val(targetPage);
		
		actionForm.submit();
		
	});
	
	$(".move").on("click",function(e){
		e.preventDefault();
		
		var targetBno = $(this).attr("href");
		
		actionForm.find("input[name='bno']").remove();
		actionForm.append("<input type='hidden' name='bno' value='" + targetBno + "'>")
		actionForm.attr("action","/board/get");
		
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm");
	searchForm.find("button").on("click",function(e){
		e.preventDefault();
		
		if (searchForm.find("select[name='type']").val() === "" && 
				searchForm.find("input[name='keyword']").val() !== "") {
			alert("검색 항목을 선택하세요.");
			return;
		}
		if (searchForm.find("input[name='keyword']").val() === "" &&
				searchForm.find("select[name='type']").val() !== "") {
			alert("검색어를 입력하세요.");
			return;
		}
		
		searchForm.find("input[name='pageNum']").val(1); //검색시 1페이지로 이동
		
		searchForm.submit();
	});
	
	
	
	
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>




