package com.nsn.oa.service;

import java.util.Date;
import java.util.List;

import com.nsn.oa.dao.IMatterDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.Operator;
import com.nsn.oa.domain.Matter;

/**
 * 代办事宜业务逻辑
 * 
 * @author Administrator
 *
 */
public class MatterService {

	private IMatterDao matterDao;

	public IMatterDao getMatterDao() {
		return matterDao;
	}

	public void setMatterDao(IMatterDao matterDao) {
		this.matterDao = matterDao;
	}

	public void updateMatter(Matter matter) {
		// 获取当前登录用户id
		String userId = matter.getCreateUser();
		// 检索出当前用户对应的matter记录
		Conditions conditions = new Conditions();
		conditions.addCondition("createUser", userId, Operator.EQUALS);
		List<Matter> matterList = matterDao.findByConditions(conditions);
		// 若为空创建，否则修改
		if (matterList != null && matterList.size() > 0) {
			//修改
			matter.setId(matterList.get(0).getId());
			matter.setLastUpdateDate(new Date());
			matterDao.removeFromSession(matterList.get(0));
//			matterList.get(0).setFeel(matter.getFeel());
//			matterList.get(0).setMatter(matter.getFeel());
//			matterList.get(0).setLastUpdateDate(new Date());
//			matter = matterList.get(0);
		}else{
			//創建
			matter.setCreateDate(new Date());
			//matter.setLastUpdateDate(new Date());
		}
		matterDao.addOrUpdate(matter);
	}

	public Matter getMatter(Matter matter) {
		// 获取当前登录用户id
		String userId = matter.getCreateUser();
		// 检索出当前用户对应的matter记录
		Conditions conditions = new Conditions();
		conditions.addCondition("createUser", userId, Operator.EQUALS);
		List<Matter> matterList = matterDao.findByConditions(conditions);
		if(matterList != null && matterList.size() > 0){
			return matterList.get(0);
		}
		return null;
	}
}
