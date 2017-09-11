<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webcom/taglibs.jsp" %>
<%@ include file="/webcom/limit.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>小象兼职</title>
    <!-- Resource style -->
    <script src="${ctx}/app/js/jquery-1.8.3.js"></script>
    <link href="${ctx}/app/css/YLui.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/app/css/font-awesome.min.css" rel="stylesheet">
    <style>

        .line-height32 {
            line-height: 32px;
        }

        .line-bottom-red {
            border-bottom: 3px solid #26bd93;
            color: #26bd93;
        }

        .zi-26bd93 {
            color: #26bd93;
        }

        .bg-26bd93{
            background-color: #26bd93;
        }

        .bottom-26bd93 {
            background-color: white;
        }

        .bottom-26bd93:hover {
            color: #21a883;
        }
    </style>
    <script>
        $(function () {
            $(".yListr2 li").click(function () {
                $(this).addClass("line-bottom-red").siblings().removeClass("line-bottom-red");
            })
        })
        
         var fypage=0;
         var issend=true;
         var vt=1;
         function ajaxjz(fag) { 
            var submitData = {
                type: vt
            };
            if(!issend){
            	return;
            }
            issend = false; 
            $.post('${ctx}/parttime/mission!ajaxIndex.action?custid=${custid}&lscode=${lscode}&fypage=' +fypage, submitData, function (json) {
                var xszf;
                if (fag) {
                    xszf = $('#ajaxdiv').html();
                } else {
                    xszf = '';
                }
                if (json.state == 0) {
                    var v = json.list;
                    for (var i = 0; i < v.length; i++) {
                    	xszf+='<div class="line-bottom-92 div-group-5 pt-10 pl-10 pr-10 overflow-hidden position-r">'
                    	     +'<div class="zi-6 weight500 hang25 line-height25">'
                    	     +'<font size="2">'
                    	     +'<div class="sl"><i class="zi-26bd93 pr-5">[自营-全职]</i>快递分拣/搬运<i class="pl-10">18至35岁</i><i class="pl-10">需30人</i>'
                    	     +'</div></font></div>'
                    	     +'<font size="2">'
                    	     +'<div class="clear sl weight100 hang25 line-height25">'
                    	     +'<span class="zi-hui"><i class="pr-10 weight500 zi-6">[未央区]</i><i>已招募：</i>20人</span>'
                    	     +' </div>'
                    	     +'<div class="sl weight100 hang25 line-height25">'
                    	     +'<div class="pull-left">薪资：<span class="zi-cheng weight500">300/天</span>'
                    	     +'</div><div class="pull-right zi-hui">2016-10-08</div>'
                    	     +'</div></font></div>';
                       
                    }
                    fypage++;
                } else {
                }
                issend = true;
                $('#ajaxdiv').html(xszf); 
            }, "json");
        }
    </script>
</head>
<body>
<main class="cmp640">
    <!--标题放置处-->
    <div class="hang40 line-height40 pl-10 pr-10 zi-bai cmp640 position-f line-bottom"
         style="left:0px;top: 0px;z-index: 10;">
        <div class="pull-left zi-bai">
            <div class="pull-left pt-4 pr-5">
                <div class="bg-bai overflow-hidden" style="height:32px;width:118px;">
                    <img src="${ctx}/img/parttime/logo.png" class="width-10">
                </div>
            </div>
            <div class="pull-left zi-hei-tq pl-10">
                <!--<i class="fa fa-caret-down pl-5"></i>-->
            </div>
        </div>
        <div class="pull-right zi-6">
            <i class="weight500">分享得佣金</i>
        </div>
    </div>
    <div class="hang40"></div>


    <div class="width-10">
        <img src="${ctx}/img/parttime/banner.jpg" class="width-10">
    </div>
    <font size="2">
        <div class="cmp640 position-r" style=" z-index:3;">
            <div class="hang40 bg-bai pt-5 weight500 yListr2 zi-hui-tq">
                <li class="button_group1 hang30 line-height32 txt-c line-bottom line-bottom-red">
                    全部岗位
                </li>
                <li class="button_group1 hang30 line-height32 txt-c line-bottom">
                    平台自营
                </li>

            </div>
        </div>
    </font>
    
      <div class="zi-hei div-group-5 pt-10 pl-10 pr-10 overflow-hidden position-r size16" onclick="window.location.href='${ctx}/parttime/mission!details.action?custid=${custid}&lscode=${lscode}&id=1'">
        <div class="weight500 hang30 line-height30">
            <div class="sl"><i class="zi-26bd93 pr-5">[自营]</i>快递分拣/搬运<i class="pl-5">18至35岁</i><i
                    class="pl-5">需30人</i>
            </div>
        </div>
        <div class="clear sl weight100 hang30 line-height30">
            <span class="zi-hui"><i class="pr-5 weight500 zi-hei">[未央区]</i><i>已招募:</i>20人</span>
        </div>
        <div class="sl weight500 hang30 line-height30">
            <div class="pull-left">薪资<span class="zi-cheng pl-5 weight500">300/天</span>
            </div>
            <div class="pull-right zi-hui">2016-10-08</div>
        </div>
    </div>
    <div class="hang7 bg-hui clear"></div>
    <div id="ajaxdiv"></div> 
</main>
<%@include file="/webcom/mission-foot.jsp"%>
 
<script> 
$(window).scroll(function () {
        var offsetY = $(window).scrollTop();
        var section1 = $("#section1").height();
        if (section1 - offsetY < 600) { 
            ajaxjz(false); 
        }
 });
wx.config({
    debug: false,
    appId: '${token.appid}', 
    timestamp: '${token.timestamp}', 
    nonceStr: '${token.noncestr}', 
    signature: '${token.signature}',
    jsApiList: [ 'checkJsApi',
                 'onMenuShareTimeline',
                 'onMenuShareAppMessage',
                 'onMenuShareQQ',
                 'onMenuShareWeibo',
                 'hideMenuItems',
                 'showMenuItems'
                 ] 
});
wx.ready(function(){ 
	var share={
		    title: '${share.fxtitle}', // 分享标题
		    desc: '${share.fxsummary}', // 分享描述
		    link: '${share.fxurl}', // 分享链接
		    imgUrl: '${filehttp}${share.fximg}', // 分享图标
		    success: function () {
		     check_task();
		    },
		    cancel: function () {
		    }
		};
	wx.onMenuShareAppMessage(share);
	wx.onMenuShareTimeline(share);
	wx.onMenuShareAppMessage(share);
	wx.onMenuShareQQ(share);
	wx.onMenuShareWeibo(share);
}); 
</script>
</body>
</html>