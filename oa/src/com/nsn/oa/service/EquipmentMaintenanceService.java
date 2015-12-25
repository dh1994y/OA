package com.nsn.oa.service;

import com.nsn.oa.dao.IEquipmentMaintenanceDao;
import com.nsn.oa.domain.EquipmentMaintenance;

public class EquipmentMaintenanceService {
	private IEquipmentMaintenanceDao equipmentMaintenanceDao;

	public IEquipmentMaintenanceDao getEquipmentMaintenanceDao() {
		return equipmentMaintenanceDao;
	}

	public void setEquipmentMaintenanceDao(IEquipmentMaintenanceDao equipmentMaintenanceDao) {
		this.equipmentMaintenanceDao = equipmentMaintenanceDao;
	}

	public void add(EquipmentMaintenance equipmentMaintenance) {
		equipmentMaintenanceDao.addOrUpdate(equipmentMaintenance);
	}

	
}
