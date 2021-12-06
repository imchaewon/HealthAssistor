<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>



<%@include file="/WEB-INF/views/includes/header.jsp"%>

<script type="text/javascript">

	$.ajax({
		type:"post",
		url:"/common/ajax/exec_getCartCnt.asp",
		success:function(data, state, xhr){
			$(".cartCnt").each(function(){$(this).html(data);});
		}
	})
	$(document).ready(function() {
		$(".join_pop_cls").click(function(){
			$.ajax({
				type:"post",
				url:"/common/ajax/exec_NewMainTopMenu.asp",
				success:function(data){
					$("#layer_pop_cls").html(data);
				}
			});
		});
	});
	</script>
	<style type="text/css">
	.utilWrap {position:relative; min-width:1200px; background:#fff; z-index:99;}
	.utilBox {width:1200px; height:44px; margin:0 auto; line-height:44px; text-align:left;}
	.utilBox .appDownload {float:left; color:#000; font-size:12px; font-weight:bold;}
	.utilBox .appDownload .iconfont {display:inline-block; width:20px; height:20px; margin-right:5px; border-radius:100%; background:{{COLORTYPE1}}; color:#fff; font-size:14px; line-height:20px; text-align:center; vertical-align:middle;}
	.utilBox .util {float:right; padding-top:5px; font-size:0;}
	.utilBox .util span.inList {display:inline-block; position:relative;}
	.utilBox .util span.inList ul {position:absolute;}
	.utilBox .util > a {float:left; padding:0 14px; background:url('{{BANNER_SRC:1}}') no-repeat 0 center; color:#0f0f0f; font-size:11px; line-height:34px; font-weight:bold;}
	.utilBox .util > a:first-child {background:none;}
	.utilBox .util > a:nth-last-child(2){line-height:28px;background-position:0 13px;}
	.utilBox .util > a span.ftic-cart {color:{{COLORTYPE1}}; font-size:20px; vertical-align:top;}
	.utilBox .util > a span.cartCnt {display:inline-block; width:20px; height:20px; margin:-2px 0 0 8px; border-radius:100%; background:{{COLORTYPE1}}; color:#fff; font-size:10px; line-height:20px; font-weight:bold; text-align:center; vertical-align:middle;}
	.utilBox .util > span.inList {display:inline-block; float:left; position:relative; height:32px; padding:0 12px; border:1px solid #fff; background:url('{{BANNER_SRC:1}}') no-repeat 0 center; color:#0f0f0f; font-size:11px; line-height:32px;  font-weight:bold; cursor:pointer; z-index:5;}
	.utilBox .util > span.inList em {display:block; padding-right:14px; background:url('{{BANNER_SRC:2}}') no-repeat right center; font-size:11px; font-style:normal; font-weight:bold;}
	.utilBox .util > span.inList:hover {margin-right:-2px; padding-right:14px; border:1px solid #dbdbdb; background:#f6f6f6; z-index:10;}
	.utilBox .util > span.inList:hover em {background:url('{{BANNER_SRC:3}}') no-repeat right center;}
	.utilBox .util > span.inList ul {display:none; position:absolute; top:32px; left:-1px; width:100%; background:#fff; margin:0; border:1px solid #dbdbdb;}
	.utilBox .util > span.inList:hover ul {display:block;}
	.utilBox .util > span.inList ul li {border-top:1px solid #dbdbdb;}
	.utilBox .util > span.inList ul li:first-child {border-top:none;}
	.utilBox .util > span.inList ul li a {display:block; color:#0f0f0f; font-size:11px; line-height:26px; text-align:center; font-weight:normal;}
	
	
	.utilBox .addSite {float:left; margin-left:10px; color:#000; font-size:12px; font-weight:bold;}
	.utilBox .addSite .iconfont {font-weight:bold; display:inline-block; width:20px; height:23px; border-radius:100%; color:{{COLORTYPE1}};  font-size:20px; line-height:20px; text-align:center; vertical-align:middle;}
	</style>
	<div id="layer_pop_cls">
	
	</div>
	<div class="utilWrap">
		<div class="utilBox">
			<!-- <a href="/page.asp?uid=" class="appDownload"><span class="iconfont ftic-phone"></span> 앱다운로드</a> -->
			<a href="#" id="favorite" class="addSite"><span class="iconfont ftic-Favorites"></span> 즐겨찾기</a>
			<div class="util tmb_logout {{CHECK_LOGOUT}}">
				<a href="/member/login.asp">LOGIN</a>
				<a href="/member/join.asp">JOIN</a>
				<!-- <a href="javascript:;" class="join_pop_cls">JOIN</a> -->
				<span href="/my" class="inList">
					<em><a href='/my/main.asp'>마이페이지</a></em>
					<ul>
						<li><a href="/my/order_total.asp?mode=normal">주문조회</a></li>
						<li><a href="/my/order_total.asp?mode=deliver">배송조회</a></li>
						<li><a href="/my/order_total.asp?mode=cancel">취소/반품</a></li>
					</ul>
				</span>
				<span class="inList">
					<em><a href="/cscenter/">고객센터</a></em>
					<ul>
						<li><a href="/cscenter/consultReg.asp">1:1문의</a></li>
						<li><a href="/cscenter/faq.asp">FAQ</a></li>
						<li><a href="/cscenter/notice_list.asp">공지사항</a></li>
					</ul>
				</span>
				<a href="/product/cart.asp"><span class="iconfont ftic-cart"></span> 장바구니<span class="cartCnt"></span></a>
				<a href="/member/check_date.asp" class="inList">출석체크</a>
			</div>
	
			<div class="util tmb_login {{CHECK_LOGIN}}">
				<a href="/my" class="hi">Hi, {{USER_NAME}}</a>
				<a href="/member/logout.asp">로그아웃</a>
				<span href="/my/main.asp" class="inList">
					<em><a href='/my/main.asp'>마이페이지</a></em>
					<ul>
						<li><a href="/my/order_total.asp?mode=normal">주문조회</a></li>
						<li><a href="/my/order_total.asp?mode=deliver">배송조회</a></li>
						<li><a href="/my/order_total.asp?mode=cancel">취소/반품</a></li>
					</ul>
				</span>
				<span href="#" class="inList">
					<em><a href="/cscenter/">고객센터</a></em>
					<ul>
						<li><a href="/cscenter/consultReg.asp">1:1문의</a></li>
						<li><a href="/cscenter/faq.asp">FAQ</a></li>
						<li><a href="/cscenter/notice_list.asp">공지사항</a></li>
					</ul>
				</span>
				<a href="/product/cart.asp"><span class="iconfont ftic-cart"></span> 장바구니<span class="cartCnt"></span></a>
				<a href="/member/check_date.asp" class="inList">출석체크</a>
			</div>
	
		</div>
	</div>
	
	<script type="text/javascript">
	<!--
	$(document).ready(function() {
		$('#favorite').on('click', function(e) {
			var bookmarkURL = window.location.href;
			var bookmarkTitle = document.title;
			var triggerDefault = false;
	
			if (window.sidebar && window.sidebar.addPanel) {
				// Firefox version < 23
				window.sidebar.addPanel(bookmarkTitle, bookmarkURL, '');
			} else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) {
				// Firefox version >= 23 and Opera Hotlist
				var $this = $(this);
				$this.attr('href', bookmarkURL);
				$this.attr('title', bookmarkTitle);
				$this.attr('rel', 'sidebar');
				$this.off(e);
				triggerDefault = true;
			} else if (window.external && ('AddFavorite' in window.external)) {
				// IE Favorite
				window.external.AddFavorite(bookmarkURL, bookmarkTitle);
			} else {
				// WebKit - Safari/Chrome
				alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.');
			}
	
			return triggerDefault;
		});
	});
	
	//-->
	</script>
	
	<script type="text/javascript">
<!--
$(document).ready(function() {
	//상단 검색어 - 자동검색어 --> 클릭시 초기화
	$("#topSearchWord").on("click", function() {
			$("#topSearchWord").val("");
			$("#topSearchWord").attr("data-url", "");
			$("#topSearchWord").attr("data-chk", "");
	});

	fnGetTopSearchWord();
});

//자동검색어 랜덤 추출
function fnGetTopSearchWord(){
	var SearchWord = "";
	var SearchURL = "";

	var search_text = getParameterByName("sword");
	//console.log('search_text='+search_text)

	if (search_text == "")
	{
		$.ajax({
			type:"post",
			url:"/common/ajax/exec_getTopSearchWord.asp",
			success:function(data){
				if (data != "")
				{
					SearchWord = data.split("||")[0];
					SearchURL = data.split("||")[1];

					//data = search_txt & "||" & search_url
					$("#topSearchWord").val(SearchWord);
					$("#topSearchWord").attr("data-url", SearchURL);
					$("#topSearchWord").attr("data-chk", "T");
				}
			}
		})
	} else {
		$("#topSearchWord").val(search_text);
	}
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
    results = regex.exec(url);
    if (!results) return "";
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

// 검색확인
function topSearchChk(f) {
	var f=$('#tsFrm');
	//자동검색어 추출
	var val = $("#topSearchWord").val();
	var url = $("#topSearchWord").attr("data-url");
	var chk = $("#topSearchWord").attr("data-chk");

	//자동검색어에 url 있으면 이동 처리
	if (chk == "T" && url != "")
	{
		location.href = url;
		return false;
	}

	if ($("#topSearchWord").val()=="") {
		alert("검색어를 입력해 주세요.");
		$("#topSearchWord").focus();
		return false;
	}

	f.submit();
}
//-->
</script>

<!-- 탬플릿 : 자동완성 탑메뉴 -->
<style type="text/css">
.logoSearchWrap {min-width:1200px; background:#fff;}
.logoSearch {width:1200px; height:100px; margin:0 auto; text-align:left;}
.logoSearch .logo {float:left; width:388px; margin:4px 0 0 0;}
.logoSearch .search {float:left; width:512px; margin-top:18px;}
.logoSearch .search input {float:left; width:376px; height:43px; padding:0 22px; border:none;background:#f4f4f4;border-radius:20px 0 0 20px; color:#000; font-size:14px; line-height:41px; box-sizing:border-box;}
.logoSearch .search input#dummyTxt {position: absolute;}
.logoSearch .search .btn_search {float:left; width:49px; height:43px; padding-top:12px; border-radius:0 20px 20px 0; background:{{COLORTYPE1}}; text-align:center; box-sizing:border-box;}
.logoSearch .search .btn_search .ftic-search {display:inline-block; width:20px; height:20px; margin:-2px 0 0 -2px; color:#fff; font-size:20px; line-height:20px; font-weight:bold; vertical-align:top;}
.logoSearch .search .searchKeyword{clear:both;padding-top:5px;}
.logoSearch .search .searchKeyword ul{padding-left:15px;}
.logoSearch .search .searchKeyword ul li{font-size:14px;color:#999;display:inline-block;padding-right:5px;}
.logoSearch .bannerBX {overflow:hidden;float:right; position:relative; width:230px; height:80px;}
.logoSearch .bannerBX .bnSlide {margin:0; vertical-align:top;}
.logoSearch .bannerBX .bx-wrapper .bx-controls-direction a.bx-prev {position:absolute; top:33px; left:auto; right:21px; width:18px; height:22px; background:url('{{BANNER_SRC:5}}') no-repeat 0 0; text-indent:-999px; overflow:hidden; z-index:60;}
.logoSearch .bannerBX .bx-wrapper .bx-controls-direction a.bx-next {position:absolute; top:33px; left:auto; right:0; width:18px; height:22px; background:url('{{BANNER_SRC:6}}') no-repeat 0 0; text-indent:-999px; overflow:hidden; z-index:60;}


.searchComplete {position: relative;}
.searchComplete .ui-autocomplete {position:absolute !important;left: 0 !important;width: 375px !important;top:43px !important}
.searchComplete .ui-autocomplete.on {display:block !important;}
.searchComplete .ui-autocomplete .ui-menu-item {height: 30px;line-height: 30px;margin-left:1px;}
.searchComplete .ui-autocomplete .ui-menu-item a {display: inline-block;box-sizing:border-box;width: 100%;height: 100%;padding:0 20px;}

.searchComplete .ui-state-active{
  border: 1px solid #eee;
  background: #f5f5f5;
	color: #000;
}


.point {font-weight: 700;color:#f00;}
</style>

<!--// 탬플릿 : 자동완성 탑메뉴 -->

<div class="logoSearchWrap">
	<div class="logoSearch clfix">
		<h1 class="logo"><img src="<%=imgPath%>/logo.png"></h1>
		<div class="search clfix">
			<form id='tsFrm' name="tsFrm" method="get" action="/product/search.asp">
				<!-- 20190716 mempil 기존 검색창
				<input type="text" name="sword" id="topSearchWord" data-url="" data-chk="" placeholder="" />
				-->
				<div class="searchComplete">
					<input type="text" id="dummyTxt" style="display: none;"/>
					<input type="text" autocomplete="targetName" name="sword" id="topSearchWord" onkeyup="return searckResurt(event)" data-url="" data-chk="" placeholder="" />
				</div>
				<div onClick="topSearchChk(document.tsFrm);" class="btn_search" style="cursor:pointer"><span class="iconfont ftic-search"></span></div>
			</form>


			<div class="searchKeyword">
			</div>
		</div>
		<div class="bannerBX">
			<ul class="bnSlide">
				<li>{{BANNER:2}}</li>
				<li>{{BANNER:3}}</li>
				<li>{{BANNER:4}}</li>
			</ul>

			<script type="text/javascript">
      /*
      $(document).ready(function(){
				$('.bnSlide').bxSlider({mode:'fade',auto:true, pager:false, controls:true});
				$('.searchKeyword').load("/common/ajax/exec_getSearchKeyword.asp");
			});
      */
      $('.bnSlide').bxSlider({mode:'fade',auto:true, pager:false, controls:true});
      $('.searchKeyword').load("/common/ajax/exec_getSearchKeyword.asp");

			function searckOk(e){
				if(e.keyCode == 13){
					var $dummyVal = $('#dummyTxt').val();
					$('#topSearchWord').val($dummyVal);
					$('#dummyTxt').hide();
					console.log($dummyVal);
					topSearchChk(document.tsFrm);
				}
			}

			function searckResurt(e){
				if(e.keyCode == 13){
					var $dummyVal = $('#dummyTxt').val();
					$('#topSearchWord').val($dummyVal);
					$('#dummyTxt').hide();
					topSearchChk(document.tsFrm);
				}else if(e.keyCode == 8){
					var $dummyVal = $('#topSearchWord').val();
					$('#dummyTxt').val($dummyVal);
				}else if(e.keyCode == 38 || e.keyCode == 40){
					var $searchData = $('.searchComplete .ui-state-active').text();
					if(!$searchData){
						$searchData = $('#topSearchWord').val();
					}
					$('#dummyTxt').val($searchData);
					return false;
				}else{
					var $dummyVal = $('#topSearchWord').val();
					$('#dummyTxt').val($dummyVal);
					//console.log($dummyVal);
				}


			}


		</script>
		</div>
	</div>
</div>
	
	<script type="text/javascript">
function menuonoff(name){
	$("#submenu"+name).stop(true,true).slideToggle("fast");
	$(".allMenu span").toggleClass("on");
}

</script>

<style type="text/css">
.gnbWrap {position:relative; min-width:1200px; border-bottom:1px solid #dddddd; border-top:1px solid #dddddd; background:#fff; z-index:600;}
.gnbBox {width:1200px; margin:0 auto; overflow:hidden;}
.gnbBox ul {float:right; width:auto; margin:0; line-height:46px; overflow:hidden;}
.gnbBox ul li {float:left; padding:0 25px;}
.gnbBox ul li:first-child {padding:0px; background:none;}
.gnbBox ul li a {color:#000; font-size:15px; font-weight:bold; }
.gnbBox ul li a:hover {text-decoration:none;}
.gnbBox ul li img {margin:-1px 5px 0 0; vertical-align:middle;}
.gnbBox ul li.img img {
	 transform: rotate(0deg);
	 transition:all 0.5s;
}
.gnbBox ul li.img:hover img {
	 transform: rotate(360deg);
	 transition:all 0.5s;
}
.gnbBox ul li.allMenu {width:190px; font-size:15px; font-weight:bold;  text-align:center;}
.gnbBox ul li.allMenu span {cursor:pointer;}
.gnbBox ul li.allMenu span .iconfont {display:inline-block; width:20px; height:20px; font-size:15px; line-height:20px; font-weight:bold; text-align:center; vertical-align:middle; color:#e51b13;}
.gnbBox ul li.allMenu span .iconfont {
	 transform: rotate(0deg);
	 transition:all 0.5s;
}
.gnbBox ul li.allMenu span.on .iconfont {
	transform: rotate(270deg);
	transition:all 0.5s;
}
.gnbBox ul:first-child {float:left;}
.allMenuBox {display:none; position:absolute; left:0; top:48px; width:100%; padding:30px 0; border-bottom:1px solid #dfdfde; background:#fcfcfc; z-index:10;}
.allMenuBox div.inDepthWrap {display:flex;}
.allMenuBox div div.depth1_box {border-right:1px solid #f6f6f4; box-sizing:border-box; text-align:left; padding-left:20px; vertical-align:top; float:left; width:16.666%;}
.allMenuBox div div.depth1_box:first-child {border-left:1px solid #f6f6f4;}
.allMenuBox div div.depth1_box strong {display:block; padding:12px 0 9px; font-size:15px; line-height:24px;}
.allMenuBox div div.depth1_box strong a {color:#000; font-size:15px; font-weight:bold; }
.allMenuBox div div.depth1_box ul {margin:0; line-height:20px;}
.allMenuBox div div.depth1_box ul li {padding:5px 0;}
.allMenuBox div div.depth1_box ul li a {color:#000; font-size:12px;}
.allMenuBox div div.depth1_box ul li a:hover {color:#ff8a0c;}
.submenu1_in {width:{{SITE_WIDTH}}px; overflow:hidden; margin:0 auto;}

@media(min-width:701px) and (max-width:1200px){
   .gnbBox {width: 1200px !important;padding: 0 15px;box-sizing: border-box;}
}
</style>

<div class="gnbWrap" id="gnb">

	<div class="gnbBox">
		<ul>
			<li class="allMenu"><span onclick="menuonoff(1)"><span class="iconfont ftic-allmenu"></span>전체보기</span></li>
			<li style="padding-left:54px;"><a href="/">홈</a></li>
			<li><a href="/product/list.asp?type=timeSale">타임세일</a></li>
			<li><a href="/product/best100.asp?menuType=best">베스트</a></li>
			<li><a href="/product/best100.asp?menuType=new">NEW</a></li>
			<li><a href="/brand.asp">BRAND</a></li>
			<li><a href="/event/event_list.asp">이벤트</a></li>
			<li><a href="/coupon/couponzone.asp">쿠폰</a></li>
			<li><a href="/product/collection_content.asp?uid=1221">비디오샵</a></li>
			<li><a href="/product/setcontent.asp">세트할인</a></li>
			<li><a href="/board/best_list.asp?gubun=P">상품후기</a></li>
			<!--<li><a href="/event/roulette.asp">룰렛</a></li>-->
		</ul>
	</div>

	<div id="submenu1" class="allMenuBox" style=" " >
		<div class="submenu1_in" id="submenu1_in">
		</div>
	</div>
	<script type="text/javascript">

		$("#submenu1_in").ready(
			$.ajax({
				async: true ,
				url:"/common/ajax/exec_fullCategory.asp"	,
				success:function(xhr){
					$("#submenu1_in").html(xhr);
				}
			})
		);

		$("#submenu1").mouseleave(function(){
			$(this).stop(true,true).slideToggle("fast");
			$(".allMenu span").toggleClass("on");
		});
	</script>

</div>
	
	
	<style type="text/css">
.visualWrap {position:relative; min-width:1200px; max-width:1920px; margin:0 auto; overflow:hidden;height:369px;z-index:50;}
.visualWrap .visual_img {position:relative; margin:0; vertical-align:top; z-index:10;}
.visualWrap .visual_img li {display:none; position:absolute; top:0; left:50%; width:1920px; height:369px; margin-left:-960px; text-align:center;}
.visualWrap .visual_img li.on {display:block;}
.visualWrap .simg {overflow:hidden;left: 50%;margin-left:-360px;position: absolute;text-align: left;bottom: 20px;width: 720px;z-index: 15;}
.visualWrap .simg li {float:left; position:relative; background:#fff; color:#000; padding:10px 13px; cursor:pointer; z-index:5; font-size:11px;}
.visualWrap .simg li.on { z-index:10; background:#e51b13; color:#fff;}
.visualWrap .simg li img {width:121px; height:105px; box-sizing:border-box;}
.visualWrap .simg li.on img {border:10px solid #ffd306; box-sizing:border-box;}
.visualWrap .visualPaging {display:none;}
.visualWrap .bx-controls {display:none;}
.visualWrap .prev {position:absolute; top:50%; left:50%; margin-left:-695px; margin-top:-32px; cursor:pointer; z-index:20;}
.visualWrap .next {position:absolute; top:50%; right:50%; margin-right:-695px; margin-top:-32px; cursor:pointer; z-index:20;}

.visualWrap .icon_tit_list {position:absolute; left:50%;bottom:0;margin-left:-598px;text-align:left;width:190px;height:100%;z-index:15; background:#000; box-sizing:border-box; padding:0 10px; overflow:hidden; filter:alpha(opacity=90);opacity:.90;-ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=80);}
.visualWrap .icon_tit_list li:first-child {/*padding-top:24px;*/border-top:none;}
.visualWrap .icon_tit_list li {border-top:1px solid #7b7372; box-sizing:border-box; padding:15px 17px 15px 12px;}
.visualWrap .icon_tit_list li a {font-size:15px; color:#fff;}

.visualWrap .goods_img {position:absolute; right:50%;bottom:0;margin-right:-598px;text-align:left;width:190px;height:100%;z-index:15;  box-sizing:border-box; overflow:hidden;}
.visualWrap .goods_img li img{width:190px; height:184px;}

/*.visualWrap .prev img {   이미지 돌아가는거
	transform: rotate(0deg);
	transition:all 0.5s;
}
.visualWrap .prev:hover img {
	transform: rotate(360deg);
	transition:all 0.5s;
}

.visualWrap .next img {
	transform: rotate(0deg);
	transition:all 0.5s;
}
.visualWrap .next:hover img {
	transform: rotate(360deg);
	transition:all 0.5s;
}*/
</style>

<div class="visualWrap">
	<ul class="visual_img">
		<li class="on">{{BANNER:3}}</li>
		<li>{{BANNER:4}}</li>
		<li>{{BANNER:5}}</li>
		<li>{{BANNER:6}}</li>
		<li>{{BANNER:7}}</li>
		<li>{{BANNER:8}}</li>
		<li>{{BANNER:9}}</li>
		<li>{{BANNER:10}}</li>
	</ul>
	<ul class="simg">
		<li>멤버십혜택</li>
		<li>닥터포헤어1+1</li>
		<li>신규회원30%</li>
		<li>신상틴트1+1</li>
		<li>한정판매</li>
		<li>50%할인</li>
		<li>금액별 사은품</li>
		<li>포인트2배</li>
	</ul>
	<ul class="icon_tit_list">
		<li><a href="/product/sublist.asp?cate=14633">{{BANNER:11}}   뷰티</a></li>
		<li><a href="/product/sublist.asp?cate=14659">{{BANNER:12}}   여성의류</a></li>
		<li><a href="/product/sublist.asp?cate=14694">{{BANNER:13}}   패션잡화</a></li>
		<li><a href="/product/sublist.asp?cate=14695">{{BANNER:14}}   유아용품</a></li>
		<li><a href="/product/sublist.asp?cate=14711">{{BANNER:15}}   아동복</a></li>
		<li><a href="/product/sublist.asp?cate=14722">{{BANNER:17}}   식품</a></li>
		<li><a href="/coupon/couponzone.asp">{{BANNER:18}}   이벤트&쿠폰</a></li>
	</ul>
	<ul class="goods_img">
		<li><a href="#">{{BANNER:19}}</a></li>
		<li><a href="#">{{BANNER:20}}</a></li>
	</ul>
	<div class="visualPaging"></div>
	<span class="prev">{{BANNER:2}}</span>
	<span class="next">{{BANNER:1}}</span>

	<script type="text/javascript">
		$(document).ready(function(){
			$(".simg li").eq(0).addClass("on");
			$(".simg li").eq(0).find("img").addClass("siteborder2");
			$(".visual_img").bxSlider({mode:"fade",auto:true,pagerSelector:".visualPaging", controls:true, onSlideBefore:function($slideElement, oldIndex, newIndex){
					$(".simg li").removeClass("on");
					$(".simg li").find("img").removeClass("siteborder2");
					$(".simg li").eq(newIndex).addClass("on");
					$(".simg li").eq(newIndex).find("img").addClass("siteborder2");
				}
			});
			$(".simg li").each(function(index){
				$(this).click(function(){
					$(".visualPaging .bx-pager-link").eq(index).click();
				});
			});
			$(".visualWrap .prev").click(function(){
				$(".visualWrap .bx-controls .bx-prev").click();
			});
			$(".visualWrap .next").click(function(){
				$(".visualWrap .bx-controls .bx-next").click();
			});
		});
	</script>
</div>

<P>  The time on the server is ${serverTime}. </P>

<%@include file="/WEB-INF/views/includes/footer.jsp"%>