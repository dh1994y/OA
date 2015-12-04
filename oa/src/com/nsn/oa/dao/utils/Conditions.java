package com.nsn.oa.dao.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * ��ѯ����
 * 
 * @author Administrator
 * 
 */
public class Conditions {
	/**
	 * �����б�
	 */
	private List<Condition> conditions = new ArrayList<Condition>();
	/**
	 * ��������б�
	 */
	private List<OrderBy> orderBies = new ArrayList<OrderBy>();

	/**
	 * ����������
	 * 
	 * �ϸ�
	 * 
	 * ������
	 * 
	 * @param key
	 *            �����ֶ�
	 * @param isAsc
	 *            �Ƿ�����
	 */
	public void addOrderBy(String key, boolean isAsc) {
		// �Ϸ���У��
		if (key == null || key.trim().length() == 0) {
			return;
		}
		orderBies.add(new OrderBy(key, isAsc));
	}

	/**
	 * �������������ַ���
	 * 
	 * @return
	 */
	public String createOrderByString() {
		// ��������Ϊ��ʱ�����ؿ��ַ���"";
		if (orderBies.size() == 0) {
			return "";
		}
		StringBuilder builder = new StringBuilder(" order by ");
		for (OrderBy orderBy : orderBies) {
			builder.append(orderBy.getKey())
					.append(orderBy.isAsc() ? " asc " : " desc ").append(" , ");
		}
		return builder.substring(0,builder.length()-3);
	}

	/**
	 * ����������� ���������ֲ��Ϸ������������豨�����������Ϊ��ѯ����
	 * 
	 * �ϸ񣺲��Ϸ������������ �磺keyΪnull ��
	 * 
	 * @param key
	 *            ��ѯ�ֶ���
	 * @param value
	 *            ��ѯ�ֶ�ֵ
	 * @param op
	 *            ��ѯ������
	 */
	public void addCondition(String key, Object value, Operator op) {
		// key�Ϸ���У��
		if (key == null || key.trim().length() == 0) {
			return;
		}
		// op�Ϸ���У��
		if (op == null) {
			return;
		}
		// value�Ϸ���У�飺��ȴis/not is ������value����Ϊnull
		if (value == null) {
			if (op != Operator.IS && op != Operator.NOT_IS) {
				return;
			}
		}
		// ��Ϊnull���ж��Ƿ���String �մ�
		if (value != null && value instanceof String) {
			String v = (String) value;
			if (v.trim().length() == 0) {
				return;
			}
		}
		conditions.add(new Condition(key, value, op));
	}

	/**
	 * ����conditions����WhereAndValues����
	 * 
	 * @return
	 */
	public WhereAndValues createWhereAndValues() {
		// ����Ϊ��ʱ��ֱ�ӷ���new WhereAndValues()
		if (conditions.size() == 0) {
			return new WhereAndValues();
		}
		// ������Ϊ�գ���ʼƴ��
		StringBuilder builder = new StringBuilder(" where ");
		List<Object> list = new ArrayList<Object>();
		for (Condition condition : conditions) {
			// key
			String key = condition.getKey();
			// value
			Object value = condition.getValue();
			// operator
			Operator op = condition.getOp();
			// switch�ж�
			switch (op) {
			case EQUALS:
				builder.append(key).append(" = ? ");
				list.add(value);
				break;
			case NOT_EQUALS:
				builder.append(key).append(" != ? ");
				list.add(value);
				break;
			case GREAT:
				builder.append(key).append(" > ? ");
				list.add(value);
				break;
			case GREAT_EQUALS:
				builder.append(key).append(" >= ? ");
				list.add(value);
				break;
			case LESS:
				builder.append(key).append(" < ? ");
				list.add(value);
				break;
			case LESS_EQUALS:
				builder.append(key).append(" <= ? ");
				list.add(value);
				break;
			case LIKE:
				builder.append(key).append(" like ? ");
				list.add("%" + value + "%");
				break;
			case IS:
				builder.append(key).append(" is ? ");
				list.add(null);
				break;
			case NOT_IS:
				builder.append(key).append(" not is ? ");
				list.add(null);
				break;
			default:
				break;
			}
			builder.append(" and ");
		}
		return new WhereAndValues(builder.substring(0, builder.length() - 4),
				list.toArray());
	}

	public List<Condition> getConditions() {
		return conditions;
	}

	public void setConditions(List<Condition> conditions) {
		this.conditions = conditions;
	}

	public List<OrderBy> getOrderBies() {
		return orderBies;
	}

	public void setOrderBies(List<OrderBy> orderBies) {
		this.orderBies = orderBies;
	}

	/**
	 * �ڲ�ö�� ö�ٲ�����
	 * 
	 * @author Administrator
	 * 
	 */
	public enum Operator {
		EQUALS, NOT_EQUALS, GREAT, GREAT_EQUALS, LESS, LESS_EQUALS, LIKE, IS, NOT_IS
	}

	/**
	 * �ڲ��� ��һ���� ���ṩ������
	 * 
	 * @author Administrator
	 * 
	 */
	class Condition {
		private String key;// ��ѯ�ֶ���
		private Object value;// ��ѯ�ֶ�ֵ
		private Operator op;// ��ѯ��ϵ�����

		public Condition() {
		}

		public Condition(String key, Object value, Operator op) {
			super();
			this.key = key;
			this.value = value;
			this.op = op;
		}

		public String getKey() {
			return key;
		}

		public void setKey(String key) {
			this.key = key;
		}

		public Object getValue() {
			return value;
		}

		public void setValue(Object value) {
			this.value = value;
		}

		public Operator getOp() {
			return op;
		}

		public void setOp(Operator op) {
			this.op = op;
		}
	}

	/**
	 * ��װ where�Ӿ��value���� �����public �����ʹ��
	 * 
	 * @author Administrator
	 * 
	 */
	public class WhereAndValues {
		// Ϊ�˱���WhereAndValues����Ϊ��ʱ����õ�whereΪnullƴ�ӳ�����ʼ��Ϊ""
		private String where = "";
		private Object[] values;

		public WhereAndValues() {
		}

		public WhereAndValues(String where, Object[] values) {
			super();
			this.where = where;
			this.values = values;
		}

		public String getWhere() {
			return where;
		}

		public void setWhere(String where) {
			this.where = where;
		}

		public Object[] getValues() {
			return values;
		}

		public void setValues(Object[] values) {
			this.values = values;
		}
	}

	/**
	 * �����ڲ���
	 * 
	 * @author Administrator
	 * 
	 */
	class OrderBy {

		private String key;// �����ֶ�
		private boolean isAsc;// ������� true����false����

		public OrderBy() {
		}

		public OrderBy(String key, boolean isAsc) {
			super();
			this.key = key;
			this.isAsc = isAsc;
		}

		public String getKey() {
			return key;
		}

		public void setKey(String key) {
			this.key = key;
		}

		public boolean isAsc() {
			return isAsc;
		}

		public void setAsc(boolean isAsc) {
			this.isAsc = isAsc;
		}

	}
}
