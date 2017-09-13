package com.lsp.parttime.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.bson.util.StringRangeSet;
import org.springframework.beans.factory.annotation.Autowired;

import com.lsp.hou.web.HoufaetAction;
import com.lsp.parttime.entity.Mission;
import com.lsp.parttime.entity.Order;
import com.lsp.pub.dao.BaseDao;
import com.lsp.pub.db.MongoSequence;
import com.lsp.pub.entity.PubConstants;
import com.lsp.pub.util.DateFormat;
import com.lsp.pub.util.Struts2Utils;
import com.lsp.pub.util.TenpayUtil;
import com.lsp.pub.util.UniObject;
import com.lsp.pub.web.GeneralAction;
import com.mongodb.DBObject;

import net.sf.json.JSONArray;
/**
 * 订单管理
 * @author lsp
 *
 */
@Namespace("/parttime")
@Results({ @Result(name = HoufaetAction.RELOAD, location = "order.action", params = {"fypage", "%{fypage}" }, type = "redirect") })
public class OrderAction extends GeneralAction<Order>{

	private static final long serialVersionUID = -6784469775589971579L;
	@Autowired
	private BaseDao baseDao;
	private Order entity = new Order();
	private Long _id;

	private MongoSequence mongoSequence;

	@Autowired
	public void setMongoSequence(MongoSequence mongoSequence) {
		this.mongoSequence = mongoSequence;
	}

	@Override
	public Order getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String input() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String save() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void prepareModel() throws Exception {
		// TODO Auto-generated method stub
		
	}
	/**
	 * 生成订单
	 */
	public void  createMiss() {
		getLscode();
		Map<String, Object>submap=new HashMap<String, Object>(); 
		submap.put("state", 1);
		String mid=Struts2Utils.getParameter("mid"); 
		try {
			if (StringUtils.isNotEmpty(mid)) {
				DBObject dbObject=baseDao.getMessage(PubConstants.PARTTIME_MISSION, Long.parseLong(mid));
				if (dbObject!=null) {
					Mission mission=(Mission) UniObject.DBObjectToObject(dbObject, Mission.class);
					HashMap<String, Object>whereMap=new HashMap<>();
					whereMap.put("mid",Long.parseLong(mid));
					whereMap.put("fromid",fromUserid);
					Long count=baseDao.getCount(PubConstants.PARTTIME_ORDER, whereMap);
					if (count!=0) { 
						//重复报名
						submap.put("state", 2);
						String json = JSONArray.fromObject(submap).toString(); 
						Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
						return;
					}
					Order order=new Order();
					//10位序列号,可以自行调整。
					//四位随机数
					String strRandom = TenpayUtil.buildRandom(4) + "";
					String orderno = DateFormat.getDate() + strRandom+mongoSequence.currval(PubConstants.PARTTIME_ORDER);
					order.set_id(orderno);  
					order.setCreatedate(new Date());
					order.setMid(Long.parseLong(mid));
					order.setFromid(fromUserid);
					order.setCustid(custid);
					order.setCompany(mission.getCompany());
					order.setMtitle(mission.getTitle());
					order.setGatherdate(mission.getGatherdate());
					order.setStartdate(mission.getStartdate());
					order.setEnddate(mission.getEnddate());
					order.setPrice(mission.getPrice());
					order.setJstype(mission.getJstype());
					order.setWorkaddress(mission.getWorkaddress());
					baseDao.insert(PubConstants.PARTTIME_ORDER, order);
					submap.put("state", 0);
				}
				
			} 
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String json = JSONArray.fromObject(submap).toString(); 
		Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
	}
	/**
	 * 更改订单状态
	 * @param id
	 * @return
	 */
	public boolean updateState(String id,int state) {
		DBObject dbObject=baseDao.getMessage(PubConstants.PARTTIME_ORDER, id);
		if (dbObject!=null) {
			Order order=(Order) UniObject.DBObjectToObject(dbObject, Order.class);
			order.setState(state);
			baseDao.insert(PubConstants.PARTTIME_ORDER, order);
			return true;
		}
		return false; 
	}
	 

}
