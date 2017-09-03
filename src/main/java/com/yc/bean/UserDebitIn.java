package com.yc.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.mysql.fabric.xmlrpc.base.Array;

public class UserDebitIn extends CommonBean implements Serializable {

	private static final long serialVersionUID = 7977228914132597585L;

	private Integer udi_id;
	private String udi_title;
	private Integer u_id;
	private Double udi_money; // 计划借的钱数
	private Integer udi_status;   //      0  未审核状态   1  审核完成 凑款状态   2 筹款完成待放款状态   3 还款状态(借了未还)   4  完成还款 （失败 ）   
	private long udi_date;
	private long udi_publishdate;
	private long udi_refundrealitydate;
	private String udi_use;
	private Integer udi_refundway; // 还贷方式
	private Integer udi_type;
	private Integer udi_weight; // 权重

	private Integer peopleCount;// 加入的人数
	private Double totalMoney; // 放贷的钱数
	private Double makeMoney; // 累积利息收益
	private Integer udi_checkstatus; // 审核用户信息 判断用户信息真实性 默认为0 审核通过修改为1 在前台显示

	private List<UserDebitInType> list = new ArrayList<>();
	// 用于关注用户投标
	// 用于关注用户投标 查找借贷用户的信息
	private UserDebitInType userDebitInType;
	// 用于后台放贷表的显示
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getUdi_type() {
		return udi_type;
	}

	public void setUdi_type(Integer udi_type) {
		this.udi_type = udi_type;
	}

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public Double getMakeMoney() {
		return makeMoney;
	}

	public void setMakeMoney(Double makeMoney) {
		this.makeMoney = makeMoney;
	}

	public Integer getPeopleCount() {
		return peopleCount;
	}

	public void setPeopleCount(Integer peopleCount) {
		this.peopleCount = peopleCount;
	}

	public UserDebitInType getUserDebitInType() {
		return userDebitInType;
	}

	public void setUserDebitInType(UserDebitInType userDebitInType) {
		this.userDebitInType = userDebitInType;
	}

	public List<UserDebitInType> getList() {
		return list;
	}

	public void setList(List<UserDebitInType> list) {
		this.list = list;
	}

	public long getUdi_date() {
		return udi_date;
	}

	public long getUdi_refundrealitydate() {
		return udi_refundrealitydate;
	}

	public Integer getUdi_weight() {
		return udi_weight;
	}

	public void setUdi_weight(Integer udi_weight) {
		this.udi_weight = udi_weight;
	}

	public Integer getUdi_id() {
		return udi_id;
	}

	public void setUdi_id(Integer udi_id) {
		this.udi_id = udi_id;
	}

	public String getUdi_title() {
		return udi_title;
	}

	public void setUdi_title(String udi_title) {
		this.udi_title = udi_title;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public Double getUdi_money() {
		return udi_money;
	}

	public void setUdi_money(Double udi_money) {
		this.udi_money = udi_money;
	}

	public Integer getUdi_status() {
		return udi_status;
	}

	public void setUdi_status(Integer udi_status) {
		this.udi_status = udi_status;
	}

	public long getUdi_publishdate() {
		return udi_publishdate;
	}

	public void setUdi_publishdate(long udi_publishdate) {
		this.udi_publishdate = udi_publishdate;
	}

	public void setUdi_date(long udi_date) {
		this.udi_date = udi_date;
	}

	public void setUdi_refundrealitydate(long udi_refundrealitydate) {
		this.udi_refundrealitydate = udi_refundrealitydate;
	}

	public String getUdi_use() {
		return udi_use;
	}

	public void setUdi_use(String udi_use) {
		this.udi_use = udi_use;
	}

	public Integer getUdi_refundway() {
		return udi_refundway;
	}

	public void setUdi_refundway(Integer udi_refundway) {
		this.udi_refundway = udi_refundway;
	}

	public Integer getUdi_checkstatus() {
		return udi_checkstatus;
	}

	public void setUdi_checkstatus(Integer udi_checkstatus) {
		this.udi_checkstatus = udi_checkstatus;
	}

	@Override
	public String toString() {
		return "UserDebitIn [udi_id=" + udi_id + ", udi_title=" + udi_title + ", u_id=" + u_id + ", udi_money="
				+ udi_money + ", udi_status=" + udi_status + ", udi_date=" + udi_date + ", udi_publishdate="
				+ udi_publishdate + ", udi_refundrealitydate=" + udi_refundrealitydate + ", udi_use=" + udi_use
				+ ", udi_refundway=" + udi_refundway + ", udi_type=" + udi_type + ", udi_weight=" + udi_weight
				+ ", peopleCount=" + peopleCount + ", totalMoney=" + totalMoney + ", makeMoney=" + makeMoney
				+ ", udi_checkstatus=" + udi_checkstatus + ", list=" + list + ", userDebitInType=" + userDebitInType
				+ ", user=" + user + "]";
	}


}
