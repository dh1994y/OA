package com.nsn.oa.service;

import com.nsn.oa.dao.IEquipmentRejectDao;

public class EquipmentRejectService {
	private IEquipmentRejectDao equipmentRejectDao;

	public IEquipmentRejectDao getEquipmentRejectDao() {
		return equipmentRejectDao;
	}

	public void setEquipmentRejectDao(IEquipmentRejectDao equipmentRejectDao) {
		this.equipmentRejectDao = equipmentRejectDao;
	}
}
