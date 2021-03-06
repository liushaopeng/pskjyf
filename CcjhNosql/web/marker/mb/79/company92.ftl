﻿<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="/MyNosql/marker/mb/79/css/reset.css-2014-08-28.css"  media="all" />
<link rel="stylesheet" type="text/css" href="/MyNosql/marker/mb/79/css/common.css-2014-08-28.css"  media="all" />
<link rel="stylesheet" type="text/css" href="/MyNosql/marker/mb/79/css/home-28.css-2014-08-28.css"  media="all" />
<link rel="stylesheet" type="text/css" href="/MyNosql/marker/mb/79/css/menu-3.css-2014-08-28.css"  media="all" />
<script type="text/javascript" src="/MyNosql/marker/mb/79/js/jQuery.js"></script>
<script type="text/javascript" src="/MyNosql/marker/mb/79/js/swipe.js" ></script>
<script type="text/javascript" src="/MyNosql/marker/mb/79/js/zepto.js" ></script>
<title></title>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
      
        <!-- Mobile Devices Support @begin -->
            <meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
            <meta content="telephone=no, address=no" name="format-detection">
            <meta name="apple-mobile-web-app-capable" content="yes" /> <!-- apple devices fullscreen -->
            <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <!-- Mobile Devices Support @end -->
        
    </head>
    <body onselectstart="return true;" ondragstart="return false;">
        
<link rel="stylesheet" type="text/css" href="css/font-awesome.css-v=2014100823.css"  media="all" />

<div class="body">
		<!--
	幻灯片管理
	-->
    <#if (picurl?size>0)> 
	<div style="-webkit-transform:translate3d(0,0,0);">
    
		<div id="banner_box" class="box_swipe">
			<ul>
             <#list picurl as pic>
									<li>
												<a onClick="return false;">
																<img src="${osshttp}${pic}"  alt="3" style="width:100%;" />
								</a>
					</li>
		    </#list>
							</ul>
			<ol>
								    <#list picurl as pic> 
									<li class="on"></li>
									</#list>
							</ol>
		</div>
	</div>
    </#if>
		<script>
		$(function(){
			new Swipe(document.getElementById('banner_box'), {
				speed:500,
				auto:3000,
				callback: function(){
					var lis = $(this.element).next("ol").children();
					lis.removeClass("on").eq(this.index).addClass("on");
				}
			});
		});
	</script>
<br/>		

         <section>
         <#if (funcList?size>0)>
			<ul class="list_ul">
            <#list funcList as func>
                           
									<li>
                                    <#if func.method=="link">
													<a href="${func.url}" >
													<figure>
								<div style="background-image:url(${osshttp}${ func.picurl});">&nbsp;</div>
								<figcaption style="height:33px; overflow:hidden;">${func.name}</figcaption>
							</figure>
						                    </a>
                                      
                        <#else>
                        
                        					<a href="/MyNosql/wwz/wwz!${ func.method}.action?_id=1&type=${ func.type}&toUser=${toUser}">
													<figure>
								<div style="background-image:url(${osshttp}${ func.picurl});">&nbsp;</div>
								<figcaption style="height:33px; overflow:hidden;">${func.name}</figcaption>
							</figure>
						                    </a>
                        
					</li>
                </#list>
             </ul>
	    </#if>
		</section>
	</div>


	     <#if (footList?size>0)>
		<section data-role="widget" data-widget="nav7" class="nav7">
			<div class="plug-div-wrap">
				<div class="plug-div model1">
					<div id="plug-phone" class="plug-phone">
                                                                                            <#if footList[0]??>
                                                                                                          <#if footList[0].method=="link">

													<div>
																				<a href="${footList[0].url}" class="icon-phone">
										<label>${footList[0].name}</label>
									</a>
															</div>
                                                                                               </#if>  
                                                                                              </#if>   

                                                                                        
                                                                                            <#if footList[1]??>
                                                                                                          <#if footList[1].method=="link">   
													<div>
																	<a href="${footList[1].url}" class="icon-globe " >
										<label>${footList[1].name}</label>
									</a>
															</div>
                                                                                                     </#if>  
                                                                                              </#if>  

                                                                                               
                                                                                            <#if footList[2]??>
                                                                                                          <#if footList[2].method=="link">   

													<div>
																	<a href="${footList[2].url}" class="icon-edit">
										<label>${footList[2].name}</label>
									</a>
															</div>

                                                                                                           </#if>  
                                                                                              </#if>  
 

                                                                                          <#if footList[3]??>
                                                                                                          <#if footList[3].method=="link">   

												<div>
							<a href="${footList[3].url}" class="icon-share"><label>${footList[3].name}</label></a>
						</div>

                                                                                                           </#if>  
                                                                                              </#if>  
					</div>
				</div>
			</div>
		</section>
           </#if>
	
<!--
分享前控制
-->
	 
        			<footer style="overflow:visible;">
				<div class="weimob-copyright" style="padding-bottom:50px;">
											<span class="weimob-support" >${company.summary}欢迎您！<br/>@微白水</span>
									</div>
			</footer>
				<div mark="stat_code" style="width:0px; height:0px; display:none;">
					</div>
	</body>
 
    <script type="text/javascript">
    	window.shareData = {
			"imgUrl": "${osshttp}${company.logo}",
			"link": "${ip}/marker/company/company${company._id}.html",
			"title": "${company.name}",
			"content": "${company.summary}"
		};
	</script>
	<script type="text/javascript">

	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	// 发送给好友
	WeixinJSBridge.on('menu:share:appmessage', function (argv) {
		WeixinJSBridge.invoke('sendAppMessage', { 
			"img_url": window.shareData.imgUrl,
			"img_width": "640",
			"img_height": "640",
			"link": window.shareData.link,
			"desc": window.shareData.content,
			"title": window.shareData.title
		}, function (res) {
			weimobAfterShare("",window.shareData.link,'appmessage');
			_report('send_msg', res.err_msg);
		})
	});

	// 分享到朋友圈
	WeixinJSBridge.on('menu:share:timeline', function (argv) {
		WeixinJSBridge.invoke('shareTimeline', {
			"img_url": window.shareData.imgUrl,
			"img_width": "640",
			"img_height": "640",
			"link": window.shareData.link,
			"desc": window.shareData.content,
			"title": window.shareData.title
		}, function (res) {
			weimobAfterShare("",window.shareData.link,'timeline');
			_report('timeline', res.err_msg);
		});
	});

	// 分享到微博
	WeixinJSBridge.on('menu:share:weibo', function (argv) {
		WeixinJSBridge.invoke('shareWeibo', {
			"content": window.shareData.content,
			"url": window.shareData.link
		}, function (res) {
			weimobAfterShare("",window.shareData.link,'weibo');
			_report('weibo', res.err_msg);
		});
	});
}, false);
</script>
</html>