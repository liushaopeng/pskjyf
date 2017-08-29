package com.lsp.parttime.entity;

import java.util.Date;

import com.mongodb.ReflectionDBObject;
/**
 * 资产记录
 * @author lsp
 *
 */
public class AssetsRecord extends ReflectionDBObject{

	private String custid;
	private String formid;
	private double value;
	/**
	 * 状态0为增加1为减少
	 */
	private int state;
	/**
	 * 更新时间
	 */
	private Date createdate;
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getFormid() {
		return formid;
	}
	public void setFormid(String formid) {
		this.formid = formid;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	 
	
}
