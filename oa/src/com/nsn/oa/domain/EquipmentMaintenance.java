package com.nsn.oa.domain;
/**
 * 设备维护记录
 */
import java.util.Date;


public class EquipmentMaintenance {
	private String id;//id
	private String equipId;//设备id
	private String maintenanceUser;//维护人id
	private Date maintenanceDate;//维护日期
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

	public String getMaintenanceUser() {
		return maintenanceUser;
	}

	public void setMaintenanceUser(String maintenanceUser) {
		this.maintenanceUser = maintenanceUser;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getMaintenanceDate() {
		return maintenanceDate;
	}

	public void setMaintenanceDate(Date maintenanceDate) {
		this.maintenanceDate = maintenanceDate;
	}

}
