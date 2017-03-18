package com.lsp.websocket;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.lsp.websocket.service.WebsoketListen;

import net.sf.json.JSONObject;
/**
 * 聊天服务器类
 * @author lsp
 *
 */
@ServerEndpoint("/websocket")
public class ChatServer implements WebsoketListen{
	 private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");    // 日期格式化

	    @OnOpen
	    public void open(Session session) {
	        // 添加初始化操作 
	    	sessionCreated(session); 
	    }

	    /**
	     * 接受客户端的消息，并把消息发送给所有连接的会话
	     * @param message 客户端发来的消息
	     * @param session 客户端的会话
	     */
	    @OnMessage
	    public void getMessage(String message, Session session) {  
	        // 把客户端的消息解析为JSON对象
	        JSONObject jsonObject = JSONObject.fromObject(message); 
	        if(jsonObject.get("login")!=null){
	        	//绑定用户 
	        	boundSessions(session,jsonObject.getString("uid"));
	        	
	        }else{
	        	  // 在消息中添加发送日期
		        jsonObject.put("date", DATE_FORMAT.format(new Date()));
		        jsonObject.put("userName", "admin");
		        // 把消息发送给所有连接的会话
		        for (Session openSession : session.getOpenSessions()) {
		            // 添加本条消息是否为当前会话本身发的标志
		            jsonObject.put("isSelf", openSession.equals(session));
		            // 发送JSON格式的消息
		            sendMessage(session,jsonObject.toString());
		        }
	        } 
	        System.out.println(getSession(session).get("uid"));
	      
	    }

	    @OnClose
	    public void close(Session session) {
	        // 添加关闭会话时的操作 
	    	sessionDestroyed(session); 
	    }

	    @OnError
	    public void error(Throwable t) {
	        // 添加处理错误的操作
	    }

		@Override
		public void sessionCreated(Session session) {
			Map<String, Object>obj=new HashMap<>();
			obj.put("session", session);
			WebsoketListen.SessionMap.put(session.getId(), obj);
			
		}

		@Override
		public void sessionDestroyed(Session session) {
			WebsoketListen.SessionMap.remove(session.getId());
			
		}

		@Override
		public Collection<Map<String, Object>> getSessions() {
			// TODO Auto-generated method stub 
			return WebsoketListen.SessionMap.values();
		}
		/**
		 * 向客户端发送消息
		 * @param session
		 * @param msg
		 */
		public  void   sendMessage(Session session,String msg){
			session.getAsyncRemote().sendText(msg);
		}

		@Override
		public void boundSessions(Session session, String uid) {
			// TODO Auto-generated method stub 
			Map<String, Object> obj= WebsoketListen.SessionMap.get(session.getId());
			obj.put("uid",uid);
			WebsoketListen.SessionMap.put(session.getId(), obj);
		}

		@Override
		public Map<String, Object> getSession(Session session) {
			// TODO Auto-generated method stub
			return WebsoketListen.SessionMap.get(session.getId());
		}

}
