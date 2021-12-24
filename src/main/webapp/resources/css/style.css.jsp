<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
	String cstColor1 = "#486BB8";
	String cstColor2 = "#699eff";
%>  
<style>

@font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:100;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:300;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:400;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:500;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:700;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:900;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

body, h1, h2, h3, h4, h5, h6, input, textarea, select{font-family:'Noto Sans KR', sans-serif;}
body{background:#fff;}
li,a{color:#333;}

html,body{overflow-x:hidden;}
::-webkit-scrollbar{width:10px;}
::-webkit-scrollbar-track{background:#fff;}
::-webkit-scrollbar-thumb{background:#aaa}

.sitebg1{background:<%=cstColor1%> !important;}
.sitebg2{background:<%=cstColor2%> !important;}

.btn01{display:inline-block;width:100%;height:56px;line-height:56px;font-size:18px;color:#fff;font-weight:bold;text-align:center;background:<%=cstColor2%>;}
.btn02{display:inline-block;width:49%;height:56px;line-height:56px;font-size:18px;color:#fff;font-weight:bold;text-align:center;background:<%=cstColor2%>;}

.star-five{margin:50px 0;position:relative;display:block;color:<%=cstColor1%>;width:0px;height:0px;border-right:100px solid transparent;border-bottom:70px solid <%=cstColor1%>;border-left:100px solid transparent;transform:rotate(35deg);pointer-events:none;}
.star-five:before{border-bottom:80px solid <%=cstColor1%>;border-left:30px solid transparent;border-right:30px solid transparent;position:absolute;height:0;width:0;top:-45px;left:-65px;display:block;content:'';transform:rotate(-35deg);}
.star-five:after{position:absolute;display:block;color:<%=cstColor1%>;top:3px;left:-105px;width:0px;height:0px;border-right:100px solid transparent;border-bottom:70px solid <%=cstColor1%>;border-left:100px solid transparent;transform:rotate(-70deg);content:'';}

.radio .star-five,
.checkbox .star-five{transform:rotate(35deg) scale(.08);position:absolute;left:-94px;top:-86px;}
.radio label, .checkbox label{padding-left:15px;}
.radio label:nth-of-type(1),
.checkbox label:nth-of-type(1){padding-left:0;margin-left:0;}
.checkbox label:after, 
.radio label:after{content:'';display:table;clear:both;}
.checkbox .cr,
.radio .cr{position:relative;display:inline-block;border:1px solid #a9a9a9;border-radius:.25em;width:20px;height:20px;display:inline-block;margin-right:5px;box-sizing:border-box;}
.radio span{vertical-align:middle;}
.radio .cr{border-radius:50%;}
.checkbox .cr .cr-icon,
.radio .cr .cr-icon{position:absolute;font-size:.8em;border-color:<%=cstColor1%>;line-height:0;top:55%;left:15%;}
.radio .cr .cr-icon{margin-left:0.04em;}
.checkbox label input[type="checkbox"],
.radio label input[type="radio"]{display:none;}
.checkbox label input[type="checkbox"] + .cr > .cr-icon,
.radio label input[type="radio"] + .cr > .cr-icon{transform:scale(3) rotateZ(-20deg);opacity:0;transition:all .3s ease-in;}
.checkbox label input[type="checkbox"]:checked + .cr,
.radio label input[type="radio"]:checked + .cr{border-color:#486BB8;}
.checkbox label input[type="checkbox"]:checked + .cr > .cr-icon,
.radio label input[type="radio"]:checked + .cr > .cr-icon{transform:scale(1) rotateZ(0deg);opacity:1;}
.radio label input[type="radio"]:disabled + .cr{opacity:.5;}

.mgt0{margin-top:0 !important;}
.mgt5{margin-top:5px !important;}
.mgt10{margin-top:10px !important;}
.mgt20{margin-top:20px !important;}
.mgt30{margin-top:30px !important;}
.mgt40{margin-top:40px !important;}
.mgt50{margin-top:50px !important;}

.mgl0{margin-left:0 !important;}
.mgl10{margin-left:10px !important;}
.mgl20{margin-left:20px !important;}

.flex{display:flex;justify-content:center;align-items:center;}
.flex-b{display:flex;justify-content:space-between;align-items:center;}



.topWrap{width:1200px;margin:auto;display:flex;justify-content:space-between;align-items:center;padding:50px 0 20px;}
.topWrap .gnb ul{padding-top:20px}

.searchWrap{float:left; width:430px;}
.searchWrap input{float:left; width:376px; height:43px; padding:0 22px; border:none;background:#f4f4f4;border-radius:20px 0 0 20px; color:#000; font-size:14px; line-height:41px; box-sizing:border-box;}
.searchWrap .btn_search{float:left; width:49px; height:43px; padding-top:12px; border-radius:0 20px 20px 0; background:<%=cstColor2%>; text-align:center; box-sizing:border-box;}
.searchWrap .btn_search i.fa{display:inline-block; width:20px; height:20px; margin:-1px 0 0 -3px; color:#fff; font-size:20px; line-height:20px; font-weight:bold; vertical-align:top;}

.topWrap .rgtWrap{text-align:right;}
.topWrap .rgtWrap > ul{font-size:0;}
.topWrap .rgtWrap > ul > li{display:inline-block;font-size:14px;position:relative;vertical-align:top;}
.topWrap .rgtWrap > ul > li:before{content:"";padding-left:15px;margin-left:15px;border-left:1px solid #999;height:10px;font-size:14px;}
.topWrap .rgtWrap > ul > li:first-of-type:before{display:none;}
.topWrap .rgtWrap > ul > li.my{overflow:hidden;}
.topWrap .rgtWrap > ul > li.my:after{content:"\f078";font:normal normal normal 14px/1 FontAwesome;color:#666;}
.topWrap .rgtWrap > ul > li.my:hover{overflow:visible;}
.topWrap .rgtWrap > ul > li.my:hover:after{content:"\f077";}
.topWrap .rgtWrap > ul > li.my:hover ul{height:142px;border-color:#666;}
.topWrap .rgtWrap > ul > li.my:hover ul li{border-color:#666;}
.topWrap .rgtWrap ul li ul{transition:all .5s cubic-bezier(0.22, 0.61, 0.36, 1);height:0;position:absolute;right:0;top:20px;z-index:20;border:1px solid transparent;font-size:0;background:#fff;overflow:hidden;}
.topWrap .rgtWrap ul li ul li{border-top:1px solid transparent;padding:5px 10px;font-size:12px;transition:all .5s cubic-bezier(0.22, 0.61, 0.36, 1);}
.topWrap .rgtWrap ul li ul li:first-of-type{border-top:0;}

.gnbWrap{position:relative;min-width:1200px;border-bottom:1px solid #ddd;border-top:1px solid #ddd;background:#fff;z-index:10;}
.gnbBox{width:1200px; margin:0 auto; overflow:hidden;}
.gnbBox ul{line-height:46px;display:flex;justify-content:center;}
.gnbBox ul li{padding:0 40px;}
.gnbBox ul li a{color:#000; font-size:15px; font-weight:bold;}





.member_wrap{width:800px; padding-top:70px; margin:0 auto; text-align:left;}
.member_wrap.login{width:360px;} /*로그인페이지만 너비작게*/
.member_wrap.formType2{padding-top:0;}
.member_wrap .title{height:84px; padding-bottom:8px; border-bottom:3px solid #2e2e2e; font-size:30px; line-height:30px; font-weight:bold;}
.member_wrap.formType2 .title{height:74px; line-height:74px; margin-bottom:10px; padding-bottom:0;}
.member_wrap .title span.subpw_change{height:84px; padding-bottom:21px; font-size:30px; line-height:81px; font-weight:bold;}
.member_wrap .warnt{height:40px;padding-bottom:5px;margin-top:-45px;color:#000;font-size:15px;line-height:37px;text-align:right;}
.member_wrap p.change_noti{box-sizing:border-box; padding:15px 15px 0 10px; text-indent:-7px; font-size:12px; color:#7e7e7e;}

.member_wrap .pw_change_btn_box{text-align:center; border-bottom:1px solid #2e2e2e; padding-bottom:30px; margin-bottom:15px;}
.member_wrap .pw_change_btn_box a{display:inline-block; width:49.5%;}
.member_wrap .login_input > li .notif{color:#888; font-size:13px; line-height:18px; padding:0 20px 2px;}
.member_wrap .title .ftic-join,
.member_wrap .title .ftic-id,
.member_wrap .title .ftic-pw{font-size:32px; font-weight:bold;}
.member_wrap .title span{font-size:15px;}
.member_wrap .title02{padding-top:15px; overflow:hidden;}
.member_wrap .title02 .img{float:left;}
.member_wrap .title02 .txt{display:block; padding:8px 0 0 96px; color:#000; font-size:30px; line-height:40px; font-weight:bold;}
.member_wrap .title02 .txt .p{display:block; padding:0 2px; color:#888; font-size:13px; line-height:22px;}
.member_wrap .login_input{margin-top:20px;}
.member_wrap .login_input.patop{padding-top:15px}
.member_wrap .login_input li{margin-bottom:10px;}
.member_wrap .login_input li input[type="text"],
.member_wrap .login_input li input[type="password"]{width:100%; height:65px; padding:0 0 0 13px; margin:0; border:1px solid #a3a3a3; font-size:15px; line-height:62px; box-sizing:border-box;}

.member_wrap .cklabel{display:inline-block; position:relative; overflow:hidden; font-size:15px; color:#5f5f5f; padding-left:28px; line-height:24px;}
.member_wrap .cklabel.on .iconfont{color:<%=cstColor1%>}
.member_wrap .cklabel .iconfont{position:absolute; top:50%; left:0; width:24px; height:24px; color:#999; font-size:24px; line-height:28px; font-weight:bold; text-align:center;margin-top:-12px;}

.member_wrap .ck_login input{position:absolute; left:-9999px;}
.member_wrap .member_link{margin-top:20px; color:#c5c5c5; font-size:15px; line-height:34px; text-align:center;}
.member_wrap .member_link a{display:inline-block; margin:-5px 15px 0;  vertical-align:middle;}


.joinstep{overflow:hidden;}
.joinstep ul{font-size:0; border:1px solid #dcdcdc; border-top:none; border-bottom:none; box-sizing:border-box; padding:50px 80px 0 80px;}
.joinstep ul li{position:relative;box-sizing:border-box;display:inline-block; width:50%; color:#777777; text-align:center; background:#f3f3f3; padding:20px 0; border-top:1px solid #dadada ; border-bottom:1px solid #dadada ;}
.joinstep ul li:first-child{border-left:1px solid #dadada;}
.joinstep ul li:last-child{border-right:1px solid #dadada;}
.joinstep ul li .step{overflow:hidden;}
.joinstep ul li .step > div{display:inline-block;font-size:18px; vertical-align:middle;}
.joinstep ul li .step > div.icon{width:50px; height:50px; border-radius:100%; background:#fff; line-height:50px; margin-right:10px;}
.joinstep ul li .step > div.icon .iconfont{font-size:30px;}
.joinstep ul li .step > div.text{}
.joinstep ul li.on{background:#fff;}
.joinstep ul li .next{position:absolute; right:-25px; top:50%; margin-top:-25px; width:50px; height:50px; line-height:50px; border-radius:100%; font-size:30px; z-index:10;}
.joinstep ul li.on .next{background:#fff;}
.joinstep ul li .next .iconfont{font-size:30px;}

.member_wrap .join_list{padding-top:15px; font-size:0; line-height:0;}
.member_wrap .join_list input[type=text],
.member_wrap .join_list input[type=password]{width:100%;}
.member_wrap .join_list > li{margin-top:7px;}
.member_wrap .join_list > li .wrap{padding:10px 20px;box-sizing:border-box;border:1px solid #c4c4c4;}
.member_wrap .join_list > li > p{font-size:13px;height:22px;line-height:22px;color:<%=cstColor1%>}
.member_wrap .join_list > li div,
.member_wrap .join_list > li label,
.member_wrap .join_list > li input,
.member_wrap .join_list > li select{font-size:15px;line-height:26px;}
.member_wrap .join_list > li label,
.member_wrap .join_list > li label > div{display:inline-block;vertical-align:top;}
.member_wrap .join_list > li div.tit{padding-bottom:5px;}
.member_wrap .join_list > li div.tit+div{}
.member_wrap .join_list > li label input[type=checkbox]+span.txt{margin-right:15px;font-size:13px;color:#888;}
.member_wrap .join_list > li input.text{height:55px; padding:0 20px; margin-left:5px; color:#92979b; font-weight:bold; line-height:50px;}
.member_wrap .join_list > li input.text::-webkit-input-placeholder{
color:#92979b;
}
.member_wrap .join_list > li input.text:-moz-placeholder{
color:#92979b;
}
.member_wrap .join_list > li input.text::-moz-placeholder{
color:#2e2e2e;
}
.member_wrap .join_list > li input.text:-ms-input-placeholder{
color:#92979b;
}
.member_wrap .join_list > li input:first-child,
.member_wrap .join_list > li .select_option:first-child{margin-left:0;}
.member_wrap .join_list > li .select_option{height:55px; margin-left:5px; color:#92979b; font-weight:bold;}
.member_wrap .join_list > li .select_option .active_cont{height:53px; padding:0 35px 0 20px; line-height:50px;}
.member_wrap .join_list > li .select_option .option_list{top:52px;}
.member_wrap .join_list > li .select_option .option_list li{padding:10px 20px;}
.member_wrap .join_list > li .btn_gray_board{width:183px; height:55px; margin-right:4px; line-height:52px;}
.member_wrap .join_list > li .btn_check{display:inline-block; width:120px; height:55px; margin-left:10px; background:#92979b; color:#fff; font-size:15px; line-height:52px; text-align:center; font-weight:bold; vertical-align:top; cursor:pointer;}
.member_wrap .join_list > li .notif{padding-left:20px; color:#888; font-size:13px; line-height:24px;}

.member_wrap .join_list > li.actType label{display:block;padding-left:0}


/****************************** form 내부 태그 ******************************/
/* 셀렉트박스 */
.select_option{display:inline-block; position:relative; height:35px; border:1px solid #c4c4c4; color:#000; box-sizing:border-box; text-align:left; vertical-align:middle; z-index:500;}
.select_option.focus{border:1px solid <%=cstColor1%>; z-index:550;}
.select_option .active_cont{display:block; height:33px; padding:0 35px 0 10px; font-size:15px; line-height:33px; cursor:pointer; overflow:hidden;}
.select_option .active_cont:before {content:"\e629";font-family:"iconfont";position:absolute;right:15px;}
.select_option .active_cont .name{float:left;}
.select_option .active_cont .prc{float:right;}
.select_option .active_cont .prc em{font-weight:bold; font-style:normal;}
.select_option .option_list{display:none; position:absolute; top:33px; left:0; width:100%; max-height:204px; margin:0 0 0 -1px; border:1px solid #c4c4c4; background:#fff; font-size:12px; line-height:14px; overflow:hidden; overflow-y:auto;}
.select_option .option_list.on{display:block; border:1px solid <%=cstColor1%>;}
.select_option.focus .option_list{display:block; border:1px solid <%=cstColor1%>;}
.select_option .option_list li{padding:10px; cursor:pointer; overflow:hidden;}
.select_option .option_list li:hover{background:#e1e1e1;}
.select_option .option_list li .name{float:left;}
.select_option .option_list li .prc{float:right;}
.select_option .option_list li .prc em{font-weight:bold; font-style:normal;}

/* input */
input.text{height:35px; padding:0 10px; margin:0; border:1px solid #c4c4c4; font-size:15px; line-height:33px; box-sizing:border-box;}
input.text.paging{width:50px; vertical-align:top;}
input.count{height:25px; padding:0; margin:0; border:1px solid #c4c4c4; color:#000; font-size:12px; line-height:23px; text-align:center; font-weight:bold; box-sizing:border-box;}
input.checkbox{padding:0; margin:-2px 0 0 0;}
input.radio{padding:0; margin:-2px 0 0 0;}
/* 글자수 제한 */
.limit_box{display:inline-block; position:relative;}
.limit_box input.text{padding-right:75px;}
.limit_box span{position:absolute; top:0; right:0; width:75px; color:#888; font-size:12px; line-height:35px; text-align:center;}

/* textarea */
.textarea_box{position:relative; padding-bottom:29px; border:1px solid #c4c4c4; background:#fff; box-sizing:border-box;}
.textarea_box p{position:absolute; right:10px; bottom:0; color:#8a8a8a; font-size:12px; line-height:29px;}
textarea.textarea{width:100%; padding:5px 10px; margin:0; border:none; font-size:15px; line-height:20px; box-sizing:border-box; overflow:hidden; overflow-y:auto; resize:none;}
.textarea_option{width:100%; margin-top:10px; font-size:14px; line-height:20px;}
.textarea_option .intop{padding:5px 0;}
.textarea_option .intop .stt{display:inline-block; margin-right:15px;}
.textarea_option .intop .prc{display:inline-block; margin-right:15px;}
.textarea_option .intop .wn{display:inline-block; margin-right:15px;}
.textarea_option textarea{width:100%; max-width:100%; height:35px; min-height:35px; padding:0 10px; border:1px solid #c4c4c4; font-size:15px; line-height:33px; box-sizing:border-box;}



</style>