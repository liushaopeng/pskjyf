package com.lsp.parttime.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.lsp.hou.web.HoufaetAction;
import com.lsp.parttime.entity.Employee;
import com.lsp.parttime.entity.Mission;
import com.lsp.pub.dao.BaseDao;
import com.lsp.pub.db.MongoSequence;
import com.lsp.pub.entity.PubConstants;
import com.lsp.pub.util.SpringSecurityUtils;
import com.lsp.pub.util.Struts2Utils;
import com.lsp.pub.util.UniObject;
import com.lsp.pub.web.GeneralAction;
import com.mongodb.DBObject;
import com.sun.faces.taglib.html_basic.DataTableTag;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 任务管理
 * @author lsp
 *
 */
@Namespace("/parttime")
@Results({ @Result(name = HoufaetAction.RELOAD, location = "mission.action", params = {"fypage", "%{fypage}" }, type = "redirect") })
public class MissionAction extends GeneralAction<Mission>{

	private static final long serialVersionUID = -6784469775589971579L;
	@Autowired
	private BaseDao baseDao;
	private Mission entity = new Mission();
	private Long _id; 
	public void set_id(Long _id) {
		this._id = _id;
	}
	private MongoSequence mongoSequence;

	@Autowired
	public void setMongoSequence(MongoSequence mongoSequence) {
		this.mongoSequence = mongoSequence;
	}
	@Override
	public String execute() throws Exception {
		custid=SpringSecurityUtils.getCurrentUser().getId();
		HashMap<String, Object>whereMap=new HashMap<>();
		HashMap<String, Object>sortMap=new HashMap<>();
		whereMap.put("custid", custid);
		if(StringUtils.isNotEmpty(Struts2Utils.getParameter("fypage"))) {
			fypage=Integer.parseInt(Struts2Utils.getParameter("fypage"));
		}
		List<DBObject>list=baseDao.getList(PubConstants.PARTTIME_MISSION, whereMap,fypage,10,sortMap);
		fycount=baseDao.getCount(PubConstants.PARTTIME_MISSION,whereMap);
		Struts2Utils.getRequest().setAttribute("list",list);
		Struts2Utils.getRequest().setAttribute("custid",custid);
		return SUCCESS; 
	}

	@Override
	public Mission getModel() {
		// TODO Auto-generated method stub
		return entity;
	}

	@Override
	public String input() throws Exception {
		// TODO Auto-generated method stub
		return "add";
	}

	@Override
	public String update() throws Exception {
		// TODO Auto-generated method stub
		return "add";
	}

	@Override
	public String save() throws Exception {
		// TODO Auto-generated method stub
		if (_id==null) {
			_id=mongoSequence.currval(PubConstants.PARTTIME_MISSION);
		} 
		entity.set_id(_id);
		entity.setCustid(SpringSecurityUtils.getCurrentUser().getId());
		String gatherdate=Struts2Utils.getParameter("gatherdate");
		String startdate=Struts2Utils.getParameter("startdate");
		String enddate=Struts2Utils.getParameter("enddate");
		
		entity.setCreatedate(new Date());
		baseDao.insert(PubConstants.PARTTIME_MISSION, entity);
		return RELOAD;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return RELOAD;
	}

