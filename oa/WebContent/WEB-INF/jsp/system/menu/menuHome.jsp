<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
a:visited {
	color: blue;
}

a {
	text-decoration: none;
}

.container {
	width: 90%;
	margin: 20px auto;
}

.queryCondition {
	height: 45px;
	padding-top: 15px;
	padding-left: 15px;
}

.queryCondition>div {
	margin-top: 20px;
}

.operator {
	height: 35px;
	float: right;
}

.dataTable {
	clear: both;
}

.btn {
	margin: 0px 25px 0px 0px;
	background-color: aquamarine;
	border-radius: 7px;
}

::-moz-focus-inner {
	border: 0px;
}

select {
	margin-right: 10px;
}
</style>
<!-- 引入dataTables样式表 -->
<link
	href="${pageContext.request.contextPath}/resource/dataTables/css/jquery.dataTables.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="queryCondition">
			菜单等级：
			<s:select list="%{#application.dict.dictMap.menuLevel}"></s:select>
		</div>
		<div>
			<div class="operator">
				<input type="button" value="添加" class="btn"
					onclick="window.location='${pageContext.request.contextPath}/system/menuAction_add.action'" />
				<input type="button" value="查询" class="btn" />
			</div>
		</div>
		<div class="dataTable">
			<table id="userTable">
				<thead>
					<tr>
						<td>菜单名</td>
						<td>菜单等级</td>
						<td>菜单序号</td>
						<td>上级菜单</td>
						<td>是否启用</td>
						<td>操作</td>
					</tr>
				</thead>
				<tr>
					<td>我的面板</td>
					<td>1</td>
					<td>1</td>
					<td>无</td>
					<td>是</td>
					<td><a
						href="${pageContext.request.contextPath}/system/menu/menuAction_detail.action">详情&nbsp;</a>
						<a
						href="${pageContext.request.contextPath}/system/menu/menuAction_edit.action">编辑&nbsp;</a>
					</td>
				</tr>
				<tr>
					<td>系统管理</td>
					<td>1</td>
					<td>2</td>
					<td>无</td>
					<td>是</td>
					<td><a
						href="${pageContext.request.contextPath}/system/menu/menuAction_detail.action">详情&nbsp;</a>
						<a
						href="${pageContext.request.contextPath}/system/menu/menuAction_edit.action">编辑&nbsp;</a>
					</td>
				</tr>
				<tr>
					<td>菜单管理</td>
					<td>2</td>
					<td>2</td>
					<td>系统管理</td>
					<td>是</td>
					<td><a
						href="${pageContext.request.contextPath}/system/menu/menuAction_detail.action">详情&nbsp;</a>
						<a
						href="${pageContext.request.contextPath}/system/menu/menuAction_edit.action">编辑&nbsp;</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 引入datatables相关文件 -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/dataTables/js/jquery.dataTables.js"></script>
	<script type="text/javascript">
		$("#userTable").dataTable({
			bFilter : false,
			bSort : false,
			bLengthChange : false,
			oLanguage : {
				"sLengthMenu" : "每页显示 _MENU_条",
				"sZeroRecords" : "没有找到符合条件的数据",
				"sProcessing" : "&lt;img src=’./loading.gif’ /&gt;",
				"sInfo" : "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",
				"sInfoEmpty" : "木有记录",
				"sInfoFiltered" : "(从 _MAX_ 条记录中过滤)",
				"sSearch" : "搜索：",
				"oPaginate" : {
					"sFirst" : "首页",
					"sPrevious" : "前一页",
					"sNext" : "后一页",
					"sLast" : "尾页"
				}
			}
		});
	</script>
</body>
</html>