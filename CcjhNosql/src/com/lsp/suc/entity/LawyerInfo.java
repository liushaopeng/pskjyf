package com.lsp.suc.entity;

import java.util.Date;

import com.mongodb.ReflectionDBObject;

/**
 * 
 * @author lsp
 *
 */
public class LawyerInfo extends ReflectionDBObject{

	private String custid;
	private String name;
	private String picurl; 
	private String summary;
	private String content;
	private Date  createdate;
	private String tel;
	private String address;
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
