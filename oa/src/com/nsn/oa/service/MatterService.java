package com.nsn.oa.service;

import com.nsn.oa.dao.IMatterDao;

/**
 * 代办事宜业务逻辑
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
}
