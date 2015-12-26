package com.nsn.oa.service;

import com.nsn.oa.dao.IEquipmentRejectDao;
import com.nsn.oa.domain.EquipmentReject;

public class EquipmentRejectService {
	private IEquipmentRejectDao equipmentRejectDao;

	public IEquipmentRejectDao getEquipmentRejectDao() {
		return equipmentRejectDao;
	}

	public void setEquipmentRejectDao(IEquipmentRejectDao equipmentRejectDao) {
		this.equipmentRejectDao = equipmentRejectDao;
	}

	public EquipmentReject findById(String id) {
		return equipmentRejectDao.findById(id);
	}

	public void add(EquipmentReject equipmentReject) {
		equipmentRejectDao.addOrUpdate(equipmentReject);
	}
}
