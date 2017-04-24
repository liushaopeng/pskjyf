package com.lsp.suc.entity;

import java.util.Date;

import com.mongodb.ReflectionDBObject;

/**
 * 
 * @author lsp
 *
 */
public class LawyerOrder extends ReflectionDBObject{

	 private String custid;
	 private String fromUserid;
	 private Long lid;
	 private Long oid;
	 private String title;
	 private String summary;
	 private String content;
	 private Date createdate;
	 private Double price;
	 private int  state;
	 public String getCustid() {
		return custid;
	 }
	 public void setCustid(String custid) {
		this.custid = custid;
	 }
	 public String getFromUserid() {
		return fromUserid;
	 }
	 public void setFromUserid(String fromUserid) {
		this.fromUserid = fromUserid;
	 }
	 public Long getLid() {
		return lid;
	 }
	 public void setLid(Long lid) {
		this.lid = lid;
	 }
	 public Long getOid() {
		return oid;
	 }
	 public void setOid(Long oid) {
		this.oid = oid;
	 }
	 public String getTitle() {
		return title;
	 }
	 public void setTitle(String title) {
		this.title = title;
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
	 public Double getPrice() {
		return price;
	 }
	 public void setPrice(Double price) {
		this.price = price;
	 }
	 public int getState() {
		return state;
	 }
	 public void setState(int state) {
		this.state = state;
	 }
	 
}
