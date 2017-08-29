package com.lsp.parttime.entity;

import com.mongodb.ReflectionDBObject;
/**
 * 任务
 * @author lsp
 *
 */
public class Mission extends ReflectionDBObject{

	private String title;
	private String custid;
	private Long comid;
	/**
	 * 薪资
	 */
	private double wages;
	/**
	 * 工作地点
	 */
	private String workaddress;
	/**
	 * 招聘人数
	 */
	private int num;
	/**
	 * 学历要求
	 */
	private int education;
	/**
	 * 经验要求
	 */
	private int experience;
	/**
	 * 负责人姓名
	 */
	private String linkname;
	/**
	 * 负责人电话
	 */
	private String linktel;
	private int sort;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public double getWages() {
		return wages;
	}
	public void setWages(double wages) {
		this.wages = wages;
	}
	public String getWorkaddress() {
		return workaddress;
	}
	public void setWorkaddress(String workaddress) {
		this.workaddress = workaddress;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getEducation() {
		return education;
	}
	public void setEducation(int education) {
		this.education = education;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public String getLinkname() {
		return linkname;
	}
	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}
	public String getLinktel() {
		return linktel;
	}
	public void setLinktel(String linktel) {
		this.linktel = linktel;
	}
	public Long getComid() {
		return comid;
	}
	public void setComid(Long comid) {
		this.comid = comid;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	
	
}
