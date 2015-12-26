package com.nsn.oa.web.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.domain.Equipment;
import com.nsn.oa.domain.EquipmentMaintenance;
import com.nsn.oa.domain.User;
import com.nsn.oa.service.EquipmentMaintenanceService;
import com.nsn.oa.service.EquipmentService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EquipmentMaintenanceAction extends ActionSupport implements ModelDriven<EquipmentMaintenance>{

	private EquipmentMaintenance equipmentMaintenance = new EquipmentMaintenance();
	private EquipmentMaintenanceService equipmentMaintenanceService;
	private EquipmentService equipmentService;
	
	public String add(){
		//取出设备存入值栈
		Equipment equip = equipmentService.findEquipById(equipmentMaintenance.getEquipId());
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(equip);
		return "add";
	}
	
	public String save(){
		//置设备状态正常
		String equipId = equipmentMaintenance.getEquipId();
		Equipment equip = equipmentService.findEquipById(equipId);
		equip.setEquipStatus("正常");
		equipmentService.update(equip);
		//存储其他字段  用户id 设备id 时间
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		equipmentMaintenance.setEquipId(equipId);
		equipmentMaintenance.setMaintenanceUser(currentUser.getId());
		equipmentMaintenance.setMaintenanceDate(new Date());
		equipmentMaintenanceService.add(equipmentMaintenance);
		return "saveSucc";
	}
	
	public String detail(){
		//取出设备存入值栈
		EquipmentMaintenance equipMaintenance = equipmentMaintenanceService.findById(equipmentMaintenance.getId());
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(equipMaintenance);
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

	public EquipmentService getEquipmentService() {
		return equipmentService;
	}

	public void setEquipmentService(EquipmentService equipmentService) {
		this.equipmentService = equipmentService;
	}
	
}
