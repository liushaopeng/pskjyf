package com.lsp.suc.entity;
 
import com.mongodb.ReflectionDBObject;

/**
 * 
 * @author lsp
 *
 */
public class LawyerBusiness extends ReflectionDBObject{

	 private String custid;
	 private String title;
	 private Long lid;
	 private String picurl;
	 private String ioc;
	 private Double price;
	 private int sort;
	 private String url;
	 public String getCustid() {
		return custid;
	 }
	 public void setCustid(String custid) {
		this.custid = custid;
	 }
	 public String getTitle() {
		return title;
	 }
	 public void setTitle(String title) {
		this.title = title;
	 }
	 public String getPicurl() {
		return picurl;
	 }
	 public void setPicurl(String picurl) {
		this.picurl = picurl;
	 }
	 public int getSort() {
		return sort;
	 }
	 public void setSort(int sort) {
	 	this.sort = sort;
	 }
	 public String getUrl() {
		return url;
	 }
	 public void setUrl(String url) {
		this.url = url;
	 }
	 public Long getLid() {
		return lid;
	 }
	 public void setLid(Long lid) {
		this.lid = lid;
	 }
	 public String getIoc() {
		return ioc;
	 }
	 public void setIoc(String ioc) {
	 	this.ioc = ioc;
	 }
	 public Double getPrice() {
		return price;
	 }
	 public void setPrice(Double price) {
		this.price = price;
	 }
	 
}
