<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>



<%@include file="/WEB-INF/views/includes/header.jsp"%>

<div class="topWrap">
	<h1 class="logo"><img src="<%=imgPath%>/logo.png"></h1>
	
	<div class="searchWrap">
		<form id="tsFrm" name="tsFrm" method="get" action="/product/search.asp">
			<input type="text" autocomplete="off" name="sword" id="topSearchWord" onkeyup="return searckResurt(event)" placeholder="">
			<div onclick="javascript:" class="btn_search" style="cursor:pointer"><i class="fa fa-search" aria-hidden="true"></i></div>
		</form>
	</div>
	
	<div class="rgtWrap">
		<ul id="logout" style="display:none">
			<li><a href="javascript:">로그인</a></li>
			<li><a href="javascript:">회원가입</a></li>
		</ul>
		<ul id="login">
			<li>안녕하세요, 홍길동님</li>
			<li class="my"><a href="javascript:">마이페이지</a>
				<ul>
					<li><a href="javascript:">내 정보 관리</a></li>
					<li><a href="javascript:">내 게시글</a></li>
					<li><a href="javascript:">내 댓글</a></li>
					<li><a href="javascript:">빋은 쪽지</a></li>
					<li><a href="javascript:">회원 탈퇴</a></li>
				</ul>
			</li>
			<li><a href="javascript:">로그아웃</a></li>
		</ul>
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

<div class="sct1">
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide p1">
				<img src="/resources/images/mbnr1.jpg">
			</div>
			<div class="swiper-slide p2">
				<img src="/resources/images/mbnr2.jpg">
			</div>
		</div>
		<!-- <div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div> -->
	</div>
</div>


<figure class="highcharts-figure">
  <div id="container"></div>
</figure>



<script>

const sl4 = new Swiper('.sct1 .swiper-container',{
	pagination: ".sct1 .swiper-pagination",
	nextButton: '.sct1 .swiper-next',
	prevButton: '.sct1 .swiper-prev',
	speed:500,
	loop:true,
	paginationClickable:true,
	paginationType : 'fraction',
	autoplayDisableOnInteraction:false,
	autoplay:2500,
	slidesPerView : 'auto'
});



Highcharts.chart('container', {

    title: {
        text: 'Solar Employment Growth by Sector, 2010-2016'
    },

    subtitle: {
        text: 'Source: thesolarfoundation.com'
    },

    yAxis: {
        title: {
            text: 'Number of Employees'
        }
    },

    xAxis: {
        accessibility: {
            rangeDescription: 'Range: 2010 to 2017'
        }
    },

    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },

    plotOptions: {
        series: {
            label: {
                connectorAllowed: false
            },
            pointStart: 2010
        }
    },

    series: [{
        name: 'Installation',
        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
    }, {
        name: 'Manufacturing',
        data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
    }, {
        name: 'Sales & Distribution',
        data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
    }, {
        name: 'Project Development',
        data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
    }, {
        name: 'Other',
        data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
    }],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }

});


</script>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>








