<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>



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








