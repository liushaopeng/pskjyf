<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webcom/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--底部按钮-->
<div class="clear hang60"></div>
<font size="2">
    <div class=" button_foot bg-bai shadow-wai cmp640">
        <div class=" button_group1 zi-6" onclick="window.location.href='${ctx}/parttime/mission!index.action?custid=${custid}&lscode=${lscode}'"onclick="window.location.href='${ctx}/parttime/mission!index.action?custid=${custid}&lscode=${lscode}'">
            <div class="bottom-26bd93 zi-hui-wx txt-c weight500 line-right_bai hang50">
                <font size="3">
                    <div class="hang25 line-height30 fa fa-home"></div>
                </font>
                <font size="2">
                    <div class="hang25 line-height25">
                        首页
                    </div>
                </font>
            </div>
        </div>
        <div class=" button_group1 zi-6" onclick="window.location.href='${ctx}/parttime/mission!order.action?custid=${custid}&lscode=${lscode}'">
            <div class="bottom-26bd93 zi-hui-wx txt-c weight500 line-right_bai hang50">
                <font size="3">
                    <div class="hang25 line-height30 fa fa-envelope-open-o"></div>
                </font>
                <font size="2">
                    <div class="hang25 line-height25">
                        订单
                    </div>
                </font>
            </div>
        </div>
        <div class=" button_group1 zi-6">
            <div class="bottom-26bd93 zi-hui-wx txt-c weight500 line-right_bai hang50">
                <font size="3">
                    <div class="hang25 line-height30 fa fa-clone position-r">
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
        <div class=" button_group1 zi-6" onclick="window.location.href='${ctx}/parttime/mission!mine.action?custid=${custid}&lscode=${lscode}'">
            <div class="bottom-26bd93 zi-hui-wx txt-c weight500 line-right_bai hang50">
                <font size="3">
                    <div class="hang25 line-height30 fa fa-user"></div>
                </font>
                <font size="2">
                    <div class="hang25 line-height25">
                        我的
                    </div>
                </font>
            </div>
        </div>
    </div>
</font>