<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<script src="/resources/js/member.js"></script>


<style type="text/css">

.searchWrap{padding:20px 15px 15px;}
.searchWrap button{width:100px;margin-right:5px;}
.areaSearchWrap{display:none;padding-top:5px;}
.areaSearchWrap input{padding:5px;vertical-align:middle;}
.areaSearchWrap .btnSearch{display:inline-block;vertical-align:middle;padding:3px 5px;color:#fff;background:#666;border-radius:5px;}

.brightWrap{position:absolute;z-index:999;right:10px;top:10px;}
.brightWrap .swBright{vertical-align: middle;text-shadow: 1px 1px 0 #000;font-weight: bold;color: #fff}
.brightWrap label.switch{position:relative;display:inline-block;vertical-align:middle;width:56px;height:24px;padding:0;}
.brightWrap label.switch input{display:none;}
.brightWrap label.switch input + :after{content:"Off";font-size:14px;color:#fff;font-weight:bold;width:56px;text-align:right;display:inline-block;padding:0 8px;box-sizing:border-box;}
.brightWrap label.switch input + div.slider{position:absolute;cursor:pointer;top:0;left:0;right:0;bottom:0;background-color:#ccc;-webkit-transition:.4s;transition:.4s;line-height:24px;}
.brightWrap label.switch input + div.slider:before{position:absolute;content:"";height:16px;width:16px;left:4px;bottom:4px;background-color:white;-webkit-transition:.4s;transition:.4s;}
.brightWrap label.switch input:checked + .slider{background-color:#2196F3;}
.brightWrap label.switch input:checked + :after{content:"On";font-size:14px;color:#fff;font-weight:bold;line-height:24px;text-align:left;}
.brightWrap label.switch input:focus + .slider{box-shadow:0 0 1px #2196F3;}
.brightWrap label.switch input:checked + .slider:before{-webkit-transform:translateX(31px);-ms-transform:translateX(31px);transform:translateX(31px);background:deepskyblue;}


.map_wrap {position:relative;width:100%;height:350px;}
#map .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:99;padding:5px;}
#map .hAddr #centerAddr {display:block;margin-top:2px;font-weight: normal;}
#map .pick{z-index:10;}
#map #bAddr {padding:10px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#map #bAddr div,
#map #bAddr form{padding-top:5px;}
#map #bAddr div:nth-of-type(1){display:flex;justify-content:space-between;padding-top:0;}
#map #bAddr .title{padding-right:10px;font-size:16px;line-height:22px;}
#map #bAddr .btnReg{float:right;background:#666;color:#fff;border-radius:5px;padding:2px 8px;font-size:12px;line-height:21px;text-decoration:none;margin-top:-1px;}
#map #bAddr .btnCls{width:16px;height:16px;position:absolute;right:-8px;top:-8px;background:url("./ico_cls.png")no-repeat 0/100%;}
#map #bAddr .addr_r,
#map #bAddr .addr_n{font-size:12px;}
#map #bAddr textarea#memo{width:calc(100% - 5px);height:40px;resize:none;}
#map #bAddr .botWrap{overflow:hidden;}
#map #bAddr .botWrap input[type=text]#wrtr{float:left;width:calc(100% - 55px);line-height:18px;}

#map .pickBox{z-index:10 !important;}
#map .infoBox{background:#fff;padding:10px;border:1px solid #666;transform:translate(0,123px);cursor:default;font-size:12px;}
#map .infoBox .memo{height:50px;resize:none;outline:0;border:1px solid #999;}
#map .infoBox .wrtr{text-align:right;color:#999;}
#map .infoBox .btnCls{position:absolute;right:-8px;top:-8px;cursor:pointer;width:16px;}
#map .layer{opacity:0;pointer-events:none;background:rgba(0,0,0,.7);position:absolute;left:0;right:0;top:0;bottom:0;transition:all .5s;z-index:20;}

</style>


<div class="searchWrap">
	<button id="currentGeoLocation">내 위치로<br>찾기</button>
	<button onclick='javascript:$(".areaSearchWrap").slideToggle()'>지역 이름으로<br>찾기</button>
	<div id="nudge"></div>
	<div id="startLat"></div>
	<div id="startLon"></div>

	<div class="areaSearchWrap">
		<input type="text" id="sAddr" placeholder="지역을 입력해주세요" onKeypress="javascript:if(event.keyCode==13)searchAddr()">
		<a href="javascript:searchAddr()" class="btnSearch">검색하기</a>
	</div>


</div>
<div class="map_wrap">
<div id="map" style="width:100%;height:500px;">
	<div class="hAddr">
		<span id="centerAddr"></span>
	</div>
	<div class="brightWrap">
		<a href="javascript:" class="swBright">브라이트모드</a>
		<label class="switch">
			<input type="checkbox" id="swBright">
			<div class="slider round"></div>
		</label>
	</div>
	<div class="layer"></div>
</div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=928a6c45f558ef11e74ba2c15c0c484f&libraries=services,clusterer,drawing"></script>

<script>

// 지도에 새로 찍은 좌표값
var crdiSet, crdiY, crdiX;

//마커 닫기 이벤트 제어 변수
var swPick = 0;

// 새로 찍은 마크 창 닫기
function clsPick(){
	$(".pickBox, .pick").css('visibility','hidden');
}

// 브라이트모드 스위치
(function(){
	var sw = 0;
	$("#swBright").on('change',function(){
		sw = swBright(sw);
	});
	$(".swBright").on('click',function(){
		sw = swBright(sw);
	});
})();

function swBright(sw){
	if (sw){ // 불 키기
		$(".layer").css({'opacity':0});
		$("#swBright").prop("checked",false);
	}else{ // 불 끄기
		$(".layer").css({'opacity':.5});
		$("img[src='./ico_marker.png']").parent("div").parent("div").css('z-index',20);
		$("#swBright").prop("checked",true);
	}
	return !sw;
}

// 플레이스 등록하기
function regPlace(){
	$(".topWrap").remove();
	$("#bAddr").append(
		"<form id='formReg'>" +
		  "<div>" +
		    "<textarea placeholder='간단한 설명을 입력해주세요. (200글자 이내)' name='memo' id='memo'></textarea>" +
		  "</div>" +
		  "<div class='botWrap'>" +
		    "<input type='text' placeholder='닉네임을 입력해주세요.' name='wrtr' id='wrtr'>" +
		    "<a href='javascript:regist()' class='btnReg'>확인</a>" +
		  "</div>" +
		  "<input type='hidden' name='crdi_y' id='crdi_y' value='" + crdiY + "'>" +
		  "<input type='hidden' name='crdi_x' id='crdi_x' value='" + crdiX + "'>" +
		"</form>")
	.parent("div").parent("div").height($("#bAddr").outerHeight());

	$("#bAddr").width(parseInt($(".pickBox").width()) - 20 + "px");
	$(".pickBox").children("div:eq(0)").css('top',$("#bAddr").outerHeight() + "px");
}

// 플레이스 등록하기
function regist(){

	var f = $("#formReg");

	if($("#memo").val() == ""){
		alert("설명를 입력해주세요.");
		$("#memo").focus();
		return;
	}
	if($("#memo").val().length > 200){
		alert("설명을 200글자 이내로 입력해주세요.");
		$("#memo").focus();
		return;
	}
	if($("#wrtr").val().length > 10){
		alert("닉네임을 10글자 이내로 입력해주세요.")
		$("#wrtr").focus();
		return;
	}

	f.attr("method","POST")
	.attr("action","/");
	//f.submit();
	
}

function clickInfoBox(){
	swPick = 1;
};


var swScroll = 1;
function scrollOnOff(){
	swScroll = setZoomable(!swScroll);
}

// 버튼 클릭에 따라 지도 확대, 축소 기능을 막거나 풀고 싶은 경우에는 map.setZoomable 함수를 사용합니다
function setZoomable(zoomable) {
    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
    map.setZoomable(zoomable);    
	return zoomable;
}

// 위치정보 함수입니다
(function() {
	if('geolocation' in navigator) {
		/* 위치정보 사용 가능 */
	} else {
		/* 위치정보 사용 불가능 */
	}

	const currentGeoLocation = document.getElementById("currentGeoLocation");

	currentGeoLocation.onclick = function() {
		var startPos;
		var geoOptions = {
			timeout: 10 * 1000
		};
		var element = document.getElementById("nudge");

		var showNudgeBanner = function () {
			nudge.style.display = "block";
		};

		var hideNudgeBanner = function () {
			nudge.style.display = "none";
		};

		var nudgeTimeoutId = setTimeout(showNudgeBanner, 5000);

		var geoSuccess = function (position) {
			hideNudgeBanner();
			// We have the location, don't display banner
			clearTimeout(nudgeTimeoutId);

			// Do magic with location
			startPos = position;
			var crdi_y = startPos.coords.latitude; //위도(수직 좌표)
			var crdi_x = startPos.coords.longitude; //경도(수평 좌표)

			// 이동할 위도/경도 세트를 생성
			var moveLatLon = new kakao.maps.LatLng(crdi_y, crdi_x);

			//지도 위치를 이동
			map.panTo(moveLatLon);
		};
		var geoError = function (error) {
			console.log('Error occurred. Error code: ' + error.code);
			// error.code can be:
			//   0: unknown error
			//   1: permission denied
			//   2: position unavailable (error response from location provider)
			//   3: timed out
			switch (error.code) {
				case error.PERMISSION_DENIED:
					// The user didn't accept the callout
					document.getElementById('nudge').innerHTML = '위치정보 허용 권한이 없습니다';
					showNudgeBanner();
					break;
				case error.POSITION_UNAVAILABLE:
					// The user didn't accept the callout
					document.getElementById('nudge').innerHTML = '위치 정보를 가져오지 못했습니다';
					showNudgeBanner();
					break;
				case error.TIMEOUT:
					// The user didn't accept the callout
					document.getElementById('nudge').innerHTML = '시간 초과';
					showNudgeBanner();
					break;
			};
		};

		navigator.geolocation.getCurrentPosition(geoSuccess, geoError, geoOptions);
	};
})();

var map; // 지도 객체 변수생성

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

function searchAddr(){
	var addr = $("#sAddr").val();

	if(addr===''){
		alert("지역을 입력해주세요.");
		return;
	}

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var crdi_y, crdi_x;
			crdi_x = result[0].x;
			crdi_y = result[0].y;

			// 이동할 위도/경도 세트를 생성
			var moveLatLon = new kakao.maps.LatLng(crdi_y, crdi_x);

			//지도 위치를 이동
			map.panTo(moveLatLon);
		}else{
			alert("올바른 지역을 입력해주세요.")
			$("#sAddr").focus();
		}
	});
}

createMap(37.56571034933654, 126.97685078731561); //지도 함수를 실행합니다

function createMap(crdi_y, crdi_x){

	var swClsMarker = 0; //마커 닫기 이벤트 제어 변수

	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
		mapOption = { 
			center: new kakao.maps.LatLng(crdi_y, crdi_x), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		}; 

	map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 초기화합니다

	var positions = [
		{
			memo: '덕수궁공원', 
			wrtr: 'GERVAISOT', 
			latlng: new kakao.maps.LatLng(37.56611276993781, 126.9748242693737)
		},
		{
			memo: '한빛공원', 
			wrtr: '닥터전자레인지', 
			latlng: new kakao.maps.LatLng(37.567934465938386, 126.98468913221764)
		},
		{
			memo: '다동공원', 
			wrtr: 'FEONA', 
			latlng: new kakao.maps.LatLng(37.568048339996, 126.98075030022703)
		},
		{
			memo: '탑골공원\r\n탑골공원탑골공원탑골공원탑골공원탑골공원탑골공원탑골공원탑골공원탑골공원탑골공원',
			wrtr: 'XOMIMITL',
			latlng: new kakao.maps.LatLng(37.57117773510021, 126.9883248252053)
		}
	];

	for(let i=0; i < positions.length; i++){
		var data = positions[i];
		displayMarker(data);
	}

	// 지도에 이미 생성되어있는 마커를 표시하는 함수입니다	
	function displayMarker(data) { 
		var imageSrc = './ico_marker.png', // 마커이미지의 주소입니다	
			imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
			imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		var marker = new kakao.maps.Marker({
			map: map,
			position: data.latlng,
			image: markerImage
		});
		var overlay = new kakao.maps.CustomOverlay({
			yAnchor: 3,
			position: marker.getPosition()
		});
		
		var content = document.createElement('div');
		content.classList.add('infoBox');
		content.setAttribute('onclick','clickInfoBox()');
		content.innerHTML = "" +
			"<textarea class='memo' readonly onmouseover='scrollOnOff()' onmouseout='scrollOnOff()'>" + data.memo + "</textarea>" +
			"<div class='wrtr'>" + data.wrtr + "</div>";
		
		var closeBtn = document.createElement('img');
		closeBtn.setAttribute("src","./ico_cls.png");
		closeBtn.setAttribute("class","btnCls");

		// 생성되있는 마커 설명창을 닫을때 발생하는 이벤트
		closeBtn.onclick = function () {
			overlay.setMap(null);
			swClsMarker = 1;
			return;
		};
		content.appendChild(closeBtn);
		overlay.setContent(content);

		kakao.maps.event.addListener(marker, 'click', function() {
			overlay.setMap(map);
		});
	}



	// 지도를 찍어서 새롭게 생성될 마커
	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);

	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {

			// 이전에 생성한 마커 등록창을 닫을때는 새로운 마커가 안찍히도록 취소
			if(swClsMarker){
				swClsMarker = 0;
				return;
			}

			// 지도에 생성되어있는 마커 정보창 위에서 클릭시 새로운 마커 안찍히도록 취소
			if(swPick){
				swPick = 0;
				return;
			}

			crdiSet = mouseEvent.latLng; // 위도&경도
			crdiY = crdiSet.getLat(); //위도
			crdiX = crdiSet.getLng(); //경도

			if (status === kakao.maps.services.Status.OK) {
				var detailAddr = !!result[0].road_address ? '<div class="addr_r">도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
				detailAddr += '<div class="addr_n">지번 주소 : ' + result[0].address.address_name + '</div>';
				
				var content = '<div id="bAddr">' +
								'<div class="topWrap">' +
								  '<span class="title">법정동 주소정보</span>' + 
								  '<a href="javascript:regPlace();" class="btnReg">플레이스 등록</a>' + 
								'</div>' +
								'<a href="javascript:clsPick();" class="btnCls"></a>' + 
								detailAddr + 
							'</div>';

				// 마커를 클릭한 위치에 표시합니다 
				marker.setPosition(crdiSet);
				marker.setMap(map);

				// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				infowindow.setContent(content);
				infowindow.open(map, marker);

				// 픽 인포박스 클래스 추가 등
				$("#bAddr").parent("div").parent("div").addClass("pickBox")
				.prev("div").addClass("pick");
				$(".pickBox,.pick").css('visibility','visible');
			}   
		});
	});

	// 더블클릭 이벤트
	kakao.maps.event.addListener(map, 'dblclick', function(mouseEvent) {
		searchDetailAddrFromCoords(crdiSet, function(result, status) {

			setTimeout(function(){
				$(".pickBox").height($("#bAddr").outerHeight())
				.width($("#bAddr").outerWidth())
				.css('top',parseInt($(".pickBox").css('top')) - 42 + "px")
				.children("div:eq(0)").css('top',$("#bAddr").outerHeight() + "px");
			},280)

		});
	});

	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});

	function searchAddrFromCoords(coords, callback) {
		// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);		 
	}

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var infoDiv = document.getElementById('centerAddr');

			for(var i = 0; i < result.length; i++) {
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					infoDiv.innerHTML = result[i].address_name;
					break;
				}
			}
		}	
	}


	/*
	// 마커 클러스터러를 생성합니다 
	var clusterer = new kakao.maps.MarkerClusterer({
		map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		minLevel: 10 // 클러스터 할 최소 지도 레벨 
	});

	// 데이터를 가져오기 위해 jQuery를 사용합니다
	// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	$.get("https://imchaewon.github.io/test/chicken.json", function(data) {
		// 데이터에서 좌표 값을 가지고 마커를 표시합니다
		// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		var markers = $(data.positions).map(function(i, position) {
			return new kakao.maps.Marker({
				position : new kakao.maps.LatLng(position.lat, position.lng)
			});
		});

		// 클러스터러에 마커들을 추가합니다
		clusterer.addMarkers(markers);
	});
	*/


}


</script>


<%@include file="/WEB-INF/views/includes/footer.jsp"%>




