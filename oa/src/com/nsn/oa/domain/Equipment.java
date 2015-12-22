package com.nsn.oa.domain;

import java.util.Date;


/**
 * 设备实体类
 * 
 * @author Administrator
 *
 */
public class Equipment {
	private String id;// id
	private String equipName;// 设备名称
	private String department;// 所属单位
	private String equipType;// 设备类型
	private String equipSpec;// 设备规格
	private String equipVender;// 设备厂家
	private String equipStatus;// 设备状态：正常/故障/报废
	private String comment;// 备注
	private String createUser;// 创建者id
	private Date createDate;// 创建日期
	private String lastModifyUser;// 最后修改人id
	private Date lastModifyDate;// 最后修改日期
	private boolean isDelete;// 是否被删除
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEquipName() {
		return equipName;
	}
	public void setEquipName(String equipName) {
		this.equipName = equipName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getEquipType() {
		return equipType;
	}
	public void setEquipType(String equipType) {
		this.equipType = equipType;
	}
	public String getEquipSpec() {
		return equipSpec;
	}
	public void setEquipSpec(String equipSpec) {
		this.equipSpec = equipSpec;
	}
	public String getEquipVender() {
		return equipVender;
	}
	public void setEquipVender(String equipVender) {
		this.equipVender = equipVender;
	}
	public String getEquipStatus() {
		return equipStatus;
	}
	public void setEquipStatus(String equipStatus) {
		this.equipStatus = equipStatus;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getLastModifyUser() {
		return lastModifyUser;
	}
	public void setLastModifyUser(String lastModifyUser) {
		this.lastModifyUser = lastModifyUser;
	}
	public Date getLastModifyDate() {
		return lastModifyDate;
	}
	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}
	public boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}
}
