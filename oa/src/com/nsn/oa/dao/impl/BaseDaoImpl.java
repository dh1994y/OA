package com.nsn.oa.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.nsn.oa.dao.IBaseDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.WhereAndValues;
import com.nsn.oa.utils.DataTablesPage;

/**
 * BaseDao的实现类 提供基础方法
 * 
 * @author Administrator
 * 
 * @param <T>
 */
public class BaseDaoImpl<T> implements IBaseDao<T> {

	public Class<T> getBeanClass() {
		return beanClass;
	}

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

	public void removeFromSession(Collection<T> beans){
		for (T bean : beans) {
			template.evict(bean);
		}
	}
	
	//======================唯一性检查============================
	@Override
	public boolean checkUnique(Conditions conditions) {
		List<T> list = findByConditions(conditions);
		if(list!=null&&list.size()>0){
			return false;
		}
		return true;
	}

	//=======================分页查询逻辑==========================
	@Override
	public void page(DataTablesPage<T> page, Conditions conditions) {
		//查询所需数据 
		WhereAndValues wv = conditions.createWhereAndValues();
	    final Object[] values = wv.getValues();
		final String hql = "from " + beanClass.getName() + wv.getWhere();
		System.out.println(hql);
		List<T> date = template.execute(new HibernateCallback<List<T>>() {

			@Override
			public List<T> doInHibernate(Session session) throws HibernateException, SQLException {
				//创建query对象
				Query query = session.createQuery(hql);
				if(values!=null&&values.length>0){
					for(int i=0;i<values.length;i++){
						query.setParameter(i, values[i]);
					}
				}
				query.setFirstResult(page.getIDisplayStart());
				query.setMaxResults(page.getIDisplayLength());
				return query.list();
			}
		});
		page.setData(date);
	
		//查询记录总数 
		final String totalHql = "select count(*) from " + beanClass.getName() + wv.getWhere(); 
		long totalCount = template.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(totalHql);
				if(values!=null&&values.length>0){
					for(int i=0;i<values.length;i++){
						query.setParameter(i, values[i]);
					}
				}
				return (Long) query.uniqueResult();
			}
		});
		page.setITotalRecords((int)totalCount);
		page.setITotalDisplayRecords(page.getITotalRecords());
	}

	//查询全部
	@Override
	public List<T> findAll() {
		String hql = " from " + beanClass.getName();
		return template.find(hql);
	}
	
}
