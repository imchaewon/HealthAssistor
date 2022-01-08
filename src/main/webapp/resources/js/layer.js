
function layerFix(version, index){
	var wiw = $(window).width(); // 윈도우 넓이
	var wih = $(window).height(); // 윈도우 높이
	var lyr = $(".layerFix"); // 레이어 전체(장막까지)
	var con; // 레이어 내용(흰색)
	var bg = lyr.find(".layerBg");  // 레이어 내용(흰색)
	var btnOpen = $(".openLayerFix"); // 레이어 열기 버튼
	var btnClose = $(".closeLayerFix"); // 레이어 닫기 버튼

	var cow; // 내용 넓이
	var coh; // 내용 높이
	//var cnt = 0; // 레이어 크기/위치 자동 정렬 변수

	if(version == "open"){
		if (index > 0){
			open(index);
		}else{
			open();
		}
		return;
	}

	btnOpen.on("click",function(){
		var idx = $(this).attr("layerIdx");
		if (idx > 0){
			open(idx);
		}else{
			open();
		}
	});

	btnClose.on("click",function(){
		var idx = $(this).attr("layerIdx");
		closeLayer(idx);
	});
	
	function open(idx){
		lyr.each(function(){
			if ($(this).attr("layeridx") == idx){
				lyr = $(this); // 선택된 레이어 저장
			}
		});

		lyr.addClass("on"); // 레이어 열기
		con = lyr.find(".layerCon");

		cow = con.outerWidth(true) // display:block 이후 내용 넓이 계산
		coh = con.outerHeight(true) // display:block 이후 내용 높이 계산

		if(version == "section"){ //ver.상하단고정, 가운데영역 스크롤, 쓰인페이지 - /addon/m_admin/goods/goods_reg , /m/goods/main , /product/sublist
			lyr.css("opacity",1);
			var st = con.find(".secTop");
			var sm = con.find(".secMid");
			var sb = con.find(".secBot");
			sm.outerHeight(con.outerHeight() - (st.outerHeight() + sb.outerHeight()));
			sm.css("margin-top",st.outerHeight());
		}else{
			var sw;
			if(con.outerWidth() > wiw && con.outerHeight() > wih){ // 내용 넓이/높이가 화면보다 클경우
				con.css({
					"left": 25,
					"width": wiw - 50,
					"top": 25,
					"height": wih - 50,
				});
			}else if(con.outerWidth() > wiw){ // 내용넓이가 화면보다 클경우
				con.css({
					"left": 25,
					"width": wiw - 50,
				});
				sw = 1;
			}else if(con.outerHeight() > wih){ // 내용높이가 화면보다 클경우
				con.css({
					"top": 25,
					"height": wih - 50,
				});
				sw = 2;
			}else{ // 내용 넓이/높이가 화면보다 작을경우
				con.css({
					"top": "50%",
					"left": "50%",
					"margin-left": -(cow / 2),
					"margin-top": -(coh / 2)
				});
			}
			cow = con.outerWidth(true); // 내용 넓이 재계산
			coh = con.outerHeight(true); // 내용 높이 재계산
			switch(sw){ // 내용 위치 재조절
				case 1:
					con.css({
						"top": "50%",
						"margin-top": -(coh / 2)
					});
					break;
				case 2:
					con.css({
						"left": "50%",
						"margin-left": -(cow / 2)
					});
					break;
			}
		}

		lyr = $(".layerFix"); // 레이어변수 재배열화

		$(".gnb_menu, .swiper-pagination.high, .swiper-button-next.high, .swiper-button-prev.high").css("z-index",0);
		$("body").css({overflow:'hidden'}).bind('touchmove', function(e){e.preventDefault()});
		//$("#mobile_wrap").addClass("on"); 모바일 본문스크롤제거용
	}
	
}

function layerTab(img){ //연속적인 탭레이어, 쓰인페이지 - wmallhomepage
	var llink = $(".layerLink");
	var lyr = $(".layerTab");
	llink.children("li").click(function(){
		lyr.addClass("on");
		var idx = $(this).index();
		var idxx = $(".layerTab li:eq("+idx+")");
		lyr.find("li").removeClass("on");
		idxx.addClass("on");
		if(img == 1){ //이미지원본넓이따라
			var idxximg = idxx.find(".image img");
			idxx.width(idxximg.width());
		}
		var lh = idxx.outerHeight();
		var lw = idxx.outerWidth();
		idxx.css({"margin-top":-lh / 2, "margin-left":-lw / 2});
		var wdw = $(window).width();
		var wdh = $(window).height();
		if(lcon.outerWidth() > wdw || lcon.outerHeight() > wdh){
			if(lcon.outerWidth() > wdw){ //내용넓이가 화면보다 클경우
				lcon.css({"height":wdw-50, "margin-top":-((wdw-50) / 2)});
			}
			if(lcon.outerHeight() > wdh){ //내용높이가 화면보다 클경우
				lcon.css({"height":wdh-50, "margin-top":-((wdh-50) / 2)});
			}
		}else{
			lcon.css({"margin-top":-lh / 2, "margin-left":-lw / 2});
		}
		$(".gnb_menu, .swiper-pagination.high, .swiper-button-next.high, .swiper-button-prev.high").css("z-index",0);
	})
}

function closeLayer(idx){
	var lyr = $(".layerFix, .layerTab");
	var con;

	if(idx > 0){ // 레이어 여러개 쓸경우
		lyr = $(".layerFix[layerIdx=" + idx + "], .layerTab[layerIdx=" + idx + "]");
	}
	
	lyr.removeClass("on"); // 레이어 닫기

	con = lyr.find(".layerCon")
	con.removeAttr("style",""); // 정렬 초기화

	$(".gnb_menu, .swiper-pagination.high, .swiper-button-next.high, .swiper-button-prev.high").css("z-index",1000);
	$("body").css({overflow:'auto'}).unbind('touchmove');
	//$("#mobile_wrap").removeClass("on"); 모바일 본문스크롤생성용
}








