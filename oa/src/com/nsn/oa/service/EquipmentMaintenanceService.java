package com.nsn.oa.service;

import com.nsn.oa.dao.IEquipmentMaintenanceDao;

public class EquipmentMaintenanceService {
	private IEquipmentMaintenanceDao equipmentMaintenanceDao;

	public IEquipmentMaintenanceDao getEquipmentMaintenanceDao() {
		return equipmentMaintenanceDao;
	}

	public void setEquipmentMaintenanceDao(IEquipmentMaintenanceDao equipmentMaintenanceDao) {
		this.equipmentMaintenanceDao = equipmentMaintenanceDao;
	}

	
}
