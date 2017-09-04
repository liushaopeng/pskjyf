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
    <title>发布招聘信息</title>
    <!-- Resource style -->
    <script src="js/jquery-1.8.3.js"></script>
    <link href="css/YLui.css" rel="stylesheet" type="text/css"/>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <style>
        .btn-cheng {
            background-color: #26bd93;
        }

        .btn-cheng:hover {
            background-color: #21a883;
        }
        .zi-26bd93{
            color: #26bd93;
        }
    </style>
</head>
<body>


<!--在用户要发布信息时候会做选择是个人发布还是公司发布，在用户选择后会做不同的跳转进行区别  填写信息也会不相同 NO1:个人用户需要采集身份证信息等  NO2:公司会需要营业执照等信息-->



<main class="cmp640">
    <div class="div-group-5 pl-10 pr-10">

        <div class="size14 line-bottom-92 weight500 pt-10 pb-10" style="padding-left: 2px;">职位简介</div>
        <div class="line-top-92 line-bottom-92 line-right-92 line-left-92">
            <a href="javascript:shopping_xianshi()">
                <div class="width-10 size14 pt-10 zi-hui hang50 weight500">
                    <input class="width-10 pl-10 pr-10 size14 zi-hui hang30 weight500" type="text" name=""
                           value="职位类别" onfocus="if(this.value=='职位类别'){this.value=''};this.style.color='#666666';"
                           onblur="if(this.value==''||this.value=='职位类别'){this.value='职位类别';this.style.color='#aaa';}">
                </div>
            </a>
        </div>
        <div class="line-bottom-92 line-right-92 pt-10 line-left-92 hang50">
            <input class="width-10 pl-10 pr-10 size14 zi-hui hang30 weight500" type="text" name=""
                   value="招聘人数" onfocus="if(this.value=='招聘人数'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='招聘人数'){this.value='招聘人数';this.style.color='#aaa';}">
        </div>
        <div class="line-bottom-92 line-right-92 pt-10 line-left-92 hang50">
            <input class="width-10 pl-10 pr-10 size14 zi-hui hang30 weight500" type="text" name=""
                   value="年龄要求" onfocus="if(this.value=='年龄要求'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='年龄要求'){this.value='年龄要求';this.style.color='#aaa';}">
        </div>
        <div class="line-bottom-92 line-right-92 pt-10 line-left-92 hang50">
            <input class="width-10 pl-10 pr-10 size14 zi-hui hang30 weight500" type="text" name=""
                   value="学历要求" onfocus="if(this.value=='学历要求'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='学历要求'){this.value='学历要求';this.style.color='#aaa';}">
        </div>
        <div class="line-bottom-92 line-right-92 pt-10 line-left-92 hang50">
            <input class="width-10 pl-10 pr-10 size14 zi-hui hang30 weight500" type="text" name=""
                   value="经验要求" onfocus="if(this.value=='经验要求'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='经验要求'){this.value='经验要求';this.style.color='#aaa';}">
        </div>
        <div class="line-bottom-92 line-right-92 pt-10 line-left-92 hang50">
            <input class="width-10 pl-10 pr-10 size14 zi-hui hang30 weight500" type="text" name=""
                   value="薪资待遇" onfocus="if(this.value=='薪资待遇'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='薪资待遇'){this.value='薪资待遇';this.style.color='#aaa';}">
        </div>
        <div class="line-bottom-92 line-right-92 pt-10 line-left-92 hang50">
            <input class="width-10 pl-10 pr-10 size14 zi-hui hang30 weight500" type="text" name=""
                   value="工作地点" onfocus="if(this.value=='工作地点'){this.value=''};this.style.color='#666666';"
                   onblur="if(this.value==''||this.value=='工作地点'){this.value='工作地点';this.style.color='#aaa';}">
        </div>
        <div class="line-bottom-92 line-right-92 line-left-92 overflow-hidden zi-hui">
            <form action="">
                <textarea onfocus="if(this.value=='职位描述10-300个字'){this.value=''};this.style.color='#666666';"
                          onblur="if(this.value==''||this.value=='职位描述10-300个字'){this.value='职位描述10-300个字';this.style.color='#aaa';}"
                          rows="5" name="message" class="size14 weight500"
                          style="height:90px;" onKeyDown="textCounter(message,remLen,300);"
                          onKeyUp="textCounter(message,remLen,300);">职位描述10-300个字</textarea>
                <input name="remLen" type="text" value="300字" size="5" readonly="readonly"
                       class="zi-hui size12 pl-2 pb-10 pull-right">
            </form>
        </div>

        <div class="size14 line-bottom-92 weight500 div-group-10" style="padding-left: 2px;">公司福利</div>
        <div class="line-bottom-92 line-right-92 line-left-92 overflow-hidden pt-10 pl-10">
            <font size="2">
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">社保</div>
                </div>
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">公积金</div>
                </div>
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">双休</div>
                </div>
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">包吃住</div>
                </div>
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">餐补</div>
                </div>
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">房补</div>
                </div>
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">交通补助</div>
                </div>
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">电话补助</div>
                </div>
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">年终奖</div>
                </div>
                <div class="col-4 pb-10">
                    <div class="pull-left pr-5">
                        <div class="img-wh20 bg-bai-5 maring-a txt-c"
                             style="border: solid #26bd93 2px;">
                            <font size="1">
                                <i class="fa fa-check zi-26bd93 display-none"
                                   style="line-height:16px;"></i>
                            </font>
                        </div>
                    </div>
                    <div class="hang20 line-height20 pull-left weight500">带薪年假</div>
                </div>

            </font>
        </div>

    </div>

</main>
<div class="clear hang70"></div>

<div class=" button_foot bg-bai zi-hui shadow-wai cmp640">
    <div class="zi-hui-wx txt-c weight500 button_group1">
        <div class="hang50 line-height50 zi-bai btn-cheng txt-c">
            保存发布
        </div>
    </div>
</div>


<!--限制textarea框字数代码-->
<script language="JavaScript">

    function textCounter(field, countfield, maxlimit) {
        // 函数，3个参数，表单名字，表单域积分素名，限制字符；
        if (field.value.length > maxlimit)
        //如果积分素区字符数大于最大字符数，按照最大字符数截断；
            field.value = field.value.substring(0, maxlimit);
        else
        //在记数区文本框内显示剩余的字符数；
            countfield.value = maxlimit - field.value.length;
    }

</script>
</body>
</html>