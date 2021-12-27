<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="leftMenu">
	<ul>
		<li><a href="/my/main">내 정보 관리</a></li>
		<li><a href="/my/post">내 게시글</a></li>
		<li><a href="/my/comment">내 댓글</a></li>
		<li><a href="/my/message">받은 쪽지</a></li>
		<li><a href="/my/change_pw">비밀번호 변경</a></li>
		<li><a href="/my/secession">회원탈퇴</a></li>
		<!-- <li>
			<a href="#">2단메뉴 제목</a>
			<ul>
				<li><a href="#">2단메뉴 내용</a></li>
				<li><a href="#">2단메뉴 내용</a></li>
			</ul>
		</li> -->
	</ul>
</div>


<script>
	$(".left_menu>ul>li").each(function(){
	
		var url = window.location.pathname;
		var href = $(this).children("a").attr("href");
		
		if ($(this).find("ul").length) {
			$(this).addClass("depth")
		}
		if(href == url){
			$(this).addClass("on");
			
			$(this).find("li").eq(0).addClass("on");
			$(this).find("li").each(function(){
				href = $(this).children("a").attr("href");
				if (href.substr(href.lastIndexOf("?") + 1,href.length) == "") {
					$(this).siblings().removeClass("on");
					$(this).addClass("on");
				}
				
			});
		}
	});

	$(".left_menu>ul>li").mouseenter(function(){
			$(this).find("ul").stop().slideDown();
	});
	$(".left_menu>ul>li").mouseleave(function(){
		if (!$(this).hasClass("on")) {
			$(this).find("ul").stop().slideUp();
		}
	});
	


</script>






