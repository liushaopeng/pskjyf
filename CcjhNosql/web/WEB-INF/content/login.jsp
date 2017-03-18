<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webcom/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0022)http://www.pskjyf.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta property="qc:admins" content="5641314377603321663757" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="keywords" content="邑联科技,同城建设,微信开发,电商推广,网上商城,一键建站,HTML5,APP开发">
    <meta name="description" content="邑联科技。邑联科技 负责人电话：18191806954，邑联科技 热诚欢迎各界朋友来访洽谈业务!">
    <meta name="applicable-device" content="pc">
    <title>登录</title>
    <link type="text/css" rel="stylesheet" href="pc_gw/pc-wj/reset.css">
    <link type="text/css" rel="stylesheet" href="pc_gw/pc-wj/style.css"> 
    <script src="pc_gw/pc-wj/jquery-1.8.3.min.js"></script>
    <script src="pc_gw/pc-wj/common.js"></script>
    <script src="pc_gw/pc-wj/jquery.slider.js"></script>
    <script src="pc_gw/pc-wj/jquery-runbanner.js"></script>
    <script src="pc_gw/pc-wj/turn4.1.min.js"></script>
</head>
<body><!---header begin--->        ﻿
<div class="wrap_header">
    <div class="header">
        <div class="navigation">
            <div class="logo"><a href="#"><img src="pc_gw/pc-wj/logo.png"
                                               alt="" border="0"></a></div>
            <ul>
                <li><a href="http://www.pskjyf.com/">首页</a></li>
                <!--<li><a href="#">功能</a></li>-->
                <li><a href="pc_gw/index-help.html">帮助</a></li>
                <li><a href="pc_gw/index-dl.html">代理</a></li>
                <li><a href="pc_gw/index-tc.html">套餐</a></li>
                <li><a href="pc_gw/index-about.html">关于</a></li>
            </ul>
            <div class="login"><a href="http://www.pskjyf.com/login.action">登录</a><a
                    href="http://www.pskjyf.com/register.action">注册</a></div>
        </div>
    </div>
</div>
<div class="bg_login_main">
    <div class="login_main">
        <div class="img active"><img src="pc_gw/pc-wj/img.png" width="485" height="485"></div>
        <div class="img02"><img src="pc_gw/pc-wj/img02.png" width="127" height="127"></div>
        <form method="post" id="loginform" name="loginForm"   action="j_spring_security_check">
        <input id="j_username" name="j_username" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}" type="text"class="txt_name"placeholder="平台账号"/>
        <input id="j_password" name="j_password" type="password" class="txt_pwd" placeholder="密码"/>
        
        <div  class="btn_login"  id="subok" onclick="login()"></div><a
                    href="http://www.pskjyf.com/register.action" class="btn_reg" style="right: 22px;">新用户注册</a>
                   </form>
    </div>
</div>
<script type="text/javascript">$(function () {
    $(".img").addClass("active");
    $(".btn_reg").animate({right: "22px"}, "slow");
    $('#J_captcha_img').click(function () {
        var timenow = new Date().getTime(),
                url = $(this).attr('data-url').replace(/js_rand/g, timenow);
        $(this).attr("src", url);
    });
    $('#J_captcha_change').click(function () {
        $('#J_captcha_img').trigger('click');
    });

})
</script>
<!---底部 begin--->
<div style="display:none"><img src="pc_gw/pc-wj/hezuo.jpg"></div>
<div class="joinLine">全国招商热线：15719252550</div>
<div class="footer">
    <div class="footer_con">
        <div class="logo"><a href="#" style="background:url(pc_gw/images/logo2.png) no-repeat">国内最大的免费微信第三方平台</a>
        </div>
        <div class="link"><p><a href="#">返回首页</a> |
            <a href="#">申请体验</a> |
            <a href="#">配置接口</a> |
            <a href="#"> 加盟代理</a> |
            <a href="#">套餐资费</a> |
            <a href="#">关于我们</a></p>

            <p> 客服专线：15719252550 QQ：1076631795 邮箱：pskjyfct@sina.com</p>

            <p> 工作时间：周一至周日, 上午9:00-12:00, 下午14:00-18:00
            </p>

            <p>地址：陕西省西安市未央区第五国际c座</p></div>
        <div class="code"><img src="pc_gw/pc-wj/ewm2.jpg" width="124" height="124"></div>
    </div>
</div>
<div class="copyright"> Copyright © 2016 pskjyf.com 版权所有陕ICP备16006817号-1</div>
 
<!---底部 begin---><!--右侧悬浮 begin-->
<div class="consult" id="consult"></div>
<!--右侧悬浮 end-->
<div class="erwei" title="微信扫一扫"><span class="hudongzhushou">微信扫一扫,体验新功能</span></div>
<!---底部 end--->
</body>
<script> 
function login(){
  document.getElementById('loginform').submit();
}
function loginqq(){
    var submitData = {  
	                };  
   $.post('${ctx}/login.do', submitData,
        	 
        	 function(json){
        	   alert(json);
        	  
        	 },"json");
      
}
function keydown(e)   
 { var currKey=0,e=e||event;  
   if(e.keyCode==13){
     if($("#j_username").val()==''||$("#j_password").val()==''){
     return;
     }
   document.getElementById('loginform').submit();  
   }
 }  
document.onkeydown=keydown;
function checkOK(){
  $('#subok').click(function(){
   login();
  }); 
}
</script>
</html>