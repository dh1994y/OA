package com.nsn.oa.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;


import com.nsn.oa.dao.utils.Conditions;

/**
 * 顶层接口
 * 声明通用方法
 * @author Administrator
 *
 */
public interface IBaseDao<T> {
	
	/**
	 * 通用添加/更新方法
	 * @param bean
	 */
	public void addOrUpdate(T bean);
	/**
	 * 通用添加/更新一组数据
	 * @param beans
	 */
	public void addOrUpdateAll(Collection<T> beans);
	/**
	 * 通用删除
	 * @param bean
	 */
	public void delete(T bean);
	/**
	 * 通用删除一组
	 * @param beans
	 */
	public void deleteAll(Collection<T> beans);
	/**
	 * 通用删除通过id
	 * @param id
	 */
	public void deleteById(Serializable id);
	/**
	 * 通用删除一组通过一组id
	 * @param ids
	 */
	public void deleteByIds(Serializable... ids);
	
	/**
	 * 通用查询方法：通过id查询
	 * @param id
	 * @return
	 */
	public T findById(Serializable id);
	
	/**
	 * 通用查询方法：通过查询条件查询
	 * @param conditions
	 * @return
	 */
	public List<T> findByConditions(Conditions conditions);
	
	/**
	 * 将指定对象从session中移除
	 * @param bean
	 */
	public void removeFromSession(T bean);
}
