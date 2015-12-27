package com.nsn.oa.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 用户类
 * @author Administrator
 *
 */
public class User {
	private String id; //用户id
	private String account;//用户帐号
	private String password;//用户密码
	private String username;//用户姓名
	private String gender;//用户性别
	private Date birthday;//用户出生年月
	private String telephone;//用户电话
	private String mobilePhone;//用户手机
	private String email;//用户邮件
	private String address;//用户地址
	private String isDuty;//是否在职
	private String units;//所属单位
	private Date onDutyDate;//入职时间
	private Date offDutyDate;//离职时间
	private String comment;//备注
	private String createUser;//创建人  数据库中存储id
	private Date createDate;//创建日期
	private String lastModifyUser;//最后修改人 数据库中存储id
	private Date lastModifyDate;//最后修改日期
	private boolean isDelete;//是否已删除
	
	private Set<Role> roleSet = new HashSet<>();//用户角色列表
	
	private String createUserName;//创建用户名 不存数据库
	private String lastModifyUserName;//最后修改用户名 不存数据库
	
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public String getLastModifyUserName() {
		return lastModifyUserName;
	}
	public void setLastModifyUserName(String lastModifyUserName) {
		this.lastModifyUserName = lastModifyUserName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIsDuty() {
		return isDuty;
	}
	public void setIsDuty(String isDuty) {
		this.isDuty = isDuty;
	}
	public String getUnits() {
		return units;
	}
	public void setUnits(String units) {
		this.units = units;
	}
	public Date getOnDutyDate() {
		return onDutyDate;
	}
	public void setOnDutyDate(Date onDutyDate) {
		this.onDutyDate = onDutyDate;
	}
	public Date getOffDutyDate() {
		return offDutyDate;
	}
	public void setOffDutyDate(Date offDutyDate) {
		this.offDutyDate = offDutyDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getLastModifyUser() {
		return lastModifyUser;
	}
	public void setLastModifyUser(String lastModifyUser) {
		this.lastModifyUser = lastModifyUser;
	}
	public Date getLastModifyDate() {
		return lastModifyDate;
	}
	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}
	public boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	public Set<Role> getRoleSet() {
		return roleSet;
	}
	public void setRoleSet(Set<Role> roleSet) {
		this.roleSet = roleSet;
	}
	
	
}
