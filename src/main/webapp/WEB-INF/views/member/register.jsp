<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Register
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
						<form method="post" action="/board/register_ok">
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name="title">
							</div>
							<div class="form-group">
								<label>Content</label>
								<textarea class="form-control" rows="3" name="content"></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label>
								<input class="form-control" name="writer">
							</div>
							
							<button type="button" id="write" class="btn btn-default">Submit Button</button>
							<button type="reset" class="btn btn-default">Reset Button</button>
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
			
			var sw = false; //뒤로가기 도배 방지
			
			function isNull(e){
				return e.val() === null || e.val() === "";
			}
			
			var form = $("form");
			
			form.find("#write").on("click",function(e){
				e.preventDefault();
				
				if(sw)
					return;
				
				var title = $("input[name='title']");
				var content = $("textarea[name='content']");
				var writer = $("input[name='writer']");
				
				if(isNull(title)){
					alert("제목을 입력하십시오.");
					title.focus();
					return;
				};
				
				if(isNull(content)){
					alert("내용을 입력하십시오.");
					content.focus();
					return;
				};
				
				if(isNull(writer)){
					alert("작성자를 입력하십시오.");
					writer.focus();
					return;
				};
				
				sw = true;
				
				form.submit();
				
			});
			
			
			window.onpageshow = function (event){
				if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
//					window.location.reload(); //새로고침
				}
			}
			</script>
            

<%@ include file="../includes/footer.jsp" %>




