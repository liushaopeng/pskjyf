package com.lsp.mqsever;   
import java.util.Iterator;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;  

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component; 
import com.lsp.pub.db.MongoDbUtil; 
import com.lsp.pub.db.MongoSequence;
import com.lsp.pub.entity.PubConstants;  
import com.lsp.pub.util.UniObject;  
import com.lsp.websocket.ChatServer;
import com.lsp.websocket.service.WebsoketListen;
import com.lsp.weixin.entity.WxUser;
import com.mongodb.DBObject;
import com.mongodb.util.JSON; 

import net.sf.json.JSONObject;
 
/**
 * 在线状态更新
 * @author lsp 
 *   
 */
@Component
public class OnlineConsumer implements MessageListener {

	@Override
	public void onMessage(Message message) {
		// TODO Auto-generated method stub
		MongoDbUtil mongoDbUtil=new MongoDbUtil(); 
		MongoSequence mongoSequence=new MongoSequence();  
		TextMessage txtMsg = ((TextMessage) message);// 任务id  
		try { 
			JSONObject obj =JSONObject.fromObject(txtMsg.getText());   
			String type=obj.getString("type");  
			String id=obj.getString("id");   
			if(Integer.parseInt(type)==1){ 
				DBObject dbObject=mongoDbUtil.findOneById(PubConstants.DATA_WXUSER, id);
				if(dbObject!=null){
					WxUser user=(WxUser) UniObject.DBObjectToObject(dbObject, WxUser.class);
					user.setOnline(1); 
					mongoDbUtil.insertUpdate(PubConstants.DATA_WXUSER, user);
				}
			}else if(Integer.parseInt(type)==0){ 
				DBObject dbObject=mongoDbUtil.findOneById(PubConstants.DATA_WXUSER, id);
				if(dbObject!=null){
					WxUser user=(WxUser) UniObject.DBObjectToObject(dbObject, WxUser.class);
					user.setOnline(0); 
					mongoDbUtil.insertUpdate(PubConstants.DATA_WXUSER, user);
				}
			}else if (Integer.parseInt(type)==2) {
				//系统发送消息到指定用户
				String msg=obj.getString("msg");   
				for (String string :id.split(",")) { 
					if(WebsoketListen.SessionidMap.get(string)!=null){
						JSONObject  jsonObject=new JSONObject();
						jsonObject.put("admin","admin");
						jsonObject.put("message",msg); 
						ChatServer.sendMessages(WebsoketListen.SessionMap.get(WebsoketListen.SessionidMap.get(string)),jsonObject.toString());
						 
					} 
				} 
			}else if (Integer.parseInt(type)==3) {
				//系统发送消息到指定用户
				JSONObject msg=obj.getJSONObject("msg");
				for (String string :id.split(",")) {
					if(msg!=null&&StringUtils.isNotEmpty(string)&&WebsoketListen.SessionidMap.get(string)!=null){
						 
						JSONObject  jsonObject=new JSONObject(); 
						Iterator it = msg.keys();
			 	        while (it.hasNext()) { 
			                 String key = (String) it.next();
			                 if(!key.equals("type")){
			                	 jsonObject.put(key,obj.get(key)); 
			                 } 
			             } 
						ChatServer.sendMessages(WebsoketListen.SessionMap.get(WebsoketListen.SessionidMap.get(string)),jsonObject.toString());
						 
					} 
				} 
				
			} 
		 
		} catch (JMSException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		} 
		mongoDbUtil.close();
	}
	
	
}
