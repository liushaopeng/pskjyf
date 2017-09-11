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
    <title>信息录取</title>
    <script src="${ctx}/app/js/jquery-1.8.3.js"></script>
    <link href="${ctx}/app/css/YLui.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/app/css/font-awesome.min.css" rel="stylesheet">
    <style>
        .btn-26bd93 {
            background-color: #26bd93;
        }

        .btn-26bd93:hover {
            background-color: #21a883;
        }
    </style>
</head>
<body class="cmp640">
<main>
    <!--必填否则无法领取佣金薪水-->
    <div class="line-bottom overflow-hidden weight500 pl-10 pr-10">
        <div class="pull-left hang50 line-height50 zi-6">
            真实姓名<i class="zi-hui weight100 pl-5 size10">(必填)</i>
        </div>
        <div class=" pull-right hang50">
            <input class="width-10 size12 txt-r zi-hui weight500 hang50 line-height50" type="text" name=""
                   value="刘刚"
                   onfocus="if(this.value=='刘刚'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='刘刚'){this.value='刘刚';this.style.color='#aaa';}">
        </div>
    </div>

    <div class="line-bottom overflow-hidden weight500 pl-10 pr-10">
        <div class="pull-left hang50 line-height50 zi-6">
            手机号<i class="zi-hui weight100 pl-5 size10">(必填)</i>
        </div>
        <div class=" pull-right hang50">
            <input class="width-10 size12 txt-r zi-hui weight500 hang50 line-height50" type="text" name=""
                   value="15091532287"
                   onfocus="if(this.value=='610126199709083456'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='610126199709083456'){this.value='610126199709083456';this.style.color='#aaa';}">
        </div>
    </div>

    <div class="overflow-hidden weight500 pl-10 pr-10">
        <div class="pull-left hang50 line-height50 zi-6">
            身份证号码<i class="zi-hui weight100 pl-5 size10">(必填)</i>
        </div>
        <div class=" pull-right hang50">
            <input class="width-10 size12 txt-r zi-hui weight500 hang50 line-height50" type="text" name=""
                   value="610126199709083456"
                   onfocus="if(this.value=='610126199709083456'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='610126199709083456'){this.value='610126199709083456';this.style.color='#aaa';}">
        </div>
    </div>

    <div class="hang10 bg-hui-92"></div>

    <div class="line-bottom overflow-hidden weight500">
        <div class="pull-left pl-10 hang50 line-height50 zi-6">
            微信帐号<i class="zi-hui weight100 pl-5 size10">(选填)</i>
        </div>
        <div class=" pull-right hang50 pr-10">
            <input class="width-10 size12 txt-r zi-hui weight500 hang50 line-height50" type="text" name=""
                   value="js5512jishy"
                   onfocus="if(this.value=='js5512jishy'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='js5512jishy'){this.value='js5512jishy';this.style.color='#aaa';}">
        </div>
    </div>

    <div class="line-bottom overflow-hidden weight500">
        <div class="pull-left pl-10 hang50 line-height50 zi-6">
            备用手机<i class="zi-hui weight100 pl-5 size10">(选填)</i>
        </div>
        <div class=" pull-right hang50 pr-10">
            <input class="width-10 size12 txt-r zi-hui weight500 hang50 line-height50" type="text" name=""
                   value="15091531187"
                   onfocus="if(this.value=='15091531187'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='15091531187'){this.value='15091531187';this.style.color='#aaa';}">
        </div>
    </div>

    <a href="#">
        <div class=" clear mt-30">
            <div class="width-9_5 maring-a btn-26bd93 zi-bai div-group-10 maring-a size14 txt-c weight500 border-radius3 lock">
                完成
            </div>
        </div>
    </a>
</main>
<%@include file="/webcom/mission-foot.jsp"%>
</body>
</html>