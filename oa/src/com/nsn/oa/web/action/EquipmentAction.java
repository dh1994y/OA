package com.nsn.oa.web.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Equipment;
import com.nsn.oa.domain.User;
import com.nsn.oa.service.EquipmentService;
import com.nsn.oa.service.UserService;
import com.nsn.oa.utils.DataTablesPage;
import com.nsn.oa.utils.JsonUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EquipmentAction extends ActionSupport implements ModelDriven<Equipment> {

	private Equipment equipment = new Equipment();
	private EquipmentService equipmentService;
	private UserService userService;
	private String sEcho;
	private int iDisplayStart;
	private int iDisplayLength;

	public String home() {
		return "home";
	}

	public String equipEdit() {
		Equipment detailEquip = equipmentService.findEquipById(equipment.getId());
		// 放入栈顶 方便取值
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(detailEquip);
		return "edit";
	}

	public String update() {
		// 服务端校验
		// 添加其他字段 修改日期 修改人
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		equipment.setLastModifyUser(currentUser.getId());
		equipment.setLastModifyDate(new Date());
		//回写未提交的数据
		Equipment updateEquip = equipmentService.findEquipById(equipment.getId());
		equipment.setCreateUser(updateEquip.getCreateUser());
		equipment.setCreateDate(updateEquip.getCreateDate());
		equipment.setEquipNum(updateEquip.getEquipNum());
		equipment.setIsDelete(false);
		//更新
		equipmentService.update(equipment);
		return "home";
	}

	public String equipAdd() {
		return "add";
	}

	public String save() {
		// 服务端校验
		// 添加其他字段 创建人 创建日期 未被删除
		User currentUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		equipment.setCreateUser(currentUser.getId());
		equipment.setCreateDate(new Date());
		equipment.setIsDelete(false);
		// 取出当前最大编号加1 设备名相同时当作同一类
		Conditions conditions = new Conditions();
		conditions.addCondition("equipName", equipment.getEquipName(), Operator.EQUALS);
		int equipNum = equipmentService.getMaxNum(conditions) + 1;
		equipment.setEquipNum(equipNum);
		equipmentService.save(equipment);
		return "home";
	}

	public void delete() {
		Equipment deleteEquip = equipmentService.findEquipById(equipment.getId());
		deleteEquip.setIsDelete(true);
		equipmentService.update(deleteEquip);
	}

	public String detail() {
		Equipment detailEquip = equipmentService.findEquipById(equipment.getId());
		// 检索创建人 最后修改人
		if (detailEquip.getCreateUser() != null) {
			User createUser = userService.findUserById(detailEquip.getCreateUser());
			detailEquip.setCreateUserName(createUser.getUsername());
		}
		if (detailEquip.getLastModifyUser() != null) {
			User lastModifyUser = userService.findUserById(detailEquip.getLastModifyUser());
			detailEquip.setLastModifyUserName(lastModifyUser.getUsername());
		}
		// 放入栈顶 方便取值
		ActionContext.getContext().getValueStack().pop();
		ActionContext.getContext().getValueStack().push(detailEquip);
		return "detail";
	}

	public void page() {
		// 创建分页对象
		DataTablesPage<Equipment> page = new DataTablesPage<>();
		// 设置相关参数
		page.setSEcho(getSEcho());
		page.setIDisplayStart(getIDisplayStart());
		page.setIDisplayLength(getIDisplayLength());
		// 封装查询条件
		Conditions conditions = new Conditions();
		// 查询未被删除的
		conditions.addCondition("isDelete", false, Operator.EQUALS);
		// 附加查询条件
		conditions.addCondition("equipName", equipment.getEquipName(), Operator.LIKE);
		conditions.addCondition("equipType", equipment.getEquipType(), Operator.EQUALS);
		conditions.addCondition("equipSpec", equipment.getEquipSpec(), Operator.EQUALS);
		conditions.addCondition("equipVender", equipment.getEquipVender(), Operator.EQUALS);
		conditions.addCondition("equipStatus", equipment.getEquipStatus(), Operator.EQUALS);
		conditions.addCondition("department", equipment.getDepartment(), Operator.EQUALS);
		// 执行查询逻辑
		equipmentService.page(page, conditions);
		// 发送到前台
		JsonUtils.writeJson(page, ServletActionContext.getResponse());
	}
	
	/**
	 * 检查设备状态  是否是报废状态
	 */
	public void checkStatus(){
		Equipment equip = equipmentService.findEquipById(equipment.getId());
		JsonUtils.writeJson(equip.getEquipStatus(), ServletActionContext.getResponse());
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

	public String getSEcho() {
		return sEcho;
	}

	public void setSEcho(String sEcho) {
		this.sEcho = sEcho;
	}

	public int getIDisplayStart() {
		return iDisplayStart;
	}

	public void setIDisplayStart(int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}

	public int getIDisplayLength() {
		return iDisplayLength;
	}

	public void setIDisplayLength(int iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
