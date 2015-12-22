package com.nsn.oa.service;

import com.nsn.oa.dao.IEquipmentDao;
import com.nsn.oa.domain.Equipment;

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
}
