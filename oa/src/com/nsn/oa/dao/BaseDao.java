package com.nsn.oa.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;


import com.nsn.oa.dao.utils.Conditions;

/**
 * ����ӿ�
 * ����ͨ�÷���
 * @author Administrator
 *
 */
public interface BaseDao<T> {
	
	/**
	 * ͨ�����/���·���
	 * @param bean
	 */
	public void addOrUpdate(T bean);
	/**
	 * ͨ�����/����һ������
	 * @param beans
	 */
	public void addOrUpdateAll(Collection<T> beans);
	/**
	 * ͨ��ɾ��
	 * @param bean
	 */
	public void delete(T bean);
	/**
	 * ͨ��ɾ��һ��
	 * @param beans
	 */
	public void deleteAll(Collection<T> beans);
	/**
	 * ͨ��ɾ��ͨ��id
	 * @param id
	 */
	public void deleteById(Serializable id);
	/**
	 * ͨ��ɾ��һ��ͨ��һ��id
	 * @param ids
	 */
	public void deleteByIds(Serializable... ids);
	
	/**
	 * ͨ�ò�ѯ������ͨ��id��ѯ
	 * @param id
	 * @return
	 */
	public T findById(Serializable id);
	
	/**
	 * ͨ�ò�ѯ������ͨ����ѯ������ѯ
	 * @param conditions
	 * @return
	 */
	public List<T> findByConditions(Conditions conditions);
}
