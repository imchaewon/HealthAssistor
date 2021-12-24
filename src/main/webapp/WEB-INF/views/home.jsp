<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--@ page session="false" --%>

<%@include file="/WEB-INF/views/includes/header.jsp"%>

<style>
	.sct1{text-align:center;background:snow url("/resources/images/bg_weights.png")space 0/42px fixed;}
	.sct1 .inWrap{width:1200px;margin:auto;text-align:center;}
	.sct1 .swiper-slide{display:flex;justify-content:space-evenly;align-items:center;align-self:center;}
	.sct1 .swiper-slide a{display:block;padding:10px 20px;border-radius:10px;font-weight: bold;border:2px dashed #666;}
	.sct1 .swiper-slide.p1 a{background:beige;}
	.sct1 .swiper-slide.p2 a{background:lightsteelblue;}
	
	.highcharts-figure{padding:30px 0;}
	#container{width:1200px;margin:0 auto 50px;}
</style>

<div class="sct1">
	<div class="inWrap">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide p1">
					<img src="/resources/images/mbnr1.jpg">
					<a href="javascript:">운동 찾기</a>
				</div>
				<div class="swiper-slide p2">
					<a href="javascript:">식단관리 하러가기</a>
					<img src="/resources/images/mbnr2.jpg">
				</div>
			</div>
			<!-- <div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div> -->
		</div>
	</div>
</div>


<figure class="highcharts-figure">
  <div id="container"></div>
</figure>



<script>

$(document).ready(function(){
	if("${join_result}"){
		alert("회원가입이 완료되었습니다.");
	}
	
	/*function getCookie(name) { //가져올 쿠키의 이름을 파라미터 값으로 받고
	     var nameOfCookie = name + "="; //쿠키는 "쿠키=값" 형태로 가지고 있어서 뒤에 있는 값을 가져오기 위해 = 포함
	     var x = 0;
	     while (x <= document.cookie.length) {  //현재 세션에 가지고 있는 쿠키의 총 길이를 가지고 반복
	          var y = (x + nameOfCookie.length); //substring으로 찾아낼 쿠키의 이름 길이 저장
	          if (document.cookie.substring(x, y) == nameOfCookie) { //잘라낸 쿠키와 쿠키의 이름이 같다면
	               if ((endOfCookie = document.cookie.indexOf(";", y)) == -1) //y의 위치로부터 ;값까지 값이 있으면 
	                    endOfCookie = document.cookie.length; //쿠키의 길이로 적용하고
	               return unescape(document.cookie.substring(y, endOfCookie)); //쿠키의 시작점과 끝점을 찾아서 값을 반환
	          }
	          x = document.cookie.indexOf(" ", x) + 1; //다음 쿠키를 찾기 위해 시작점을 반환
	          if (x == 0) //쿠키 마지막이면 
	               break; //반복문 빠져나오기
	     }
	     return ""; //빈값 반환
	}
	
	var cookie = getCookie("testCookie");
	if (cookie != "") {
	     alert("쿠키값은 : " + cookie);
	}*/

});

const sl4 = new Swiper('.sct1 .swiper-container',{
	pagination: ".sct1 .swiper-pagination",
	nextButton: '.sct1 .swiper-next',
	prevButton: '.sct1 .swiper-prev',
	speed:500,
	loop:true,
	paginationClickable:true,
	paginationType : 'fraction',
	autoplayDisableOnInteraction:true,
	autoplay:3000,
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








