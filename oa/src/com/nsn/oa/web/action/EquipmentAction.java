package com.nsn.oa.web.action;

import com.nsn.oa.domain.Equipment;
import com.nsn.oa.service.EquipmentService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EquipmentAction extends ActionSupport implements ModelDriven<Equipment>{

	private Equipment equipment = new Equipment();
	private EquipmentService equipmentService;
	
	public String home(){
		return "home";
	}
	
	public String edit(){
		return "edit";
	}
	
	public String update(){
		return "update";
	}
	
	public String add(){
		return "add";
	}
	
	public String save(){
		//服务端校验
		equipmentService.save(equipment);
		return "saveSucc";
	}
	
	public String delete(){
		return "delete";
	}
	
	public String detail(){
		return "detail";
	}
	@Override
	public Equipment getModel() {
		return this.equipment;
	}

	public EquipmentService getEquipmentService() {
		return equipmentService;
	}

	public void setEquipmentService(EquipmentService equipmentService) {
		this.equipmentService = equipmentService;
	}

}
