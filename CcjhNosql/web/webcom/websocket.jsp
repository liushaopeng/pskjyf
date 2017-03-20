<%@ page contentType="text/html;charset=UTF-8" %>
<script>

var socket = new WebSocket("ws://localhost:8080/CcjhNosql/websocket");  
socket.onopen = function() {
	  var submitData = {
		         id : id
		      };
		     $.post('${ctx}/suc/activity!ajaxcreateewm.action', submitData, function(json) {
		       if(json.state==0){ 
		    		var msg = {
		    				"init" : "init",
		    				"uid" : "123456789",
		    				"custid" : "123456789123456789",
		    				"type" : "test",
		    			};
		    		socket.send(JSON.stringify(msg)); 
		       }else{ 
		       } 
		     }, "json"); 
	
};

socket.onclose = function(evt) { 
}
socket.onerror = function(evt) { 
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
socket.onmessage = function(evt) {
	var data = JSON.parse(evt.data); 
	alert(data.message);
};  
</script>
