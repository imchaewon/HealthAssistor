<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
	String imgPath = "/resources/images";
%>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>핏퍼 FITPER</title>
	<link rel="shortcut icon" href="/resources/images/favicon.ico">

	<!-- Bootstrap Core CSS -->
	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- MetisMenu CSS -->
	<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

	<!-- DataTables CSS -->
	<link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

	<!-- DataTables Responsive CSS -->
	<link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<link href="/resources/css/swiper.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/css/base.css">

	<link rel="stylesheet" href="/resources/css/style.css">



	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<script src="/resources/js/swiper.min.js"></script>
	
	<script src="https://code.highcharts.com/highcharts.src.js"></script>
	
	<script src="/resources/js/common.js"></script>
	
</head>



<body>

<div class="topWrap">
	<h1 class="logo"><a href="/"><img src="<%=imgPath%>/logo.png"></a></h1>
	
	<div class="searchWrap">
		<form id="tsFrm" name="tsFrm" method="get" action="/product/search.asp">
			<input type="text" autocomplete="off" name="sword" id="topSearchWord" onkeyup="return searckResurt(event)" placeholder="">
			<div onclick="javascript:" class="btn_search" style="cursor:pointer"><i class="fa fa-search" aria-hidden="true"></i></div>
		</form>
	</div>
	
	<div class="rgtWrap">
		<c:if test="${member == null}">
		<ul id="logout">
			<li><a href="/member/login">로그인</a></li>
			<li><a href="/member/join">회원가입</a></li>
		</ul>
		</c:if>
		<c:if test="${member != null}">
		<ul id="login">
			<li>Hi, ${member.ID}님</li>
			<li class="my"><a href="javascript:">마이페이지</a>
				<ul>
					<li><a href="javascript:">내 정보 관리</a></li>
					<li><a href="javascript:">내 게시글</a></li>
					<li><a href="javascript:">내 댓글</a></li>
					<li><a href="javascript:">빋은 쪽지</a></li>
					<li><a href="javascript:">회원 탈퇴</a></li>
				</ul>
			</li>
			<li><a href="/member/logout">로그아웃</a></li>
		</ul>
		</c:if>
	</div>

</div>

<div class="gnbWrap">
	<div class="gnbBox">
		<ul>
			<li><a href="javascript:">내 일일 영양소 & 운동 루틴</a></li>
			<li><a href="javascript:">운동 추천 & 등록</a></li>
			<li><a href="javascript:">내 그래프</a></li>
			<li><a href="javascript:">Health Place</a></li>
			<li><a href="javascript:">커뮤니티</a></li>
			<li><a href="javascript:">내 체형 알아보기</a></li>
		</ul>
	</div>
</div>





