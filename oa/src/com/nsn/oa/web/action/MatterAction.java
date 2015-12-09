package com.nsn.oa.web.action;

import com.nsn.oa.domain.Matter;
import com.nsn.oa.service.MatterService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 代办事宜控制类
 * @author Administrator
 *
 */
public class MatterAction extends ActionSupport implements ModelDriven<Matter>{
	
	private Matter matter = new Matter();
	private MatterService matterService;

	public MatterService getMatterService() {
		return matterService;
	}

	public void setMatterService(MatterService matterService) {
		this.matterService = matterService;
	}

	@Override
	public Matter getModel() {
		return this.matter;
	}
	
}
