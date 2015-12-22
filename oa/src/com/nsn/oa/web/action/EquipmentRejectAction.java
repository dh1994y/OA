package com.nsn.oa.web.action;

import com.nsn.oa.domain.EquipmentReject;
import com.nsn.oa.service.EquipmentRejectService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EquipmentRejectAction extends ActionSupport implements ModelDriven<EquipmentReject>{

	private EquipmentReject equipmentReject = new EquipmentReject();
	private EquipmentRejectService equipmentRejectService;
	
	
	public String add(){
		return "add";
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
	
}
