package com.nsn.oa.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.nsn.oa.dao.BaseDao;
import com.nsn.oa.dao.utils.Conditions;
import com.nsn.oa.dao.utils.Conditions.WhereAndValues;

/**
 * BaseDao��ʵ���� �ṩ��������
 * 
 * @author Administrator
 * 
 * @param <T>
 */
public class BaseDaoImpl<T> implements BaseDao<T> {

	/**
	 * ���в���hibernate��ģ��
	 */
	private HibernateTemplate template;

	private Class<T> beanClass;

	/**
	 * ����� ����ʵ��ʱִ��
	 */
	{
		// ��ȡ����������
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

	// ================���/���·���======================
	@Override
	public void addOrUpdate(T bean) {
		template.saveOrUpdate(bean);
	}

	@Override
	public void addOrUpdateAll(Collection<T> beans) {
		template.saveOrUpdateAll(beans);
	}

	// ================ɾ������======================
	@Override
	public void delete(T bean) {
		// ע��˷�������ɾ��Ϊ�յ�Ԫ��
		// template�ṩ��ɾ����������������beanδ��session�У�����ȸ��ݸ�����
		// bean id ��ѯ���ݿ����еõ��־û�����û����Ϊnull
		// ���deleteById ͨ�� id�õ��־û�bean������ֱ��ɾ���������ٴβ���
		template.delete(bean);
	}

	@Override
	public void deleteAll(Collection<T> beans) {
		// ע��˷�������ɾ��Ϊ�յ�Ԫ��
		template.deleteAll(beans);
	}

	@Override
	public void deleteById(Serializable id) {
		// ��ȡid��Ӧbean
		T bean = findById(id);
		// ����ɾ��
		// �Ϸ���У��
		if (bean != null) {
			delete(bean);
		}
	}

	@Override
	public void deleteByIds(Serializable... ids) {
		// �Ϸ���У��
		if (ids != null) {
			for (Serializable id : ids) {
				deleteById(id);
			}
		}
	}

	// ================��ѯ����======================
	@Override
	public T findById(Serializable id) {
		return (T) template.get(beanClass, id);
	}

	@Override
	public List<T> findByConditions(Conditions conditions) {
		// WhereAndValues����
		WhereAndValues whereAndValues = conditions.createWhereAndValues();
		String hql = "from " + beanClass.getName() + whereAndValues.getWhere()
				+ conditions.createOrderByString();
		Object[] values = whereAndValues.getValues();
//		System.out.println(hql);
//		System.out.println(Arrays.toString(values));
		return template.find(hql, values);
	}

}
