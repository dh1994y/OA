package com.nsn.oa.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.nsn.oa.dao.IBaseDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.WhereAndValues;

/**
 * BaseDao的实现类 提供基础方法
 * 
 * @author Administrator
 * 
 * @param <T>
 */
public class BaseDaoImpl<T> implements IBaseDao<T> {

	/**
	 * 持有操作hibernate的模板
	 */
	private HibernateTemplate template;

	private Class<T> beanClass;

	/**
	 * 代码块 创建实例时执行
	 */
	{
		// 获取参数化类型
		ParameterizedType paramType = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		Type[] argTypes = paramType.getActualTypeArguments();
		beanClass = (Class) argTypes[0];
	}

	public HibernateTemplate getTemplate() {
		return template;
	}

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	// ================添加/更新方法======================
	@Override
	public void addOrUpdate(T bean) {
		template.saveOrUpdate(bean);
	}

	@Override
	public void addOrUpdateAll(Collection<T> beans) {
		template.saveOrUpdateAll(beans);
	}

	// ================删除方法======================
	@Override
	public void delete(T bean) {
		// 注意此方法不能删除为空的元素
		// template提供的删除方法，若给定的bean未在session中，则会先根据给定的
		// bean id 查询数据库若有得到持久化对象，没有则为null
		// 因此deleteById 通过 id得到持久化bean，即可直接删除，不需再次查找
		template.delete(bean);
	}

	@Override
	public void deleteAll(Collection<T> beans) {
		// 注意此方法不能删除为空的元素
		template.deleteAll(beans);
	}

	@Override
	public void deleteById(Serializable id) {
		// 获取id对应bean
		T bean = findById(id);
		// 调用删除
		// 合法性校验
		if (bean != null) {
			delete(bean);
		}
	}

	@Override
	public void deleteByIds(Serializable... ids) {
		// 合法性校验
		if (ids != null) {
			for (Serializable id : ids) {
				deleteById(id);
			}
		}
	}

	// ================查询方法======================
	@Override
	public T findById(Serializable id) {
		return (T) template.get(beanClass, id);
	}

	@Override
	public List<T> findByConditions(Conditions conditions) {
		// WhereAndValues对象
		WhereAndValues whereAndValues = conditions.createWhereAndValues();
		String hql = "from " + beanClass.getName() + whereAndValues.getWhere()
				+ conditions.createOrderByString();
		Object[] values = whereAndValues.getValues();
//		System.out.println(hql);
//		System.out.println(Arrays.toString(values));
		return template.find(hql, values);
	}
	
	// ================将制定对象从session中移除======================
	public void removeFromSession(T bean){
		template.evict(bean);
	}
	
}
