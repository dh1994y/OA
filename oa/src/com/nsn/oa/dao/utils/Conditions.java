package com.nsn.oa.dao.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * 查询条件
 * 
 * @author Administrator
 * 
 */
public class Conditions {
	/**
	 * 条件列表
	 */
	private List<Condition> conditions = new ArrayList<Condition>();
	/**
	 * 排序规则列表
	 */
	private List<OrderBy> orderBies = new ArrayList<OrderBy>();

	/**
	 * 添加排序规则
	 * 
	 * 严格：
	 * 
	 * 安静：
	 * 
	 * @param key
	 *            排序字段
	 * @param isAsc
	 *            是否升序
	 */
	public void addOrderBy(String key, boolean isAsc) {
		// 合法性校验
		if (key == null || key.trim().length() == 0) {
			return;
		}
		orderBies.add(new OrderBy(key, isAsc));
	}

	/**
	 * 创建排序条件字符串
	 * 
	 * @return
	 */
	public String createOrderByString() {
		// 排序条件为空时，返回空字符串"";
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
	 * 添加条件方法 安静：出现不合法的条件，不予报错，仅不添加作为查询条件
	 * 
	 * 严格：不合法的条件不添加 如：key为null 等
	 * 
	 * @param key
	 *            查询字段名
	 * @param value
	 *            查询字段值
	 * @param op
	 *            查询操作符
	 */
	public void addCondition(String key, Object value, Operator op) {
		// key合法性校验
		if (key == null || key.trim().length() == 0) {
			return;
		}
		// op合法性校验
		if (op == null) {
			return;
		}
		// value合法性校验：除却is/not is 外其余value不可为null
		if (value == null) {
			if (op != Operator.IS && op != Operator.NOT_IS) {
				return;
			}
		}
		// 不为null是判断是否是String 空串
		if (value != null && value instanceof String) {
			String v = (String) value;
			if (v.trim().length() == 0) {
				return;
			}
		}
		conditions.add(new Condition(key, value, op));
	}

	/**
	 * 根据conditions创建WhereAndValues对象
	 * 
	 * @return
	 */
	public WhereAndValues createWhereAndValues() {
		// 条件为空时，直接返回new WhereAndValues()
		if (conditions.size() == 0) {
			return new WhereAndValues();
		}
		// 条件不为空，开始拼接
		StringBuilder builder = new StringBuilder(" where ");
		List<Object> list = new ArrayList<Object>();
		for (Condition condition : conditions) {
			// key
			String key = condition.getKey();
			// value
			Object value = condition.getValue();
			// operator
			Operator op = condition.getOp();
			// switch判断
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
	 * 内部枚举 枚举操作符
	 * 
	 * @author Administrator
	 * 
	 */
	public enum Operator {
		EQUALS, NOT_EQUALS, GREAT, GREAT_EQUALS, LESS, LESS_EQUALS, LIKE, IS, NOT_IS
	}

	/**
	 * 内部类 单一条件 不提供外界访问
	 * 
	 * @author Administrator
	 * 
	 */
	class Condition {
		private String key;// 查询字段名
		private Object value;// 查询字段值
		private Operator op;// 查询关系运算符

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
	 * 封装 where子句和value数组 定义成public 供外界使用
	 * 
	 * @author Administrator
	 * 
	 */
	public class WhereAndValues {
		// 为了避免WhereAndValues对象为空时，获得的where为null拼接出错，初始化为""
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
	 * 排序内部类
	 * 
	 * @author Administrator
	 * 
	 */
	class OrderBy {

		private String key;// 排序字段
		private boolean isAsc;// 排序规则 true升序false降序

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
