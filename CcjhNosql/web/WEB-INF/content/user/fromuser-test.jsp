<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webcom/taglibs.jsp" %> 
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
    <title>个人中心</title>
    <!-- Resource style -->
    <script src="${ctx }/app/js/jquery-1.8.3.js"></script>
    <link href="${ctx}/app/css/YLui.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/app/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/app/css/style_0.css" rel="stylesheet"> 
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <style>

        .hang45 {
            height: 45px;
        }

        .pt-13 {
            padding-top: 13px;
        }

        .line-height42 {
            line-height: 49px;
        }

        .line-height22 {
            line-height: 23px;
        }

        .border-radius2 {
            border-radius: 2px;
        }

        .btn-lan-tq {
            background-color: #00a5e0;
        }

        .btn-lan-tq:hover, .btn-lan-tq:focus {
            background-color: #0092c7;
        }
        
        .img-w16 {
            width: 16px;
        }

        .img-h16 {
            height: 16px;
            line-height: 19px;
        }
        

    </style> 
</head>
<body class="cmp640">
<main>
   <div class="container" style="padding-top:20px;">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Barrage</h3>
				</div>
				<div class="panel-body" id="content"></div>
			</div>
			<hr/>
			<input type="text" class="form-control" placeholder="msg" aria-describedby="sizing-addon1" id="msg">
			<hr/>
			
			<hr/>
			<button type="button" class="btn btn-lg btn-success btn-block" onclick="emit()">Emit</button>
		</div>
		
</main>
 <script>

var socket = new WebSocket("ws://localhost:8080/CcjhNosql/websocket");

$(function() {
	listen();
})

function emit() {
	var text = encodeScript($("#msg").val());
	var msg = {
		"message" : text,
		"color" : "#CECECE",
		"bubbleColor" : "#2E2E2E",
		"fontSize" : "12",
		"fontType" : "黑体"
	};
	msg = JSON.stringify(msg);

	socket.send(msg);
	
	$("#content").append("<kbd style='color: #" + "CECECE" + ";float: right; font-size: " + 12 + ";'>" + text +  "</kbd><br/>");
	$("#msg").val("");
}

function listen() {
	socket.onopen = function() {
		var msg = {
				"login" : "login",
				"uid" : "123456789", 
			};
		socket.send(JSON.stringify(msg));
		$("#content").append("<kbd>Welcome!</kbd></br>");
	};
	socket.onmessage = function(evt) {
		var data = JSON.parse(evt.data);
		$("#content").append("<kbd style='color: #" + data.color + ";font-size: " + data.fontSize + ";margin-top: 10px;'>" + data.userName + " Say: " + data.message + "</kbd></br>");
	};
	socket.onclose = function(evt) {
		$("#content").append("<kbd>" + "Close!" + "</kbd></br>");
	}
	socket.onerror = function(evt) {
		$("#content").append("<kbd>" + "ERROR!" + "</kbd></br>");
	}
}

document.onkeydown = function(event){
	var e = event || window.event || arguments.callee.caller.arguments[0];
	if(e && e.keyCode == 13){ // enter 键
		emit();
	}
};
function encodeScript(data) {
	if(null == data || "" == data) {
		return "";
	}
	return data.replace("<", "&lt;").replace(">", "&gt;");
}
</script> 
</body>
</html>