package com.lsp.mqsever;  
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;  

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;  
import com.lsp.pub.db.MongoDbUtil; 
import com.lsp.pub.db.MongoSequence;
import com.lsp.pub.entity.PubConstants;  
import com.lsp.pub.util.DateFormat;
import com.lsp.pub.util.DateUtil;
import com.lsp.pub.util.UniObject; 
import com.lsp.suc.entity.DatingInfo;
import com.lsp.suc.entity.DatingMember;
import com.lsp.suc.entity.DatingReward;
import com.lsp.suc.entity.DatingStatistical;
import com.lsp.website.service.WwzService;
import com.lsp.weixin.entity.WxUser;
import com.mongodb.DBObject;  
import com.sun.swing.internal.plaf.basic.resources.basic;
 
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
			JSONObject obj = (JSONObject) JSON.parse(txtMsg.getText().toString());
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
			} 
		
			
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mongoDbUtil.close();
	}
	
	
}
