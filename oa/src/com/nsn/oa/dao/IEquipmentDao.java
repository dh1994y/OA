package com.nsn.oa.dao;

import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.domain.Equipment;

public interface IEquipmentDao extends IBaseDao<Equipment> {

	int getMaxNum(Conditions conditions);

}