	@Override
	protected void prepareModel() throws Exception {
		// TODO Auto-generated method stub
		if (_id!=null) {
			entity=(Mission) baseDao.getMessage(PubConstants.PARTTIME_MISSION, _id);
		}else {
			entity=new Mission();
		}
		
	}
	public void upd() throws Exception {
		DBObject db = baseDao.getMessage(PubConstants.PARTTIME_MISSION, _id);
		String json = JSONObject.fromObject(db).toString();
		Struts2Utils.renderJson(json, new String[0]);
	}
	/**
	 * 发布任务
	 */
	public void  createMiss() {
		getLocale();
		Map<String, Object>submap=new HashMap<String, Object>(); 
		submap.put("state", 1);
		String linktel=Struts2Utils.getParameter("linktel");
		String linkname=Struts2Utils.getParameter("linkname"); 
		String experience=Struts2Utils.getParameter("experience");
		String education=Struts2Utils.getParameter("education");
		String num=Struts2Utils.getParameter("num");
		String workaddress=Struts2Utils.getParameter("workaddress");
		String wages=Struts2Utils.getParameter("wages");
		try {
			Mission mission=new Mission();
			mission.set_id(mongoSequence.currval(PubConstants.PARTTIME_MISSION));
			mission.setFromid(fromUserid);
			mission.setCustid(custid);
			mission.setCreatedate(new Date());
			if (StringUtils.isNotEmpty(education)) {
				mission.setEducation(Integer.parseInt(education));
			}
			if (StringUtils.isNotEmpty(experience)) {
				mission.setExperience(Integer.parseInt(experience));
			}
			if (StringUtils.isNotEmpty(num)) {
				mission.setNum(Integer.parseInt(num));
			} 
			mission.setLinkname(linkname);
			mission.setLinktel(linktel);
			mission.setWages(wages);
			mission.setWorkaddress(workaddress);
			baseDao.insert(PubConstants.PARTTIME_MISSION, mission);
			submap.put("state", 0);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String json = JSONArray.fromObject(submap).toString(); 
		Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
	}
	/**
	 * 首页
	 * @return
	 */
	public String index() {
		return "index";
	}
	/**
	 * 详情页
	 * @return
	 */
	public String details() {
		String id=Struts2Utils.getParameter("id");
		if (StringUtils.isNotEmpty(id)) {
			DBObject dbObject=baseDao.getMessage(PubConstants.PARTTIME_MISSION, Long.parseLong(id));
			if (dbObject!=null) {
				String age=dbObject.get("age").toString();
				if (Integer.parseInt(age)==0) {
					dbObject.put("age","18岁以上");
				}
				
				String education=dbObject.get("education").toString();
				if (Integer.parseInt(education)==0) {
					dbObject.put("education","无");
				}
				if (Integer.parseInt(education)==1) {
					dbObject.put("education","大专以上");
				}
				if (Integer.parseInt(education)==2) {
					dbObject.put("education","本科以上");
				}
				if (Integer.parseInt(education)==3) {
					dbObject.put("education","硕士以上");
				}
				
				
				String experience=dbObject.get("experience").toString();
				if (Integer.parseInt(experience)==0) {
					dbObject.put("experience","无");
				}
				if (Integer.parseInt(experience)==1) {
					dbObject.put("experience","一年以上");
				}
				if (Integer.parseInt(experience)==2) {
					dbObject.put("experience","一年到三年");
				}
				if (Integer.parseInt(experience)==3) {
					dbObject.put("experience","三年以上");
				}
			}
			Struts2Utils.getRequest().setAttribute("entity",dbObject);
		}
		return "details";
	}
	/**
	 * 订单
	 * @return
	 */
	public String order() {
		return "order";
	}
	/**
	 * 提现
	 * @return
	 */
	public String withposi() {
		return "withposi";
	}
	/**
	 * 提现记录
	 * @return
	 */
	public String withposidet() {
		return "withposidet";
	}
	/**
	 * 发布
	 * @return
	 */
	public String ajaxadd() {
		return "ajaxadd";
	}
	/**
	 * 我的
	 * @return
	 */
	public String mine() {
		return "mine";
	}
	/**
	 * 我的资料
	 * @return
	 */
	public String minedata() {
		return "minedata";
	}
	/**
	 * ajax获取首页数据
	 */
	public void ajaxIndex() {
		Map<String, Object>submap=new HashMap<String, Object>();
		submap.put("state", 1);
		HashMap<String, Object>whereMap=new HashMap<String, Object>();
		HashMap<String, Object>sortMap=new HashMap<String, Object>();
		sortMap.put("createdate", -1);
		if (StringUtils.isNotEmpty(Struts2Utils.getParameter("fypage"))) {
			fypage=Integer.parseInt(Struts2Utils.getParameter("fypage"));
		}
		List<DBObject>list=baseDao.getList(PubConstants.PARTTIME_MISSION, whereMap,fypage,10, sortMap);
		if(list.size()>0){
			submap.put("state",0);
			for (DBObject dbObject : list) {
				String age=dbObject.get("age").toString();
				if (Integer.parseInt(age)==0) {
					dbObject.put("age","18岁以上");
				}
			}
			submap.put("list",list);	
		}
		
		String json = JSONArray.fromObject(submap).toString(); 
		Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
	}
	/**
	 * ajax获取订单数据
	 */
	public void ajaxOrder() {
		Map<String, Object>submap=new HashMap<String, Object>();
		submap.put("state", 1);
		HashMap<String, Object>whereMap=new HashMap<String, Object>();
		HashMap<String, Object>sortMap=new HashMap<String, Object>();
		sortMap.put("createdate", -1);
		if (StringUtils.isNotEmpty(Struts2Utils.getParameter("fypage"))) {
			fypage=Integer.parseInt(Struts2Utils.getParameter("fypage"));
		}
		List<DBObject>list=baseDao.getList(PubConstants.PARTTIME_ORDER, whereMap,fypage,10, sortMap);
		if(list.size()>0){
			submap.put("state",0);
			submap.put("list",list);	
		}
		
		String json = JSONArray.fromObject(submap).toString(); 
		Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
	}
	/**
	 * ajax获取提现数据
	 */
	public void ajaxWithposi() {
		Map<String, Object>submap=new HashMap<String, Object>();
		submap.put("state", 1);
		HashMap<String, Object>whereMap=new HashMap<String, Object>();
		HashMap<String, Object>sortMap=new HashMap<String, Object>();
		sortMap.put("createdate", -1);
		if (StringUtils.isNotEmpty(Struts2Utils.getParameter("fypage"))) {
			fypage=Integer.parseInt(Struts2Utils.getParameter("fypage"));
		}
		List<DBObject>list=baseDao.getList(PubConstants.PARTTIME_ASSETSRECORD, whereMap,fypage,10, sortMap);
		if(list.size()>0){
			submap.put("state",0);
			submap.put("list",list);	
		}
		
		String json = JSONArray.fromObject(submap).toString(); 
		Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
	}
	 
}
