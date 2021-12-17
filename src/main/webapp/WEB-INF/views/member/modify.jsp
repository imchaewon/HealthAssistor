<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify/Delete</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Modify/Delete
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                            <form>
                            
							<div class="form-group">
								<label>BNO</label>
								<input class="form-control" name="bno" value="<c:out value='${vo.bno}'/>" readonly>
							</div>
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name="title" value="<c:out value='${vo.title}'/>">
							</div>
							<div class="form-group">
								<label>Content</label>
								<textarea class="form-control" rows="3" name="content"><c:out value='${vo.content}'/></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label>
								<input class="form-control" name="writer" value="<c:out value='${vo.writer}'/>">
							</div>
							
							<button class="btn btn-default" data-oper="modify">Modify</button>
							<button class="btn btn-danger" data-oper="remove">Remove</button>
							<button class="btn btn-info" data-oper="list">List</button>
							
							<input type="hidden" name="pageNum" value="${cri.pageNum}">
							<input type="hidden" name="amount" value="${cri.amount}">
							<input type="hidden" name="type" value="${cri.type}">
							<input type="hidden" name="keyword" value="${cri.keyword}">
                            
                            </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
<script>
	var form = $("form");

	$(document).ready(function(){
		if("${vo.bno}" === ""){
			form.attr("action","/board/null")
			.attr("method","GET")
			.submit();
		}
	});

	$(".btn").on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");	
//		console.log(operation);
		
		if(operation === "list"){
			form.attr("method","GET")
			form.attr("action","/board/list")
			form.find("input[name='bno']").remove();
			form.find("input[name='title']").remove();
			form.find("textarea[name='content']").remove();
			form.find("input[name='writer']").remove();
			form.submit();
		}else if(operation === "modify"){
			form.attr("method","POST")
			.attr("action","/board/modify")
			.submit();
		}else if(operation === "remove"){
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type:"POST",
					url:"/board/remove/", //필수:: 응답 프로그램 주소(acrion)
					data:form.serialize(),
					async:false, //선택:: true(동기) or false(비동기) (기본값:false)
	 				success:function(result){ //선택:: 돌려받는 데이터가 있을때만 구현
						//console.log(result);
						location.replace("/board/list?pageNum=" + $("input[name='pageNum']").val() +
								"&amount=" + $("input[name='amount']").val() +
								"&type=" + $("input[name='type']").val() +
								"&keyword=" + $("input[name='keyword']").val() +
								"&bno=" + $("input[name='bno']").val() +
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


<%@ include file="../includes/footer.jsp" %>




