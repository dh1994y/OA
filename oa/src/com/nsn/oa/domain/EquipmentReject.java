package com.nsn.oa.domain;

import java.util.Date;
/**
 * 设备报废记录
 * @author Administrator
 *
 */
public class EquipmentReject {
	private String id;//id
	private String equipId;//设备id
	private String rejectUser;//报废人id
	private Date rejectDate;//报废日期
	private String comment;//备注
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEquipId() {
		return equipId;
	}
	public void setEquipId(String equipId) {
		this.equipId = equipId;
	}
	public String getRejectUser() {
		return rejectUser;
	}
	public void setRejectUser(String rejectUser) {
		this.rejectUser = rejectUser;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getRejectDate() {
		return rejectDate;
	}
	public void setRejectDate(Date rejectDate) {
		this.rejectDate = rejectDate;
	}
}
