<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">member Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            member Read
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
							<div class="form-group">
								<label>BNO</label>
								<input class="form-control" name="bno" value="<c:out value='${vo.bno}'/>" readonly>
							</div>
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name="title" value="<c:out value='${vo.title}'/>" readonly>
							</div>
							<div class="form-group">
								<label>Content</label>
								<textarea class="form-control" rows="3" name="content" readonly><c:out value='${vo.content}'/></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label>
								<input class="form-control" name="writer" readonly value="<c:out value='${vo.writer}'/>">
							</div>
							
							<form method="get" id="actionForm">
								<input type="hidden" name="bno" value="${vo.bno}">
								<input type="hidden" name="pageNum" value="${cri.pageNum}">
								<input type="hidden" name="amount" value="${cri.amount}">
								<input type="hidden" name="type" value="${cri.type}">
								<input type="hidden" name="keyword" value="${cri.keyword}">
							</form>
							
							<a href="javascript:;" class="btn btn-default btnList">목록</a>
							<a href="javascript:;" class="btn btn-default btnMod">수정/삭제</a>
                            
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->


<script type="text/javascript">
                                                        
	var actionForm = $("#actionForm");
	
	$(document).ready(function(){
		if("${vo.bno}" === ""){
			actionForm.attr("action","/member/null")
			.submit();
		}
	});
	
	$(".btnList").click(function(e){
		e.preventDefault();
		actionForm.find("input[name='bno']").attr("disabled","true");
		actionForm.attr("action","/member/list");
		actionForm.submit();
	});
	
	$(".btnMod").click(function(e){
		e.preventDefault();
		actionForm.find("input[name='bno']").removeAttr("disabled");
		actionForm.attr("action","/member/modify");
		actionForm.submit();
	});
	
	
</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>




