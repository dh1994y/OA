package com.nsn.oa.web.action;

import com.nsn.oa.domain.EquipmentMaintenance;
import com.nsn.oa.service.EquipmentMaintenanceService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EquipmentMaintenanceAction extends ActionSupport implements ModelDriven<EquipmentMaintenance>{

	private EquipmentMaintenance equipmentMaintenance = new EquipmentMaintenance();
	private EquipmentMaintenanceService equipmentMaintenanceService;
	
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
	public EquipmentMaintenance getModel() {
		return this.equipmentMaintenance;
	}

	public EquipmentMaintenanceService getEquipmentMaintenanceService() {
		return equipmentMaintenanceService;
	}

	public void setEquipmentMaintenanceService(EquipmentMaintenanceService equipmentMaintenanceService) {
		this.equipmentMaintenanceService = equipmentMaintenanceService;
	}
	
}