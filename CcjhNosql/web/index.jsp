<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webcom/taglibs.jsp" %>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.lsp.sys.security.CustomerUser,com.lsp.pub.util.SpringSecurityUtils,com.lsp.pub.entity.GetAllFunc
,com.lsp.pub.entity.FuncInfo,java.util.List" %>
<%@page import="org.springframework.web.filter.RequestContextFilter"%>
  
<%  
    CustomerUser cust =(CustomerUser)SpringSecurityUtils.getCurrentUser();
	if(cust!=null){
	 response.sendRedirect("index.action");
	}
	 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0022)http://www.pskjyf.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="keywords" content="邑联科技,同城建设,微信开发,电商推广,网上商城,一键建站,HTML5,APP开发">
    <meta name="description" content="邑联科技。邑联科技 负责人电话：18191806954，邑联科技 热诚欢迎各界朋友来访洽谈业务!">
    <meta name="applicable-device" content="pc">
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="pc_gw/pc-wj/reset.css">
    <link type="text/css" rel="stylesheet" href="pc_gw/pc-wj/style.css"> 
    <script src="pc_gw/pc-wj/jquery-1.8.3.min.js"></script>
    <script src="pc_gw/pc-wj/common.js"></script>
    <script src="pc_gw/pc-wj/jquery.slider.js"></script>
    <script src="pc_gw/pc-wj/jquery-runbanner.js"></script>
    <script src="pc_gw/pc-wj/turn4.1.min.js"></script>
