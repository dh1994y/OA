package com.nsn.oa.web.action;

import org.apache.struts2.ServletActionContext;

import com.nsn.oa.domain.Matter;
import com.nsn.oa.domain.User;
import com.nsn.oa.service.MatterService;
import com.opensymphony.xwork2.ActionContext;
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
	
	public String home(){
		storeMatterInRequest();
		return "home";
	}
	
	public String edit(){
		storeMatterInRequest();
		return "edit";
	}
	/**
	 * 更新待办事宜 并跳转显示
	 * @return
	 */
	public String update(){
		//获取当前登录用户id
		User user = (User) ActionContext.getContext().getSession().get("user");
		matter.setCreateUser(user.getId());
		matterService.updateMatter(matter);
		return "update";
	}
	
	/**
	 * 获取当前用户的matter并存入request域
	 */
	public void storeMatterInRequest(){
		//创建一个matter对象
		Matter matter = new Matter();
		User user = (User) ActionContext.getContext().getSession().get("user");
		matter.setCreateUser(user.getId());
		//獲取matter對象 存入request域
		matter = matterService.getMatter(matter);
		ServletActionContext.getRequest().setAttribute("matter", matter);
	}
	
	
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
