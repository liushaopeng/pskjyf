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
    <title>小象兼职-我的订单</title>
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

        .bg-26bd93 {
            background-color: #26bd93;
        }

        .bottom-26bd93 {
            background-color: white;
        }

        .bottom-26bd93:hover {
            color: #21a883;
        }

        .line-height32 {
            line-height: 32px;
        }

        .line-bottom-red {
            border-bottom: 3px solid #26bd93;
        }

        .zi-26bd93 {
            color: #26bd93;
        }

        .zi-jin {
            color: #e3c06a
        }
    </style>
    <script>
        $(function () {
            $(".yListr2 li").click(function () {
                $(this).addClass("line-bottom-red").siblings().removeClass("line-bottom-red");
            })
        })
    </script>
</head>
<body class="lock">
<main class="cmp640">

    <!--标题放置-->
    <div class="hang40 line-height40 bg-bai cmp640 position-f"
         style="left:0px;top: 0px;z-index: 10;">
        <div class="clear position-r" style=" z-index:3;">
            <div class="hang40 pt-5 line-bottom weight500 weight100 yListr2 zi-hei">
                <li class="button_group1 hang30 line-height32 txt-c line-bottom-red">
                    全部
                </li>
                <li class="button_group1 hang30 line-height32 txt-c">
                    已报名
                </li>
                <li class="button_group1 hang30 line-height32 txt-c">
                    待结算
                </li>
                <li class="button_group1 hang30 line-height32 txt-c">
                    未完成
                </li>
                <li class="button_group1 hang30 line-height32 txt-c">
                    已完成
                </li>
            </div>
        </div>
    </div>
    <div class="hang40"></div>


    <div class="div-group-10 overflow-hidden line-bottom-92 clear">
        <div class="hang20 line-height20 weight500">
            <div class="pull-left">岗位名称：[快递分拣日结]<i class="zi-26bd93 pl-10">￥100</i></div>
            <div class="pull-right zi-jin">待结算</div>
        </div>
    </div>
    <div class="width-9 maring-a pt-10 pb-10 overflow-hidden zi-6 weight500">
        <div class="hang30 line-height30">
            <i class="zi-hei">接单日期：</i>2018-03-03 12：00：00
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">集合时间：</i>2018-03-03 11：30
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">上班时间：</i>12：00<i class="pl-10 pr-10">至</i>22：00
        </div>
        <div class=" line-height30">
            <i class="zi-hei">地点：</i>陕西省西安市未央区某某某物流园向北100米<i class="zi-lan-tq pl-5">查看地图</i>
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">订单编号：</i>8756474869494
        </div>
    </div>

    <!--分隔线-->
    <div class="hang10 clear bg-hui"></div>

    <div class="div-group-10 overflow-hidden line-bottom-92 clear">
        <div class="hang20 line-height20 weight500">
            <div class="pull-left">岗位名称：[快递分拣日结]<i class="zi-26bd93 pl-10">￥100</i></div>
            <div class="pull-right zi-26bd93">已完成</div>
        </div>
    </div>
    <div class="width-9 maring-a pt-10 pb-10 overflow-hidden zi-6 weight500">
        <div class="hang30 line-height30">
            <i class="zi-hei">接单日期：</i>2018-03-03 12：00：00
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">集合时间：</i>2018-03-03 11：30
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">上班时间：</i>12：00<i class="pl-10 pr-10">至</i>22：00
        </div>
        <div class=" line-height30">
            <i class="zi-hei">地点：</i>陕西省西安市未央区某某某物流园向北100米<i class="zi-lan-tq pl-5">查看地图</i>
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">订单编号：</i>8756474869494
        </div>
    </div>

    <!--分隔线-->
    <div class="hang10 clear bg-hui"></div>

    <div class="div-group-10 overflow-hidden line-bottom-92 clear">
        <div class="hang20 line-height20 weight500">
            <div class="pull-left">岗位名称：[快递分拣日结]<i class="zi-26bd93 pl-10">￥100</i></div>
            <div class="pull-right zi-hui-tq">未完成</div>
        </div>
    </div>
    <div class="width-9 maring-a pt-10 pb-10 overflow-hidden zi-6 weight500">
        <div class="hang30 line-height30">
            <i class="zi-hei">接单日期：</i>2018-03-03 12：00：00
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">集合时间：</i>2018-03-03 11：30
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">上班时间：</i>12：00<i class="pl-10 pr-10">至</i>22：00
        </div>
        <div class=" line-height30">
            <i class="zi-hei">地点：</i>陕西省西安市未央区某某某物流园向北100米<i class="zi-lan-tq pl-5">查看地图</i>
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">订单编号：</i>8756474869494
        </div>
    </div>

    <!--分隔线-->
    <div class="hang10 clear bg-hui"></div>

    <div class="div-group-10 overflow-hidden line-bottom-92 clear">
        <div class="hang20 line-height20 weight500">
            <div class="pull-left">岗位名称：[快递分拣日结]<i class="zi-26bd93 pl-10">￥100</i></div>
            <div class="pull-right zi-green">已报名</div>
        </div>
    </div>
    <div class="width-9 maring-a pt-10 pb-10 overflow-hidden zi-6 weight500">
        <div class="hang30 line-height30">
            <i class="zi-hei">接单日期：</i>2018-03-03 12：00：00
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">集合时间：</i>2018-03-03 11：30
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">上班时间：</i>12：00<i class="pl-10 pr-10">至</i>22：00
        </div>
        <div class=" line-height30">
            <i class="zi-hei">地点：</i>陕西省西安市未央区某某某物流园向北100米<i class="zi-lan-tq pl-5">查看地图</i>
        </div>
        <div class="hang30 line-height30">
            <i class="zi-hei">订单编号：</i>8756474869494
        </div>
    </div>

</main>

<%@include file="/webcom/mission-foot.jsp"%>
</body>
</html>