</head>
<body>
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
<!---轮播图--->
<div class="wrape homeone">
    <div class="oneByOne1" style="overflow: hidden;">
        <div id="obo_slider" style="left: 0px;">
            <div class="oneByOne_item" style="display: block; left: 0px;"><a href=""
                                                                             class="animate0 fadeInDown"
                                                                             style="display: inline;"><img
                    src="pc_gw/pc-wj/slide01.png" class="wp1_1 slide2_bot"></a><span
                    class="slide1Txt1 animate1 fadeInDown" style="display: block;"><h4>微信会员卡</h4><p>方便携带 永不挂失消费积分
                一卡配备</p></span><span class="slide1Txt2 animate2 fadeInDown" style="display: block;"><h4>微商城</h4><p>
                小微信也有大商城<br> 电商轻松就能入微信</p></span><span class="slide1Txt3 animate3 fadeInDown"
                                                       style="display: block;"><h4>微论坛</h4><p>各行各业<br> 交流讨论轻松搞定
            </p></span><span class="slide1Txt4 animate4 fadeInDown" style="display: block;"><h4>微旅游</h4><p>在线订房融入微信<br>
                酒店营销多一条有力途径</p></span></div>

            <div class="oneByOne_item" style="display: none; left: 1920px;"><a href="#"
                                                                               class="animate0"
                                                                               style="display: none;"><img
                    src="pc_gw/pc-wj/slide02.png" class="wp1_2 slide2_bot"></a><span
                    class="slide2Txt1 animate1" style="display: none;"><em>邑联</em></span><span
                    class="slide2Txt2 animate2" style="display: none;">飞跃从代理开始</span><span class="slide2Txt3 animate3"
                                                                                           style="display: none;"><em>邑联诚招全国代理，</em>开启您的“手头”新商机。</span>
            </div>
            <div class="oneByOne_item" style="display: none; left: 2880px;"><a href="#"
                                                                               class="animate0"
                                                                               style="display: none;"><img
                    src="pc_gw/pc-wj/mobile.png" class="wp1_3 slide1_bot"></a><span class="txt1 animate1"
                                                                                style="display: none;">126286位用户已选择使用</span><span
                    class="txt2 animate2" style="display: none;"><em>邑联</em></span><span class="txt3 short animate3"
                                                                                         style="display: none;">为您开户<em>8亿</em>的用户市场</span><span
                    class="txt4 txt4up animate4" style="display: none;"><img src="pc_gw/pc-wj/ewm2.jpg"
                                                                             width="159" height="159"></span></div>
            <div class="buttonArea">
                <div class="buttonCon" style="cursor: pointer; display: block;"><a class="theButton active"
                                                                                   rel="0">1</a><a
                        class="theButton" rel="1">2</a><a class="theButton" rel="2">3</a><a class="theButton"
                                                                                            rel="3">4</a><a
                        class="theButton" rel="4">5</a><a class="theButton" rel="5">6</a></div>
            </div>
            <div class="arrowButton" style="display: block; cursor: pointer;">
                <div class="prevArrow"></div>
                <div class="nextArrow"></div>
            </div>
        </div>
    </div>
    <div class="funcList" id="func">
        <ul class="list">
            <li><img src="pc_gw/pc-wj/func01.jpg" width="104" height="107">

                <h3>微信会员卡</h3>

                <p>方便携带 永不挂失<br>消费积分 一卡配备</p></li>
            <li><img src="pc_gw/pc-wj/func03.jpg" width="107" height="107">

                <h3>微商城</h3>

                <p>小微信也有大商城<br> 电商轻松就能走入微信</p></li>
            <li><img src="pc_gw/pc-wj/func04.jpg" width="106" height="107">

                <h3>自动应答菜单</h3>

                <p>通过形象的菜单界面引导顾客进行微信互动操作。</p></li>
            <li><img src="pc_gw/pc-wj/func07.jpg">

                <h3>关键词回复</h3>

                <p>便捷关键词回复轻松设<br> 置</p></li>
            <li><img src="pc_gw/pc-wj/func08.jpg">

                <h3>大转盘</h3>

                <p>快乐大转盘<br> 幸运落谁家</p></li>
            <li><img src="pc_gw/pc-wj/func09.jpg">

                <h3>刮刮乐</h3>

                <p>趣味游戏<br> 吸引用户参与 沉淀用户</p></li>
            <li><img src="pc_gw/pc-wj/func11.jpg">

                <h3>问卷调查</h3>

                <p>企业设置好题目，<br> 由用户通过微信回答</p></li>
            <li><img src="pc_gw/pc-wj/func12.jpg">

                <h3>智能客服</h3>

                <p>客户问题自动应答<br> 无需人工值守 </p></li>
            <li><img src="pc_gw/pc-wj/func13.jpg">

                <h3>微预约</h3>

                <p>各种预约 一键即可<br> 短信邮件会立即通知商户 </p></li>
            <li><img src="pc_gw/pc-wj/func16.jpg">

                <h3>自主投票 </h3>

                <p>微信自主投票系统<br> 全新营销活动引爆朋友圈 </p></li>
        </ul>
        <div class="tc_detail">
            <div class="op">
                <div class="fl"><a href="javascript:;" class="slider_prev">&lt;</a><a href="javascript:;"
                                                                                      class="slider_next">&gt;</a></div>
                <a href="javascript:;" class="icon_01 close"></a></div>
            <div class="cover"></div>
            <div class="wrap_slider detailList" id="magazine">

                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func02.png" width="82"
                                                height="82"><span>微信会员卡</span></div>
                        <h3>方便携带，永不挂失，消费积分<br> 一卡配备</h3>

                        <p>会员卡可吸引并留住大批顾客，但人们往往因为

                            会员卡繁多不便携带而忘记或丢失部分门店会员

                            卡，导致短期或长期的客源流失。邑联独创的会

                            员卡将解决这一困扰企业多时的难题。</p>

                        <p>通过微信电子植入的会员卡，能帮助企业建立集

                            品牌推广、会员管理、营销活动、统计报表于一

                            体的微信会员管理平台。绚丽的卡面展示，发卡

                            零成本，同时实现会员卡储值和积分等功能，真

                            正解决CRM管理和各种应用模式下的精确营销，

                            让顾客充分享受会员乐趣。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img02_01.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img02_02.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img02_03.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img02_04.png" width="812" height="151"></div>
                </div>
                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func03.png" width="82"
                                                height="82"><span>微商城</span></div>
                        <h3>小微信也有大商城，电商轻松就能

                            走入微信</h3>

                        <p>微商城，基于移动互联时代，以目前最流行的互

                            动应用通讯工具“微信”为媒介，配合微信5.0

                            支付功能，实现商家与客户的实时在线互动。可

                            即时推送最新商品信息和优惠活动给微信用户。</p>

                        <p>极速建立微信商城，实现商品展示、购买、物流

                            等交易全过程，支持商品管理、会员管理、购物

                            车、商品分类管理、订单管理、店铺设置、支付

                            方式管理、配送方式管理，并与积分优惠系统打

                            通，实现微信在线购物功能，方便、快捷、有保

                            障。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img03_01.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img03_02.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img03_03.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img03_04.png" width="812" height="151"></div>
                </div>
                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func06.png" width="82"
                                                height="82"><span>自动应答菜单</span></div>
                        <h3>通过形象的菜单界面引导顾客进行

                            微信互动操作</h3>

                        <p>邑联自动应答菜单是指企业信息、提供的服务以

                            菜单形式展现，可充分引导用户，让用户一目了

                            然。邑联的自动应答菜单的内容可以设置成文字、

                            语音、图文消息、微网页链接。</p>

                        <p>用户无需再通过输入关键词触发回复，直接点击

                            菜单就可以看相关的内容，此功能结合微信3G网

                            站即可方便操作。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img06_01.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img06_02.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img06_03.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img06_04.png" width="812" height="151"></div>
                </div>
                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func07.png" width="82"
                                                height="82"><span>关键词回复</span></div>
                        <h3>便捷关键词回复轻松设置</h3>

                        <p>微网站中显示的所有文章及板块，都可以通过设

                            置关键词，而实现自动回复。</p>

                        <p>邑联的关键词回复提供多种功能：智能提取关键

                            字 —对提问进行智能分析，提取问题关键字供

                            匹配；知识库匹配 —分析关键字，从知识库匹

                            配最贴切的回答；转人工回复—无匹配内容转

                            人工回复；知识库自动学习 —知识库自动学习，

                            无匹配内容将逐渐减少；知识库整理 —通过知

                            识库专用管理界面，可查询、修改、增加、删除

                            知识库内容。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img07_01.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img07_02.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img07_03.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img07_04.png" width="812" height="151"></div>
                </div>
                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func08.png" width="82"
                                                height="82"><span>大转盘</span></div>
                        <h3>快乐大转盘，幸运落谁家</h3>

                        <p>幸运大转盘寓营销于娱乐互动，带给用户无限快

                            乐的挑战体验。颇受广大用户喜爱。邑联的大转

                            盘抽奖模块为商家提供转盘抽奖服务，编辑形式

                            超简易。</p>

                        <p>商家通过设置活动时间，相应奖项的中奖率、奖

                            品数量和触发关键字，关注用户参与抽奖，收集

                            中奖用户信息。活动开展可在朋友圈中分享，好

                            友看到后会提示关注企业公众号开启游戏，达到

                            自主传播效果。支持多种兑奖方式，可线上、线

                            下、邮寄或到相应门店进行奖品兑换。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img08_01.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img08_02.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img08_03.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img08_04.png" width="812" height="151"></div>
                </div>
                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func10.png" width="82"
                                                height="82"><span>刮刮乐</span></div>
                        <h3>趣味游戏，吸引用户参与，沉淀用户</h3>

                        <p>刮起来就没完没了，乐趣绝对非同凡响。刮刮卡

                            极受用户追捧。邑联的刮刮乐模块编辑简易，用

                            户使用简单顺手。</p>

                        <p>特为商家提供刮奖服务，通过逼真的刮卡体验，

                            增强用户粘性。商家通过设置活动时间，相应奖

                            项的中奖率、奖品数量和触发关键字，关注用户

                            即可通过手机屏幕轻松参加刮奖游戏。企业可轻

                            松手机用户信息进行整理分析。活动的传播可在

                            朋友圈轻松分享。支持多种兑奖方式，可以是线

                            上、线下、邮寄或到相应门店进行奖品兑换。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img10_01.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img10_02.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img10_03.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img10_04.png" width="812" height="151"></div>
                </div>
                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func11.png" width="82"
                                                height="82"><span>问卷调查</span></div>
                        <h3>企业设置好题目，由用户通过微信

                            回答 </h3>

                        <p>邑联问卷调查分为选项式和综合式，选项式通过

                            单项选择、多项选择展开调查，综合式即为开放

                            式回答，综合式调查问卷支持企业根据用户参与

                            调查问卷所得分数，派发礼品。</p>

                        <p>邑联问卷调查可充分了解用户对企业服务的基本

                            态度与行为，及时改善企业不足。更好的留住顾

                            客、发展顾客。邑联问卷调查突破时空限制，令

                            调查结果轻松量化，便于统计处理与分析。节省大

                            量时间、经费和人力。成本更低，还可及时调

                            整问卷设计上的不足。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img11_01.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img11_02.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img11_03.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img11_04.png" width="812" height="151"></div>
                </div>
                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func12.png" width="82"
                                                height="82"><span>智能客服</span></div>
                        <h3>客户问题自动应答，无需人工值守</h3>

                        <p>邑联智能客服令用户无需焦急等待，充分满意企

                            业客服态度，令来客率和回头率大幅度增加。主

                            要通过预先设置的图文素材，设置首次关注时回

                            复、关键词自定义回复、默认回复、以及LBS回

                            复（发送"位置"）回复每个用户的问题。</p>

                        <p>系统会根据访客提问自动推荐回复，再也不用担

                            心访客对着客服的"正在输入"咆哮，全面提升客

                            服对话效率，以一敌百绝对不是传说。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img12_01.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img12_02.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img12_03.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img12_04.png" width="812" height="151"></div>
                </div>
                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func13.png" width="82"
                                                height="82"><span>微预约</span></div>
                        <h3>各种预约 一键即可</h3>

                        <p>“邑联”团队倾力打造的微预约，是商家利用微

                            管家平台实现在线预约的一种服务，用户可以通过

                            微信预约商家的服务或者产品，可用于汽车、房

                            产、酒店、医疗、餐饮等一系列行业，为用户出

                            行购物、外出办事带来了极大便利！且操作简单，

                            响应速度及时快捷，让用户的预约绝对更加直观、

                            实时、准确。绝对的吃喝玩乐、轻松搞定。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img13_01.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img13_02.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img13_03.png" width="812" height="151"><img
                            src="pc_gw/pc-wj/func_img13_04.png" width="812" height="151"></div>
                </div>

                <div class="turn-page">
                    <div class="fl">
                        <div class="title"><img src="pc_gw/pc-wj/logo_func16.png" width="82"
                                                height="82"><span>自主投票</span></div>
                        <h3>基于微信的自主图文投票系统，全新营销活动，引爆朋友圈</h3>

                        <p>
                            这是一款自主图文投票活动，用户可以自行报名参与投票活动，也可以在后台直接添加投票选项。页面顶部幻灯片可以添加活动宣传海报及赞助商广告，底部菜单也可以自定义配置，用户投票数量灵活自定义。</p>

                        <p>投票系统采用领先的缓存技术，能够支撑各类大型投票活动。扫描左下角二维码可以体验效果。</p></div>
                    <div class="fr"><img src="pc_gw/pc-wj/func_img16.png" width="812" height="602"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap_case"style="display: none;">
        <div class="case"><h2><em>超500</em>款在线应用订制开发经验！<br><i>More than 500 online application develop experience</i>
        </h2>

            <div class="slider-box"><a href="javascript:;" class="slider_prev"></a>

                <div class="wrap_slider">
                    <ul class="slide_move" style="width: 1520px;">
                        <li><img src="pc_gw/pc-wj/al01.png" width="190" height="403"></li>
                        <li><img src="pc_gw/pc-wj/al02.png" width="190" height="403"></li>
                        <li><img src="pc_gw/pc-wj/al03.png" width="190" height="403"></li>
                        <li><img src="pc_gw/pc-wj/al04.png" width="190" height="403"></li>
                        <li><img src="pc_gw/pc-wj/al01.png" width="190" height="403"></li>
                        <li><img src="pc_gw/pc-wj/al02.png" width="190" height="403"></li>
                        <li><img src="pc_gw/pc-wj/al03.png" width="190" height="403"></li>
                        <li><img src="pc_gw/pc-wj/al04.png" width="190" height="403"></li>
                    </ul>
                </div>
                <a href="javascript:;" class="slider_next"></a></div>
        </div>
    </div>
    <div class="join"><h2><em>代理加盟</em>四步曲，未来触手可及！<br><i>Merchants four steps,the future at your fingertips!</i></h2>
        <table width="944" border="0">
            <tbody>
            <tr>
                <td><img src="pc_gw/pc-wj/step_01.jpg" width="236" height="200"></td>
                <td><img src="pc_gw/pc-wj/step_02.jpg" width="236" height="200"></td>
                <td><img src="pc_gw/pc-wj/step_03.jpg" width="236" height="200"></td>
                <td><img src="pc_gw/pc-wj/step_04.jpg" width="236" height="200"></td>
            </tr>
            <tr>
                <td class="step01">1、联系渠道经理<p>确认合作意向</p></td>
                <td class="step02">2、和渠道经理详<p>谈代理合同事宜，</p>

                    <p>签署合作协议</p></td>
                <td class="step02">3、总部配置代理及<p>相关权限，提供</p>

                    <p>相关技术培训</p></td>
                <td class="step02">4、快速展开当<p>地销售工作</p></td>
            </tr>
            </tbody>
        </table>
        <div class="btn_more"><a href="#">查看招商详情</a></div>
    </div>
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
    <div class="copyright"> Copyright © 2016 pskjyf.com 版权所有陕ICP备16006817号-1
    <div style="width:300px;margin:0 auto; padding:5px 0;"> 
	<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=61062902000014" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="${ctx}/img/batb.png" height="20px" width="20px" style="float: left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">陕公网安备 61062902000014号</p></a>
	</div>
    </div>
  
		 
    <!---底部 begin---><!--右侧悬浮 begin-->
    <div class="consult" id="consult"></div>
    <!--右侧悬浮 end-->
    <div class="erwei" title="微信扫一扫"><span class="hudongzhushou">微信扫一扫,体验新功能</span></div>
    <!---底部 end--->
</body>
</html>