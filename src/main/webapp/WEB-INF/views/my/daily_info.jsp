<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet">


<style>

</style>

<form name="Frm">
</form>


<div class="daily_info">

	<!-- <h1 class="titleS3">일별 영양소 & 오늘의 운동</h1> -->
	
	<div id='calendar-container'>
	
		<div id='external-events'>
			<p>
				<strong>원하는 운동을 드래그로<br>추가해보세요.</strong>
			</p>
			<ul>
			<c:forEach items="${part}" var="pList">
				<c:set var="cd" value="${pList.CODE}" />
				<li>${pList.NAME}</li>
				<ul>
				<c:forEach items="${map[cd]}" var="exr">
					<li class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
						<div class='fc-event-main'>${exr.NAME}</div>
					</li>
				</c:forEach>
				</ul>
			</c:forEach>
			</ul>
		
			<p style="display:none">
				<input type='checkbox' id='drop-remove' />
				<label for='drop-remove'>remove after drop</label>
			</p>
		</div>
	
		<div id='calendar'>
		
			<!-- 캘린더 -->
			
			<p class="titTxt">※ 개별삭제시 일정을 클릭해주세요.</p>
			
		</div>
		
		<div class="btnWrap al-c">
			<a href="javascript:" id="save" class="btn03">저장</a>
			<a href="javascript:" id="reset" class="btn03 bg_gray">초기화</a>
			<a href="javascript:" id="clear" class="btn03 bg_gray">일정 모두 제거</a>
		</div>
		
	</div>
	
	

</div>



<script>

$(document).ready(function(){
	$(".daily_info #external-events > ul > li:nth-of-type(1)").addClass("on")
	.next().slideDown();
});

$(window).on("scroll",function(){
	
	var element = $("#external-events");
	
	var s = $(document).scrollTop()
	
	if (s >= 155) {
		const position = $(window).scrollTop();
		element.stop().animate({"top":position - 100 + "px"},500);
	}else{
		element.stop().css("top","49px");
	}
	
});

