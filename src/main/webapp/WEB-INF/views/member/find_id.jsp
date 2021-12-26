<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<%
	java.util.Calendar now = java.util.Calendar.getInstance();
	int nowYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
%>

<style>
	.member_wrap .find_cont .form_list > li{width:594px;margin:auto;}
	
	#resultList{margin-top:20px;overflow:hidden;}
	#resultList li{font-size:0;text-align:center;padding:5px 0;}
	#resultList li.tit{border-bottom:1px dashed #666;margin-bottom:10px;}
	#resultList li.noData span:before{display:none;}
	#resultList li p{font-size:16px;}
	#resultList li span{display:inline-block;font-size:14px;position:relative;}
	#resultList li span:before{content: "";position: absolute;left: -1px;border-left: 1px solid #666;top: -26px;bottom: 0}
	#resultList li .num{width:20%;}
	#resultList li .id{width:40%;}
	#resultList li .date{width:40%;}
	
</style>

	<div class="member_wrap">
	
		<h1 class="title"><i class="iconfont ftic-id"></i> 아이디/비밀번호 찾기</h1>
	
		<div class="tab03">
			<a href="./find_id" class="on">아이디 찾기</a>
			<a href="./find_pw">비밀번호 찾기</a>
		</div>
		<div class="find_cont">
			<ul class="form_list">
				<li class="mgt20">
					<p>생년월일을 입력해 주세요.</p>
					<!-- 셀렉트 -->
					<div class="select_option" style="width:222px;">
						<!-- 체크된 내용 -->
						<div class="active_cont">
							<span class="txt">생년월일 *</span>
						</div>
						<!-- 체크된 내용 끝 -->
						<!-- 셀렉트 리스트 -->
						<ul class="option_list" id="yearSel">
							<%
								for(int i = 1;i<=100;i++){
									out.print(String.format("<li data-value='%d'", nowYear - i));
									out.print(String.format("	<span class='txt'>%d년</span>", nowYear - i));
									out.print("</li>");
								}
							%>
						</ul>
						<!-- 셀렉트 리스트 끝 -->
					</div>
					<!-- 셀렉트 끝 -->
			
					<!-- 셀렉트 -->
					<div class="select_option" style="width:174px;">
						<!-- 체크된 내용 -->
						<div class="active_cont">
							<span class="txt">월</span>
						</div>
						<!-- 체크된 내용 끝 -->
						<!-- 셀렉트 리스트 -->
						<ul class="option_list" id="monthSel">
							<c:forEach var="i" begin="1" end="12">
								<li data-value="${i}">
									<span class="" txt"">${i}월</span>
								</li>
							</c:forEach>
						</ul>
						<!-- 셀렉트 리스트 끝 -->
					</div>
					<!-- 셀렉트 끝 -->
			
					<!-- 셀렉트 -->
					<div class="select_option" style="width:174px;">
						<!-- 체크된 내용 -->
						<div class="active_cont">
							<span class="txt">일</span>
						</div>
						<!-- 체크된 내용 끝 -->
						<!-- 셀렉트 리스트 -->
						<ul class="option_list" id="daySel">
							<c:forEach var="i" begin="1" end="31">
								<li data-value="${i}">
									<span class="" txt"">${i}일</span>
								</li>
							</c:forEach>
						</ul>
						<!-- 셀렉트 리스트 끝 -->
					</div>
					
					<div>
						<ul id="resultList">
						</ul>
					</div>
					
					<!-- 셀렉트 끝 -->
				</li>
	
			</ul>
			
			
			
			<div class="al-c mgt20">
				<a href="javascript:complete();" class="btn03" style="margin-right:10px;">확인</a>
				<a href="javascript:history.go(-1);" class="btn03 bg_gray">취소</a>
			</div>
		</div>
	
	</div>


<script>
	
	$(document).ready(function(){
		resetSelectEvent();
	});
	
	var birthY = "";
	var birthM = "";
	var birthD = "";
	
	$("#yearSel li").click(function(){
		birthY = $(this).data("value");
	});
	$("#monthSel li").click(function(){
		birthM = $(this).data("value");
	});
	$("#daySel li").click(function(){
		birthD = $(this).data("value");
	});
	
	function complete(){

		var birth = (birthY+"").substring(2,4) + (birthM+"").padStart(2,"0") + (birthD+"").padStart(2,"0");
		
		if (birth.length != 6 || birthM == "" || birthD == ""){
			alert("생년월일을 선택해 주세요.");
			return;
		}
		
		if(birth.length === 6 && birthM != "" && birthD != ""){
			$.ajax({
				type:"POST", //필수:: 요청 메소드(GET or Post → 판단기준 : 데이터가 큰지 / 작은지)
				url:"/member/find_id", //필수:: 응답 프로그램 주소(acrion)
				data: birth,
				//dataType:"text", //선택:: 돌려받을 데이터의 형식
				async:true, //선택:: true(비동기) or false(동기) (기본값:true)
				
				success:function(data){ //선택:: 돌려받는 데이터가 있을때만 구현
					//console.log(data);
					if(data != 0){
						$("#resultList").html('<li class="tit"><span class="num">번호</span><span class="id">아이디</span><span class="date">가입일</span></li>');
						$(data).each(function(index){
							$("#resultList").append(
									"<li>" +
									"	<span class='num'>" + (index + 1) + "</span>" +
									"	<span class='id'>" + this.ID + "</span>" +
									"	<span class='date'>" + this.JOIN_DATE + "</span>" +
									"</li>"
							);
						});
					}else{
						$("#resultList").html("<li class='noData'><span>데이터가 없습니다</span></li>");
					}
				},
				error:function(a,b,c){//선택:: 예외처리 이벤트(catch절)
					console.log(a,b,c);
				}
			});
		}
	}
	
	
	
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>




