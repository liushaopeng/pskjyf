package com.lsp.parttime.entity; 

import java.util.Date;

import com.mongodb.ReflectionDBObject;
/**
 * 订单
 * @author lsp
 *
 */
public class Order extends ReflectionDBObject{

	private String custid;
	private String fromid;
	private Date createdate;
	/**
	 * 公司ID
	 */
	private Long comid;
	/**
	 * 任务ID
	 */
	private Long mid;
	/**
	 * 状态0.已报名1.已拒绝2.进行中3.已完成4.已结算
	 */
	private int state;
	/**
	 * 金额
	 */
	private double amount;
	/**
	 * 集合时间
	 */
	private Date gatherdate;
	/**
	 * 上班开始时间
	 */
	private Date startdate;
	/**
	 * 上班结束时间
	 */
	private Date enddate;
	/**
	 * 预计工作时长expectworkinghours
	 */
	private int  expectwh;
	/**
	 * 实际工作时长
	 */
	private int  practicalwh;
	/**
	 * 上班地点
	 */
	private String workaddress;
	
	public Date getGatherdate() {
		return gatherdate;
	}
	public void setGatherdate(Date gatherdate) {
		this.gatherdate = gatherdate;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getFromid() {
		return fromid;
	}
	public void setFromid(String fromid) {
		this.fromid = fromid;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public Long getComid() {
		return comid;
	}
	public void setComid(Long comid) {
		this.comid = comid;
	}
	public Long getMid() {
		return mid;
	}
	public void setMid(Long mid) {
		this.mid = mid;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getExpectwh() {
		return expectwh;
	}
	public void setExpectwh(int expectwh) {
		this.expectwh = expectwh;
	}
	public int getPracticalwh() {
		return practicalwh;
	}
	public void setPracticalwh(int practicalwh) {
		this.practicalwh = practicalwh;
	}
	public String getWorkaddress() {
		return workaddress;
	}
	public void setWorkaddress(String workaddress) {
		this.workaddress = workaddress;
	}
	
}
