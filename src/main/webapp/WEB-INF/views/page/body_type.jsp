<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>

</style>


	<div class="body_type">
		<h1>내 체형 알아보기</h1>
		※ 인바디 정보로 계산된 평균체중과 내 체형에 맞는 식단/운동법을 확인하실수 있습니다
		
		<ul>
			<li>
				<dl>
					<dt>신장</dt>
					<dd><input type="text" name="cm">cm</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>체중</dt>
					<dd><input type="text" name="cm">kg</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>체지방률</dt>
					<dd><input type="text" name="BF">%</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>골격근량</dt>
					<dd><input type="text" name="SMM">kg</dd>
				</dl>
			</li>
		</ul>
		
		<a href="javascript:complete()">체형 확인하기</a>
		
		<div class="ani">
			<p>.</p>
			<p>.</p>
			<p>.</p>			
		</div>
		
		<div id="result">
		</div>
		
		
	</div>


<script>

function complete(){
	
	
	
	$.ajax({
		type:"POST",
		url:"/abcd",
		data:$(f).serialize(),
		async:false,
		success:function(data){
			console.log(data);
			
			$("#result").html(
				<div class="tit">
		
				</div>
				<div class="con">
					
				</div>
			)
		},
		error:function(a,b,c){
			console.log(a,b,c);
		}
	});

}
	
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>




