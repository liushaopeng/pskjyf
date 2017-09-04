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
    <title>我的</title>
    <script src="${ctx}/app/js/jquery-1.8.3.js"></script>
    <link href="${ctx}/app/css/YLui.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/app/css/font-awesome.min.css" rel="stylesheet">
    <style>

        .hang45 {
            height: 45px;
            line-height: 45px;
        }

        .bg-jin {
            background-color: #e3c06a;
        }

        .pl-90 {
            padding-left: 90px;
        }

        .p-top-left-10 {
            top: 10px;
            left: 10px;
        }

        .hang45 {
            height: 45px;
            line-height: 45px;
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
</head>
<body class="lock">
<main class="cmp640">
    <font size="2">
        <div class="hang90 overflow-hidden bg-bai width-10 position-r clear">
            <div class="pull-left bg-hui-tx txt-c img-wh70 position-a p-top-left-10 position-r">
                <i class="fa fa-user-secret fa-3x zi-bai" style="line-height: 70px;"></i>
                <!--无头像时显示的div-->
                <div class="position-a width-10" style="bottom: 0px;left: 0px;">
                    <div class="hang20 line-height20 bg-hei-5 zi-bai"><font size="1">点击上传</font></div>
                </div>
                <!--有头像时显示div-->
                <!--<img src="img/touxiang.jpg" class="width-10 border-radius3">-->
            </div>
            <div class="pt-10 pr-10 width-10 pl-90 weight500">
                <div class="hang25 line-height25 zi-hei-tq">
                    <div class="col-9 sl">昵称，ID:12365485965</div>
                </div>
                <div class="hang20 line-height20 zi-hui-wx">
                    <div class="col-9 sl">陕西省 渭南市</div>
                </div>
                <font size="1">
                    <div class="hang25 pt-3 line-height25 zi-hui-wx ">
                        <div class="hang20 border-radius3 line-height20 zi-bai bg-hei-5 pl-5 pr-5 pull-left"><i
                                class="fa fa-mobile-phone line-height20 pr-5"></i>手机认证
                        </div>
                        <div class="hang20 border-radius3 line-height20 zi-bai bg-jin bg-hei-5 pl-5 pr-5 pull-left"><i
                                class="fa fa-mobile-phone line-height20 pr-5"></i>手机认证
                        </div>
                    </div>
                </font>
            </div>
        </div>

        <div class="hang10 clear bg-hui-92"></div>
        <div class="hang45 bg-bai line-bottom-92 zi-6 pr-10 clear weight500 overflow-hidden" onclick="window.location.href='${ctx}/parttime/mission!withposi.action?custid=${custid}&lscode=${lscode}'">
            <font size="2">
                <div class="pull-left div-group-10">
                    <div class=" bg-cheng img-wh25 txt-c zi-bai overflow-hidden" style="background-color: #e3c06a">
                        <i class="fa fa-gg line-height25"></i>
                    </div>
                </div>
                <div class="pull-left">
                    我的佣金
                </div>
                <div class="pull-right zi-hui">
                    <i class="pr-5 zi-hui size10">0</i><i class="fa fa-chevron-right hang45"></i>
                </div>
            </font>
        </div>
        <div class="hang45 bg-bai line-bottom-92 zi-6 pr-10 clear weight500 overflow-hidden" onclick="window.location.href='${ctx}/parttime/mission!withposidet.action?custid=${custid}&lscode=${lscode}'">
            <font size="2">
                <div class="pull-left div-group-10">
                    <div class="bj-cheng img-wh25 txt-c zi-bai overflow-hidden">
                        <i class="fa fa-calculator line-height25"></i>
                    </div>
                </div>
                <div class="pull-left">
                    提现记录
                </div>
                <div class="pull-right zi-hui">
                    <i class="fa fa-chevron-right hang45"></i>
                </div>
            </font>
        </div>
        <div class="hang10 clear bg-hui-92"></div>
        <div class="hang45 bg-bai line-bottom-92 zi-6 pr-10 clear weight500 overflow-hidden" onclick="window.location.href='${ctx}/parttime/mission!minedata.action?custid=${custid}&lscode=${lscode}'">
            <font size="2">
                <div class="pull-left div-group-10">
                    <div class="bj-lan2 img-wh25 txt-c zi-bai overflow-hidden">
                        <i class="fa fa-drivers-license-o line-height25"></i>
                    </div>
                </div>
                <div class="pull-left">
                    个人资料
                </div>
                <div class="pull-right zi-hui">
                    <i class="pr-5 zi-hui size10">未完成</i><i class="fa fa-chevron-right hang45"></i>
                </div>
            </font>
        </div>
        <div class="hang45 bg-bai line-bottom-92 zi-6 pr-10 clear weight500 overflow-hidden">
            <font size="2">
                <div class="pull-left div-group-10">
                    <div class=" bj-lan1 img-wh25 txt-c zi-bai overflow-hidden">
                        <i class="fa fa-group line-height25"></i>
                    </div>
                </div>
                <div class="pull-left">
                    邀请好友
                </div>
                <div class="pull-right zi-hui">
                    <i class="pr-5 zi-hui size10">邀请好友可以赚佣金</i><i class="fa fa-chevron-right hang45"></i>
                </div>
            </font>
        </div>

        <div class="hang10 clear bg-hui-92"></div>
        <div class="hang45 bg-bai line-bottom-92 zi-6 pr-10 clear weight500 overflow-hidden">
            <font size="2">
                <div class="pull-left div-group-10">
                    <div class="bj-hong1 img-wh25 txt-c zi-bai overflow-hidden">
                        <i class="fa fa-info-circle line-height25"></i>
                    </div>
                </div>
                <div class="pull-left">
                    关于《平台名称》
                </div>
                <div class="pull-right zi-hui">
                    <i class="fa fa-chevron-right hang45"></i>
                </div>
            </font>
        </div>
        <div class="hang45 bg-bai line-bottom-92 zi-6 pr-10 clear weight500 overflow-hidden">
            <font size="2">
                <div class="pull-left div-group-10">
                    <div class=" bj-cheng img-wh25 txt-c zi-bai overflow-hidden">
                        <i class="fa fa-question-circle-o line-height25"></i>
                    </div>
                </div>
                <div class="pull-left">
                    常见问题
                </div>
                <div class="pull-right zi-hui">
                    <i class="fa fa-chevron-right hang45"></i>
                </div>
            </font>
        </div>

    </font>
</main>
<div class="clear hang70"></div>
<div class=" button_foot bg-bai zi-hui shadow-wai cmp640" style="z-index: 1;">
    <div class="bottom-26bd93 zi-hui-wx txt-c weight500 line-right_bai pt-5 pb-5 button_group1">
        <font size="4">
            <div class="fa fa-home"></div>
        </font>

        <div class=" pt-3">
            <font size="1">
                首页
            </font>
        </div>
    </div>
    <div class="bottom-26bd93 zi-hui-wx txt-c weight500 line-right_bai pt-5 pb-5 button_group1">
        <font size="4">
            <div class="fa fa-clone"></div>
        </font>

        <div class=" pt-3">
            <font size="1">
                订单
            </font>
        </div>
    </div>
    <div class=" button_group1 zi-6">
        <div class="bottom-26bd93 zi-hui-wx txt-c weight500 line-right_bai hang50">
            <font size="3">
                <div class="hang25 line-height30 fa fa-envelope-open-o position-r">
                    <div class="position-a bg-26bd93 zi-bai border-radius50 img-wh15 sl"
                         style="top:-3px; right: -10px;line-height: 15px;">
                        <font size="2">9</font>
                    </div>
                </div>
            </font>
            <font size="2">
                <div class="hang25 line-height25">
                    消息
                </div>
            </font>
        </div>
    </div>
    <div class="bottom-26bd93 zi-hui-wx txt-c weight500 line-right_bai pt-5 pb-5 button_group1">
        <font size="4">
            <div class="fa fa-user"></div>
        </font>

        <div class=" pt-3">
            <font size="1">
                我的
            </font>
        </div>
    </div>
</div>
</body>
</html>