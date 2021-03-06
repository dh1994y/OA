package com.nsn.oa.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;


import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.utils.DataTablesPage;


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
	public void removeFromSession(Collection<T> beans);
	/**
	 * 唯一性检查
	 * @param obj
	 * @param column
	 * @return
	 */
	public boolean checkUnique(Conditions conditions);
	
	/**
	 * 分页查询逻辑 
	 * @param page 分页对象 内部封装获取的数据，查询后将数据封装进data
	 * @param conditions 查询条件
	 */
	public void page(DataTablesPage<T> page, Conditions conditions);
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<T> findAll();
}
