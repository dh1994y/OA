package com.nsn.oa.web.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.domain.Equipment;
import com.nsn.oa.domain.EquipmentReject;
import com.nsn.oa.domain.User;
import com.nsn.oa.service.EquipmentRejectService;
import com.nsn.oa.service.EquipmentService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EquipmentRejectAction extends ActionSupport implements ModelDriven<EquipmentReject>{

	private EquipmentReject equipmentReject = new EquipmentReject();
	private EquipmentRejectService equipmentRejectService;
	private EquipmentService equipmentService;
	
	public String add(){
		//获取设备信息放入值栈
		Equipment equip = equipmentService.findEquipById(equipmentReject.getEquipId());
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(equip);
		return "add";
	}
	
	public String save(){
		//置设备状态报废
		String equipId = equipmentReject.getEquipId();
		Equipment equip = equipmentService.findEquipById(equipId);
		equip.setEquipStatus("报废");
		equipmentService.update(equip);
		//存储其他字段  用户id 设备id 时间
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		equipmentReject.setEquipId(equipId);
		equipmentReject.setRejectUser(currentUser.getId());
		equipmentReject.setRejectDate(new Date());
		equipmentRejectService.add(equipmentReject);
		return "saveSucc";
	}
	
	public String detail(){
		//获取报废记录放入值栈
		EquipmentReject equipReject = equipmentRejectService.findById(equipmentReject.getId());
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(equipReject);
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

}
