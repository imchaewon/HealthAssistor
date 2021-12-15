<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>



<%@include file="/WEB-INF/views/includes/header.jsp"%>

<div class="topWrap">
	<h1 class="logo"><img src="<%=imgPath%>/logo.png"></h1>
	
	<div class="gnb">
		<ul>
			<li>내 일일 영양소 & 운동 루틴</li>
			<li>운동 추천 & 등록</li>
			<li>내 그래프</li>
			<li>Health Place</li>
			<li>커뮤니티</li>
			<li>내 체형 알아보기</li>
	<div class="rgtWrap">
		<ul id="logout">
			<li>로그인</li>
			<li>회원가입</li>
		</ul>

		<ul id="login">
			<li>안녕하세요, 홍길동님</li>
			<li>마이페이지</li>
			<li>로그아웃</li>
		</ul>
	</div>

</div>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>








