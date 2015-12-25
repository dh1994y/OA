package com.nsn.oa.service;

import com.nsn.oa.dao.IEquipmentDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.domain.Equipment;
import com.nsn.oa.utils.DataTablesPage;

public class EquipmentService {
	private IEquipmentDao equipmentDao;

	public IEquipmentDao getEquipmentDao() {
		return equipmentDao;
	}

	public void setEquipmentDao(IEquipmentDao equipmentDao) {
		this.equipmentDao = equipmentDao;
	}

	public void save(Equipment equipment) {
		//保存
		equipmentDao.addOrUpdate(equipment);
	}

	public void page(DataTablesPage<Equipment> page, Conditions conditions) {
		equipmentDao.page(page, conditions);
	}

	public int getMaxNum(Conditions conditions) {
		return equipmentDao.getMaxNum(conditions);
	}

	public Equipment findEquipById(String equipId) {
		return equipmentDao.findById(equipId);
	}

	public void update(Equipment equipment) {
		//更新
		equipmentDao.addOrUpdate(equipment);
	}
}
