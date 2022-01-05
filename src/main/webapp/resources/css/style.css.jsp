<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
	String cstColor1 = "#486BB8";
	String cstColor2 = "#699eff";
%>  
<style>

@font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:100;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:300;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:400;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:500;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:700;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face{font-family:'Noto Sans KR';font-style:normal;font-weight:900;src:url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

@keyframes slideDown{
	0% {opacity:0;height:0;}
	100% {opacity:1;height:150px;}
}

body, h1, h2, h3, h4, h5, h6, input, textarea, select{font-family:'Noto Sans KR', sans-serif;}
html,body{/*overflow-x:hidden;*/}
body{min-height:900px;background:#fff;}
li,a{color:#333;}

::-webkit-scrollbar{width:10px;}
::-webkit-scrollbar-track{background:#fff;}
::-webkit-scrollbar-thumb{background:#aaa}

.sitebg1{background:<%=cstColor1%> !important;}
.sitebg2{background:<%=cstColor2%> !important;}

.btn01{display:inline-block;width:100%;height:56px;line-height:56px;font-size:18px;color:#fff;font-weight:bold;text-align:center;background:<%=cstColor2%>;}
.btn02{display:inline-block;width:49%;height:56px;line-height:56px;font-size:18px;color:#fff;font-weight:bold;text-align:center;background:<%=cstColor2%>;}
.btn03{display:inline-block;height:45px;padding:0 28px;background:<%=cstColor2%>;color:#fff;font-size:14px;line-height:43px;font-weight:bold;text-align:center;vertical-align:middle;box-sizing:border-box;cursor:pointer;border:0;}
.bg_gray{background:#92979b;color:#fff;}
.al-c{text-align:center !important;}

.tab03{position:relative; width:100%; margin-top:20px; overflow:hidden; z-index:10;}
.tab03 a{float:left; width:50%; height:60px; border:1px solid #e7e7e7; border-left:none; background:#ccc; color:#fff; font-size:15px; line-height:57px; font-weight:bold; text-align:center; box-sizing:border-box;}
.tab03 a:first-child{border-left:1px solid #e7e7e7;}
.tab03 a.on{border-bottom:1px solid #fff; background:#fff; color:#2e2e2e;}

#msg_CapsLock{color:red}

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

.cbrdS1 label{vertical-align:middle;display:inline-block;line-height:30px;cursor:pointer;}
.cbrdS1 label + label{padding-left:10px;}
.cbrdS1 label input[type=checkbox],label input[type=radio]{position:absolute;left:-9999px;}
.cbrdS1 label input[type=checkbox] + span{content:"";display:inline-block;width:20px;height:20px;background:url(/resources/images/sp_input.png) no-repeat -26px -26px;background-size:46px;vertical-align:middle;padding-right:3px;}
.cbrdS1 label input[type=checkbox] + span + span{vertical-align:middle;}
.cbrdS1 label input[type=checkbox]:checked + span{background-position:0 -26px;}
.cbrdS1 label input[type=checkbox]:disabled + span{opacity:.5;}
.cbrdS1 label input[type=radio] + span{content:"";display:inline-block;width:20px;height:20px;background:url(/resources/images/sp_input.png) no-repeat -26px 0;background-size:46px;vertical-align:middle;padding-right:3px;}
.cbrdS1 label input[type=radio]:checked + span{background-position:0 0;}
.cbrdS1 label input[type=radio]:disabled+ span{opacity:.5;}

label.switch{position:relative;display:inline-block;vertical-align:middle;width:56px;height:28px;padding:0;}
label.switch input{display:none;}
label.switch input + :after{content:"Off";font-size:14px;color:#fff;font-weight:bold;width:56px;text-align:right;display:inline-block;padding:0 8px;box-sizing:border-box;line-height:28px;vertical-align:top;}
label.switch input + div.slider{position:absolute;cursor:pointer;top:0;left:0;right:0;bottom:0;background-color:#ccc;-webkit-transition:.4s;transition:.4s;border-radius:5px;}
label.switch input + div.slider:before{position:absolute;content:"";height:16px;width:16px;left:6px;top:6px;background-color:white;-webkit-transition:.4s;transition:.4s;border-radius:5px;}
label.switch input:checked + .slider{background-color:#2196F3;}
label.switch input:checked + :after{content:"On";font-size:14px;color:#fff;font-weight:bold;line-height:28px;text-align:left;}
label.switch input:focus + .slider{box-shadow:0 0 1px #2196F3;}
label.switch input:checked + .slider:before{-webkit-transform:translateX(31px);-ms-transform:translateX(31px);transform:translateX(27px);background:deepskyblue;}

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

.tipTxt{color:#666;letter-spacing:-.6px;padding-top:5px;}



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
.topWrap .rgtWrap > ul > li.my:hover ul{height:111px;border-color:#666;}
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

.member_wrap .find_cont{margin-top:-1px; padding:28px; border:1px solid #e7e7e7; background:#fff;}
.member_wrap .find_cont .form_list{font-size:0; line-height:0;}
.member_wrap .find_cont .form_list > li{font-size:14px;line-height:14px;margin-top:5px;}
.member_wrap .find_cont .form_list > li input.text{height:55px; margin-left:5px; line-height:50px;}
.member_wrap .find_cont .form_list > li input:first-child,
.member_wrap .find_cont .form_list > li .select_option:first-child{margin-left:0;}
.member_wrap .find_cont .form_list > li p{font-size:14px;padding-bottom:10px;}
.member_wrap .find_cont .form_list > li p + .select_option{margin-left:0;}
.member_wrap .find_cont .form_list > li .select_option{height:55px; margin-left:5px;}
.member_wrap .find_cont .form_list > li .select_option .active_cont{height:53px; line-height:50px;}
.member_wrap .find_cont .form_list > li .select_option .option_list{top:53px;}
.member_wrap .find_cont .form_list > li .btn_check{display:inline-block; width:119px; height:55px; margin-left:5px; background:#92979b; color:#fff; font-size:15px; line-height:52px; text-align:center; font-weight:bold; vertical-align:top; cursor:pointer;}


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


.sub_content{width:1200px;margin:auto;overflow:hidden;}

.leftMenu{float:left;width:16%;margin-top:50px;position:relative;}
.leftMenu:before{content:"";position:absolute;right:40px;top:0;bottom:0;border-right:1px solid #ddd;}
.leftMenu li{line-height:28px;}
.leftMenu li.on > a{color:#486BB8;}
.leftMenu li.depth{background:url("/sybang/images/bottom_icon.png")no-repeat 90% 10px/8px;}
.leftMenu li.depth.on ul{display:block !important;}
.leftMenu li a{font-size:14px;color:#333;font-weight:bold;margin:4px 16px 6px;}
.leftMenu li ul{display:none;text-indent:15px;}
.leftMenu li li:last-of-type{padding-bottom:10px;}

.conWrap{float:right;width:84%;margin-top:50px}
.conWrap .btnWrap{padding-top:15px;text-align:center;}
.conWrap .pagebar{position:relative;text-align:center;}
.conWrap .pagination{margin:20px 0 0}

.titleS1{font-size:17px;color:#333;position:relative;height:54px;margin-top:0;padding:0 20px;border:1px solid #c9c9c9;font-weight:bold;line-height:54px;letter-spacing:-1px;}
.titleS2{font-size:22px;text-align:center;margin-bottom:25px;}
.titleS3{font-size:24px;text-align:center;color:#666;padding:20px 0 50px;position:relative;}
.titleS3:before{content:"";border-bottom:2px solid #999;position:absolute;bottom:25px;left:calc(50% - 25px);width:50px}
.subTitleS1{font-size:14px;padding:15px 0 5px;}
.subTitleS1:before{content:">";font-size:12px;color:#3191b7;padding-right:5px;vertical-align:top;line-height:25px;}
.subTitleS1.t2{background:#F5F5F5;line-height:30px;position:relative;padding:10px 15px;box-sizing:border-box;margin:15px 0 5px;border:1px solid #E5E6E8;font-size:14px;}
.subTitleS1.t2:before{line-height:30px}
.subTitleS1.t2 span{color:tomato;font-weight:bold;}

.tlS1{width:100%;border:1px solid #c9c9c9;border-collapse:collapse;}
.tlS1 select{appearance:none;-webkit-appearance:none;-moz-appearance:none;border-radius:0px; border:1px solid #c4c4c4;box-sizing:border-box;color:#2e2e2e;font-size:15px;background:#fff url("/sybang/images/ico_select.gif") no-repeat scroll right center;height:33px;line-height:20px;padding-right:30px;padding-left:3px; text-align:left;width:100%;vertical-align:middle;}
.tlS1 .wauto select{width:auto;}
.tlS1 select::-ms-expand{ display:none;}
.tlS1 textarea{border:1px solid #c9c9c9;width:100%;height:350px;resize:none;padding:10px;box-sizing:border-box;outline:0;}
.tlS1 td ,
.tlS1 th{border:1px solid #c9c9c9;padding:8px;color:#000;font-size:13px;background:#fff;}
.tlS1 th{text-align:left;background:#f0f0f0;color:#000;font-size:14px;}
.tlS1 input[type='text']{height:33px;font-size:14px;color:#000;box-sizing:border-box;padding:0 10px;border:1px solid #c9c9c9;outline:0;}
.tlS1 input[type='file']{width:100%;height:auto !important;padding:5px !important;}
.tlS1 input.box{height:33px;color:#000;box-sizing:border-box;padding:0 10px;border:1px solid #c9c9c9;box-sizing:border-box;margin-right:5px;}

.tlS2 {width:100%; border:1px solid #c9c9c9; border-collapse:collapse; text-align:center;}
.tlS2 td ,
.tlS2 th {border:1px solid #c9c9c9; color:#000; font-size:13px; background:#fff;padding:15px;}
.tlS2 th { border:1px solid #c9c9c9; background:#f0f0f0; background-size:auto 100%; color:#000; font-size:14px;text-align:center;}
.tlS2 select {appearance:none; -webkit-appearance:none; -moz-appearance:none; border-radius:0px;  border:1px solid #c4c4c4; box-sizing:border-box; color:#2e2e2e; font-size:15px; background:#fff url("/sybang/images/ico_select.gif") no-repeat scroll right center; height:33px; line-height:20px; padding-right:30px; padding-left:3px;  text-align:left; width:100%;vertical-align:middle;}
.tlS2 select::-ms-expand { display:none; }
.tlS2 input[type='text'] {height:33px; color:#000; box-sizing:border-box; padding:0 2px; border:1px solid #c9c9c9;text-align:left;}
.tlS2 input[type='file'] {width:100%;height:auto !important;padding:5px !important;}
.tlS2 textarea {border:1px solid #c9c9c9;}
.tlS2.hoverstyle td,
.tlS2.hoverstyle th{background:none;}

.tipBox{background:#F5F5F5;line-height:24px;position:relative;padding:10px 15px;box-sizing:border-box;margin-top:35px;border:1px solid #E5E6E8;}
.tipBox.type2{padding:0;}
.tipBox:before{content:"";display:inline-block;border-bottom:8px solid rgba(0,0,0,0);border-left:8px solid #FF8B33;background:none;vertical-align:middle;position:absolute;top:-8px;left:20px;}
.tipBox:after{content:"tip";display:inline-block;line-height:17px;height:19px;padding:0 8px;border-radius:3px;background:#FF8B33;color:#fff;position:absolute;left:0;top:-24px;font-size:12px;}

.paging {background:#fcfcfb; font-size:0; line-height:0; text-align:center;}
.paging a{display:inline-block; width:30px; height:30px; color:#000; font-size:12px; line-height:28px;vertical-align:middle;}
.paging a.on{border-radius:100%; border:1px solid <%=cstColor1%>; background:<%=cstColor2%>; color:#fff; font-weight:bold;}
.paging a.prev,
.paging a.next{width:26px;height:20px;color:#000;font-size:14px;font-weight:bold;text-indent:-9999px;}
.paging a.prev{background:url(/resources/images/btn_paging_prev.png) no-repeat right center/100%;}
.paging a.next{background:url(/resources/images/btn_paging_next.png) no-repeat right center/100%;}


.community{width:1000px;margin:auto}
.community .panel-heading{font-size:14px;}
.community .panel-heading b{vertical-align:middle;color:<%=cstColor1%>}
.community .panel-heading span{vertical-align:middle;}
.community .panel-body{padding:15px 15px 30px;}
.community .table>thead>tr>th{padding:12px 10px;text-align:center;}
.community table tbody td{text-align:center;}
.community table tbody td:nth-of-type(2){text-align:left;}
.community .wrap{position:relative;margin-top:40px;padding:0 15px;}
.community .wrap #searchForm select{width:120px;height:30px;background:url(/resources/images/ico_arrow_down.png)no-repeat right 5px center/13px 7px;appearance:none;padding:0 5px;border:1px solid #999;outline:0}
.community .wrap #searchForm input[name=keyword]{height:24px;}
.community .wrap #searchForm .btn03{height:30px;line-height:30px;padding:0 15px;}
.community .wrap .btnReg{position:absolute;right:15px;top:-8px;}

.community_detail{width:1000px;margin:auto}
.community_detail table .page-header{amrgin-top:30px;}
.community_detail table .tit{font-weight:bold;}
.community_detail table .cnt{color:#666;}
.community_detail table .content{min-height:150px;}

.community_detail .comment{border-top:2px solid #ddd;border-bottom:1px solid #ddd;margin-top:20px;padding-bottom:10px;}
.community_detail .comment li{font-size:0;margin-top:10px;padding-top:10px;border-top:1px solid #ddd;}
.community_detail .comment li:nth-of-type(1){border-top:0;margin-top:0;}
.community_detail .comment li span{display:inline-block;font-size:14px;vertical-align:top;}
.community_detail .comment li.empty{padding:30px 0 20px;}
.community_detail .comment li.empty p{font-size:16px;text-align:center;}
.community_detail .comment li .writer{width:15%;}
.community_detail .comment li .content{width:65%;}
.community_detail .comment li .date{width:20%;text-align:right;}

.community_detail .writeCmt{overflow:hidden;margin-top:20px;}
.community_detail .writeCmt textarea{float:left;resize:none;width:calc(100% - 130px);height:90px;box-sizing:border-box;border-color:#999;padding:10px;outline:0;line-height:20px;}
.community_detail .writeCmt .btnWriteCmt{float:right;width:120px;height:90px;line-height:90px;}

.community_detail .btnWrap{margin:30px -5px 0;text-align:right;}
.community_detail .btnWrap a{margin:0 5px;}



.body_type{width:1000px;margin:auto;text-align:center;}
.body_type h1{font-size:22px;margin-top:30px;}
.body_type .stit{font-size:14px;color:#666;margin-top:15px;}
.body_type .gender{margin-top:30px;}
.body_type .info{width:400px;margin:auto;font-size:0;}
.body_type .info dl{display:inline-block;width:50%;margin-top:20px;}
.body_type .info dt{display:inline-block;width:30%;text-align:right;font-size:14px;box-sizing:border-box;padding-right:5px;vertical-align:middle;}
.body_type .info dd{display:inline-block;width:70%;text-align:left;font-size:12px;vertical-align:middle;}
.body_type .info dd input{width:calc(100% - 50px);height:24px;}
.body_type .info + p{margin:20px 0 30px;}
.body_type .ani{font-size:30px;height:0;opacity:0;overflow:hidden;}
.body_type .ani.on{animation:slideDown .5s ease-in-out;}
.body_type #result{width:450px;margin:20px auto 0;}
.body_type #result > .tit{font-size:16px;}
.body_type #result > .tit .type{position:relative;}
.body_type #result > .tit b{position:relative;font-size:22px;color:<%=cstColor1%>;}
.body_type #result > .tit .wave{position:absolute;left:0;bottom:-13px;z-index:-1;width:100%;}
.body_type #result > .tit .star{position:absolute;top:-5px;right:-7px;z-index:-1;}
.body_type #result .tit .val{padding-top:5px;}
.body_type #result .bmi{padding-left:5px;color:#666}
.body_type #result dl{padding-top:20px;}
.body_type #result dl dt{padding-bottom:5px;margin-bottom:5px;border-bottom:1px dashed #ddd;}
.body_type #result dl dt span{color:<%=cstColor2%>}
.body_type #result dl dd{word-break:keep-all;line-height:20px;}


.daily_info{position:relative;}
.daily_info #calendar-container {position: relative;z-index: 1;margin-left: 200px;}
.daily_info #external-events {position:absolute;top:49px;left:calc(50% - 740px);z-index: 10;width: 170px;border: 1px solid #ccc;background: #eee;}
@media screen and (max-width:1300px){
	.daily_info #external-events{left:-180px;}
}
.daily_info #external-events .fc-event {cursor: move;margin: 3px 0;text-indent:2px;}
.daily_info #external-events > p:nth-of-type(1){position: absolute;top: -46px;text-align: center;line-height: 18px;left: 0;right: 0}
.daily_info #external-events > p:nth-of-type(1) strong{font-size: 13px;letter-spacing: -1px;color: #666;}
.daily_info #external-events > ul{height:calc(100vh - 330px);padding:10px;overflow-y:auto;}
.daily_info #external-events > ul::-webkit-scrollbar-track{background:#eee;}
.daily_info #external-events > ul > li{padding:5px 0;border-top:1px solid #ccc;background:url("/resources/images/ico_arrow_down2.png")no-repeat right center;cursor:pointer}
.daily_info #external-events > ul > li.on{background-image:url("/resources/images/ico_arrow_up2.png")}
.daily_info #external-events > ul > li:nth-of-type(1){border-top:0;}
.daily_info #external-events ul ul{display:none;}
.daily_info #external-events .fc-h-event .fc-event-main{display:inline-block;width:98%;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;font-size:12px;}

.daily_info #calendar{max-width: 1100px;margin: 20px auto 0;}
.daily_info #calendar tr td{font-size:14px;}

.daily_info .titTxt{margin-top:10px;font-size:14px;color:tomato;}
.daily_info .btnWrap{margin-top:20px;}
.daily_info .btnWrap a{margin:0 3px;}











</style>