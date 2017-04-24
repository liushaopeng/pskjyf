package com.lsp.suc.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.lsp.pub.dao.BaseDao;
import com.lsp.pub.db.MongoSequence;
import com.lsp.pub.entity.PubConstants;
import com.lsp.pub.util.SpringSecurityUtils;
import com.lsp.pub.util.Struts2Utils;
import com.lsp.pub.util.UniObject;
import com.lsp.pub.web.GeneralAction; 
import com.lsp.suc.entity.LawyerInfo;
import com.lsp.website.service.WwzService;
import com.mongodb.DBObject;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject; 
@Namespace("/suc")
@Results( { @Result(name = LawyerAction.RELOAD, location = "lawyerinfo.action",params={"fypage", "%{fypage}"}, type = "redirect") })
public class LawyerAction extends GeneralAction<LawyerInfo>{
 
	private static final long serialVersionUID = -6784469775589971579L;

	@Autowired
	private BaseDao baseDao;
	private MongoSequence mongoSequence;	
	
	@Autowired
	public void setMongoSequence(MongoSequence mongoSequence) {
		this.mongoSequence = mongoSequence;
	}
	@Autowired
	private WwzService wwzService; 
	private LawyerInfo entity=new LawyerInfo();
	private Long _id;
	@Override
	public String execute() throws Exception {
		HashMap<String,Object>whereMap=new HashMap<>();
		HashMap<String,Object>sortMap=new HashMap<>();
		custid=SpringSecurityUtils.getCurrentUser().getId();
		whereMap.put("custid",custid);
		sortMap.put("createdate",-1);
		if (StringUtils.isNotEmpty(Struts2Utils.getParameter("fypage"))) {
			fypage=Integer.parseInt(Struts2Utils.getParameter("fypage"));
		}
		List<DBObject>list=baseDao.getList(PubConstants.SUC_LAWYERINFO, whereMap,fypage,10,sortMap);
		if (list.size()>0) {
			Struts2Utils.getRequest().setAttribute("list", list);
		}
		fycount=baseDao.getCount(PubConstants.SUC_LAWYERINFO, whereMap);
		return SUCCESS; 
	}
	
	@Override
	public LawyerInfo getModel() {
		// TODO Auto-generated method stub
		return entity;
	}

	@Override
	public String input() throws Exception {
		// TODO Auto-generated method stub
		return "add";
	}

	public void set_id(Long _id) {
		this._id = _id;
	}
	@Override
	public String update() throws Exception {
		// TODO Auto-generated method stubr
		DBObject dbObject=baseDao.getMessage(PubConstants.SUC_LAWYERINFO, _id);
		Struts2Utils.getRequest().setAttribute("entity",dbObject);
		return RELOAD;
	}

	@Override
	public String save() throws Exception {
		// TODO Auto-generated method stub
		if (_id==null) {
			_id=mongoSequence.currval(PubConstants.SUC_LAWYERINFO);
		}
		entity.set_id(_id);
		entity.setCustid(SpringSecurityUtils.getCurrentUser().getId());
		entity.setCreatedate(new Date());
		baseDao.insert(PubConstants.SUC_LAWYERINFO, entity);
		return RELOAD;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return RELOAD;
	}
	public void upd() throws Exception { 
		DBObject db = baseDao.getMessage(PubConstants.SUC_HOUSETYPE, _id); 
		String json = JSONObject.fromObject(db).toString();
		Struts2Utils.renderJson(json, new String[0]);
	}

	@Override
	protected void prepareModel() throws Exception {
		// TODO Auto-generated method stub
		if (_id != null) {
			//有custId查出来 用户信息
			entity = (LawyerInfo)UniObject.DBObjectToObject(baseDao.getMessage(PubConstants.SUC_LAWYERINFO,_id),LawyerInfo.class);
		} else {
			entity = new LawyerInfo();
		}
	}
	/**
	 * 获取全部信息 
	 * @return
	 */
	public String web(){
		return "web"; 
	}
	/**
	 * ajax获取全部数据
	 */
	public void  ajaxweb(){
		getLscode();
		HashMap<String, Object>whereMap=new HashMap<>();
		HashMap<String, Object>sortMap=new HashMap<>();
		Map<String, Object> sub_map = new HashMap<String, Object>();
		whereMap.put("custid", custid);
		sortMap.put("createdate",-1);
		if (StringUtils.isNotEmpty(Struts2Utils.getParameter("fypage"))) {
			fypage=Integer.parseInt(Struts2Utils.getParameter("fypage"));
		}
		List<DBObject>list=baseDao.getList(PubConstants.SUC_LAWYERINFO, whereMap,fypage,10,sortMap);
		if (list.size()>0) {
			sub_map.put("state", 0);
			sub_map.put("list", list);
		}
		String json = JSONArray.fromObject(sub_map).toString(); 
		Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
	}
	/**
	 * 获取个人信息
	 * @return
	 */
	public String detail(){
		String id=Struts2Utils.getParameter("id");
		if (StringUtils.isNotEmpty(id)) {
			DBObject dbObject=baseDao.getMessage(PubConstants.SUC_LAWYERINFO,Long.parseLong(id));
			Struts2Utils.getRequest().setAttribute("entity", dbObject);
		}
		return "detail"; 
	}
	/**
	 * ajax获取个人服务数据
	 */
	public void  ajaxbus(){
		getLscode();
		String id=Struts2Utils.getParameter("id");
		if(StringUtils.isNotEmpty(id)){
			HashMap<String, Object>whereMap=new HashMap<>();
			HashMap<String, Object>sortMap=new HashMap<>();
			Map<String, Object> sub_map = new HashMap<String, Object>();
			whereMap.put("custid", custid);
			whereMap.put("lid", Long.parseLong(id));
			sortMap.put("sort",-1); 
			List<DBObject>list=baseDao.getList(PubConstants.SUC_LAWYERBUS, whereMap,sortMap);
			if (list.size()>0) {
				sub_map.put("state", 0);
				sub_map.put("list", list);
			}
			String json = JSONArray.fromObject(sub_map).toString(); 
			Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
		}
		
	}
	/**
	 * ajax获取个人商城数据
	 */
	public void  ajaxgod(){
		getLscode();
		String id=Struts2Utils.getParameter("id");
		if(StringUtils.isNotEmpty(id)){
			HashMap<String, Object>whereMap=new HashMap<>();
			HashMap<String, Object>sortMap=new HashMap<>();
			Map<String, Object> sub_map = new HashMap<String, Object>();
			whereMap.put("custid", custid);
			whereMap.put("lid", Long.parseLong(id));
			sortMap.put("createdate",-1);
			if (StringUtils.isNotEmpty(Struts2Utils.getParameter("fypage"))) {
				fypage=Integer.parseInt(Struts2Utils.getParameter("fypage"));
			}
			List<DBObject>list=baseDao.getList(PubConstants.SUC_LAWYERGOD, whereMap,fypage,10,sortMap);
			if (list.size()>0) {
				sub_map.put("state", 0);
				sub_map.put("list", list);
			}
			String json = JSONArray.fromObject(sub_map).toString(); 
			Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
		}
		
	}

}