document.addEventListener('DOMContentLoaded', function() {
	var Calendar = FullCalendar.Calendar;
	var Draggable = FullCalendar.Draggable;

	var containerEl = document.getElementById('external-events');
	var calendarEl = document.getElementById('calendar');
	var checkbox = document.getElementById('drop-remove');

	// initialize the external events
	// -----------------------------------------------------------------

	new Draggable(containerEl, {
		itemSelector: '.fc-event',
		eventData: function(eventEl) {
			return {
				title: eventEl.innerText
			};
		}
	});

	// initialize the calendar
	// -----------------------------------------------------------------

	var calendar = new Calendar(calendarEl, {
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay'
		},
		editable: true,
		droppable: true, // this allows things to be dropped onto the calendar
		drop: function(info) {
			// is the "remove after drop" checkbox checked?
			if (checkbox.checked) {
				// if so, remove the element from the "Draggable Events" list
				info.draggedEl.parentNode.removeChild(info.draggedEl);
			}
		},
		//locale: 'ko',
		dayMaxEventRows: true, // 내용이 많으면 +더보기
		titleFormat : function(date) { // title 설정
			return date.date.year +"년 "+(date.date.month +1)+"월"; 
		},
		
		navLinks: true, // can click day/week names to navigate views
		selectable: true,
		selectMirror: true,
		select: function(arg) {
			console.log(arg);
			var title = prompt('입력할 일정:');
			// title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
			if (title) { calendar.addEvent({
				title: title,
				start: arg.start,
				end: arg.end,
				allDay: arg.allDay,
				backgroundColor:"yellow",
				textColor:"blue"
			});}
			calendar.unselect()
		},
		eventClick: function(arg){ // 있는 일정 클릭시,
			console.log("#등록된 일정 클릭#");
			console.log(arg.event);
			if (confirm('삭제하시겠습니까?')) {
				arg.event.remove()
			}
		},
		events:function(info, successCallback, failureCallback){
			// ajax 처리로 데이터를 로딩 시킨다.
			$.ajax({
				type:"get",
				url:"/my/daily_info?method=data",
				dataType:"json",
				async:false,
				success:function(data){
					var events = [];
					for (var i = 0; i < data.length; i++) {
						events.push({
							id : data[i].id,
							groupId : data[i].groupId,
							title : data[i].title,
							writer : data[i].writer,
							content : data[i].content,
							start : data[i].start,
							end : data[i].end,
							allday : data[i].allday,
							textColor : data[i].textColor,
							backgroundColor : data[i].backgroundColor,
							borderColor : data[i].borderColor
						});
					}
					successCallback(events);
				},
				error:function(a,b,c){
					console.log(a,b,c)
				}
			});
		}

	});

	calendar.render();
	
	$("#reset").click(function(){
		calendar.removeAllEvents();
		
		$.ajax({
			type:"get",
			url:"/my/daily_info?method=data",
			dataType:"json",
			async:false,
			success:function(data){
				console.log(data);
				var events = [];
				for (var i = 0; i < data.length; i++) {
					events.push({
						id : data[i].id,
						groupId : data[i].groupId,
						title : data[i].title,
						writer : data[i].writer,
						content : data[i].content,
						start : data[i].start,
						end : data[i].end,
						allday : data[i].allday,
						textColor : data[i].textColor,
						backgroundColor : data[i].backgroundColor,
						borderColor : data[i].borderColor
					});
				}
				calendar.addEventSource(events);
			},
			error:function(a,b,c){
				console.log(a,b,c)
			}
		});
	});
	
	$("#clear").click(function(){
		calendar.removeAllEvents();
	});
	
	$("#save").click(function(){
		var f = document.Frm;
		var datas = calendar.getEvents();
		
		for (var i = 0; i < datas.length; i++) {
			
			// allDay속성을 boolean에서 숫자로 변경
			if(datas[i].allDay == false){
				datas[i]._def.allDay = 0;
			}else{
				datas[i]._def.allDay = 1;
			}
			
		}
		
		// hidden태그 생성 (날짜포맷변경)
		for (var i = 0; i < datas.length; i++) {
			
			// 날짜객체 복제
			let startD = new Date(datas[i]._instance.range.start);
			let endD = new Date(datas[i]._instance.range.end);
			
			// 풀캘린더 버그 수정 위해 끝나는 일자 -1일
			endD.setDate(endD.getDate() - 1);
			
			// 날짜/시간 포맷 변경
			startD = dateTransfer(startD);
			endD = dateTransfer(endD);
			
			$(f).append('<input type="hidden" name="list[' + i + '].id" value="' + datas[i].id + '">');
			$(f).append('<input type="hidden" name="list[' + i + '].MEMBER_SQ" value="${loginInfo.MEMBER_SQ}">');
			$(f).append('<input type="hidden" name="list[' + i + '].groupId" value="' + datas[i].groupId + '">');
			$(f).append('<input type="hidden" name="list[' + i + '].title" value="' + datas[i].title + '">');
			$(f).append('<input type="hidden" name="list[' + i + '].content" value="' + datas[i].content + '">');
			$(f).append('<input type="hidden" name="list[' + i + '].start" value="' + startD + '">');
			$(f).append('<input type="hidden" name="list[' + i + '].end" value="' + endD + '">');
			$(f).append('<input type="hidden" name="list[' + i + '].allday" value="' + datas[i].allDay + '">');
			$(f).append('<input type="hidden" name="list[' + i + '].textColor" value="' + datas[i].textColor + '">');
			$(f).append('<input type="hidden" name="list[' + i + '].backgroundColor" value="' + datas[i].backgroundColor + '">');
			$(f).append('<input type="hidden" name="list[' + i + '].borderColor" value="' + datas[i].borderColor + '">');
		}
		
		$.ajax({
			type:"POST",
			url:"/my/daily_info?method=save",
			data:$(f).serialize(),
			async:false,
			success:function(data){
				console.log(data);
				if(data){
					//alert("저장을 완료했습니다.");
					location.href = "";
				}
			},
			error:function(a,b,c){
				console.log(a,b,c);
			}
		});
	});
});

$(".daily_info #external-events ul > li").on("click",function(){
	t = $(this);
	if (t.hasClass("on")) {
		t.removeClass("on")
		.next().stop().slideUp();
	}else{
		t.siblings("li").removeClass("on")
		.siblings("ul").stop().slideUp();
		t.addClass("on")
		.next().stop().slideDown();
	}
});



</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>




