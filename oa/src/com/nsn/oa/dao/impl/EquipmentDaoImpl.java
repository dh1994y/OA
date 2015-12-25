package com.nsn.oa.dao.impl;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.nsn.oa.dao.IEquipmentDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.WhereAndValues;
import com.nsn.oa.domain.Equipment;

public class EquipmentDaoImpl extends BaseDaoImpl<Equipment> implements IEquipmentDao{

	@Override
	public int getMaxNum(Conditions conditions) {
		WhereAndValues wv = conditions.createWhereAndValues();
		Object[] values = wv.getValues();
		String hql = "select max(equipNum) from "+ getBeanClass().getName() + wv.getWhere();
		int maxNum = getTemplate().execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if(values!=null&&values.length>0){
					for(int i=0;i<values.length;i++){
						query.setParameter(i, values[i]);
					}
				}
				return (Integer) query.uniqueResult();
			}
		});
		return maxNum;
	}

}
