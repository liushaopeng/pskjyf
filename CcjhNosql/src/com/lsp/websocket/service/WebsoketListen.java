package com.lsp.websocket.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map; 
import javax.websocket.Session; 

public interface WebsoketListen{

	  public static final Map<String, Map<String, Object>> SessionMap = new HashMap<String, Map<String, Object>>(); 
	  /** 
	      * Session创建事件 
	      */  
	  public void sessionCreated(Session session);  
	  /** 
	      * Session移除事件 
	      */  
	  public void sessionDestroyed(Session session);  
	  /** 
	      * 获取所有Session 
	      */  
	  public Collection<Map<String, Object>> getSessions(); 
	  /** 
	      * 绑定用户
	      */  
	  public void boundSessions(Session session,String uid); 
	  public Map<String, Object>  getSession(Session session);
	  
}
