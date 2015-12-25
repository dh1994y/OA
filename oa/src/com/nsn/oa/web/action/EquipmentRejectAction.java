package com.nsn.oa.web.action;

import com.nsn.oa.domain.EquipmentReject;
import com.nsn.oa.service.EquipmentRejectService;
import com.nsn.oa.service.EquipmentService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EquipmentRejectAction extends ActionSupport implements ModelDriven<EquipmentReject>{

	private EquipmentReject equipmentReject = new EquipmentReject();
	private EquipmentRejectService equipmentRejectService;
	private EquipmentService equipmentService;
	private String equipId; //辅助字段 用于获取设备相关信息
	
	public String add(){
		
		return "add";
	}
	
	public String save(){
		//置设备状态报废
		
		//添加辅助字段
		return "saveSucc";
	}
	
	public String detail(){
		return "detail";
	}
	
	public String home(){
		return "home";
	}
	
	@Override
	public EquipmentReject getModel() {
		return this.equipmentReject;
	}

	public EquipmentRejectService getEquipmentRejectService() {
		return equipmentRejectService;
	}

	public void setEquipmentRejectService(EquipmentRejectService equipmentRejectService) {
		this.equipmentRejectService = equipmentRejectService;
	}

	public EquipmentService getEquipmentService() {
		return equipmentService;
	}

	public void setEquipmentService(EquipmentService equipmentService) {
		this.equipmentService = equipmentService;
	}

	public String getEquipId() {
		return equipId;
	}

	public void setEquipId(String equipId) {
		this.equipId = equipId;
	}
	
}
