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

import com.lsp.hou.entity.HousewiferyFeatures;
import com.lsp.hou.web.HoufaetAction;
import com.lsp.parttime.entity.Employee;
import com.lsp.pub.dao.BaseDao;
import com.lsp.pub.db.MongoSequence;
import com.lsp.pub.entity.PubConstants;
import com.lsp.pub.util.SpringSecurityUtils;
import com.lsp.pub.util.Struts2Utils;
import com.lsp.pub.util.UniObject;
import com.lsp.pub.web.GeneralAction;
import com.mongodb.DBObject;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.swing.internal.plaf.basic.resources.basic;

import net.sf.json.JSONArray;
/**
 * 员工管理
 * 
 * @author lsp
 * 
 */
@Namespace("/parttime")
@Results({ @Result(name = HoufaetAction.RELOAD, location = "employee.action", params = {"fypage", "%{fypage}" }, type = "redirect") })
public class EmployeeAction extends GeneralAction<Employee>{

	private static final long serialVersionUID = -6784469775589971579L;
	@Autowired
	private BaseDao baseDao;
	private Employee entity = new Employee();
	private Long _id;
	public void set_id(Long _id) {
		this._id = _id;
	}

	private MongoSequence mongoSequence;

	@Override
	public String execute() throws Exception {
		custid=SpringSecurityUtils.getCurrentUser().getId();
		HashMap<String, Object>whereMap=new HashMap<>();
		HashMap<String, Object>sortMap=new HashMap<>();
		whereMap.put("custid", custid);
		if(StringUtils.isNotEmpty(Struts2Utils.getParameter("fypage"))) {
			fypage=Integer.parseInt(Struts2Utils.getParameter("fypage"));
		}
		List<DBObject>list=baseDao.getList(PubConstants.PARTTIME_EMPLOYEE, whereMap,fypage,10,sortMap);
		fycount=baseDao.getCount(PubConstants.PARTTIME_EMPLOYEE,whereMap);
		Struts2Utils.getRequest().setAttribute("list",list);
		Struts2Utils.getRequest().setAttribute("custid",custid);
		return SUCCESS; 
	}
	@Autowired
	public void setMongoSequence(MongoSequence mongoSequence) {
		this.mongoSequence = mongoSequence;
	}

	@Override
	public Employee getModel() {
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
	 * 生成emp
	 */
	public void createEmp() {
		getLscode();
		HashMap<String,Object>whereMap=new HashMap<>();
		whereMap.put("fromid",fromUserid);
		whereMap.put("custid",custid);
		DBObject dbObject=baseDao.getMessage(PubConstants.PARTTIME_EMPLOYEE, whereMap);
		if (dbObject==null) {
			Employee employee=new Employee();
			employee.set_id(fromUserid);
			employee.setCreatedate(new Date());
			employee.setCustid(custid);
			baseDao.insert(PubConstants.PARTTIME_EMPLOYEE, employee);
		}
		
	}
	/**
	 * 修改emp
	 */
	public void ajaxUpdEmp() { 
		getLocale();
		Map<String, Object>submap=new HashMap<String, Object>(); 
		submap.put("state", 1);
		String name=Struts2Utils.getParameter("name");
		String tel=Struts2Utils.getParameter("tel"); 
		String idcard=Struts2Utils.getParameter("idcard");
		String wxid=Struts2Utils.getParameter("wxid");
		String bytel=Struts2Utils.getParameter("bytel");
		DBObject dbObject=baseDao.getMessage(PubConstants.PARTTIME_EMPLOYEE, fromUserid);
		if (dbObject!=null) {
			Employee employee=(Employee) UniObject.DBObjectToObject(dbObject, Employee.class);
			employee.setBytel(bytel);
			employee.setName(name);
			employee.setIdcard(idcard);
			employee.setTel(tel);
			employee.setWxid(wxid);
			baseDao.insert(PubConstants.PARTTIME_EMPLOYEE, employee);
			submap.put("state", 0);
		}
		String json = JSONArray.fromObject(submap).toString(); 
		Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
		
	}
	/**
	 * 设置管理员
	 */
	public void ajaxSetAdmin() {  
		Map<String, Object>submap=new HashMap<String, Object>(); 
		submap.put("state", 1);
		String id=Struts2Utils.getParameter("id");
		if (id!=null) {
			DBObject dbObject=baseDao.getMessage(PubConstants.PARTTIME_EMPLOYEE, id);
			if (dbObject!=null) {
				Employee employee=(Employee) UniObject.DBObjectToObject(dbObject, Employee.class);
				employee.setType(1);
				baseDao.insert(PubConstants.PARTTIME_EMPLOYEE, employee);
				submap.put("state",0);
			}
		}
	 
		String json = JSONArray.fromObject(submap).toString(); 
		Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
		
	}
	/**
	 * 取消管理员
	 */
	public void ajaxCancelAdmin() {  
		Map<String, Object>submap=new HashMap<String, Object>(); 
		submap.put("state", 1);
		String id=Struts2Utils.getParameter("id");
		if (id!=null) {
			DBObject dbObject=baseDao.getMessage(PubConstants.PARTTIME_EMPLOYEE, id);
			if (dbObject!=null) {
				Employee employee=(Employee) UniObject.DBObjectToObject(dbObject, Employee.class);
				employee.setType(0);
				baseDao.insert(PubConstants.PARTTIME_EMPLOYEE, employee);
				submap.put("state",0);
			}
		}
	 
		String json = JSONArray.fromObject(submap).toString(); 
		Struts2Utils.renderJson(json.substring(1, json.length() - 1), new String[0]);
		
	}

}
