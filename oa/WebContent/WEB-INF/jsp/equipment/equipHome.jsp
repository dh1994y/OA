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
	height: 68px;
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
			设备类型：
			<s:select list="%{#application.dict.dictMap.equipType}"></s:select>
			设备规格：
			<s:select list="%{#application.dict.dictMap.equipSpec}"></s:select>
			设备厂家：
			<s:select list="%{#application.dict.dictMap.equipVender}"></s:select>
			设备状态：
			<s:select list="%{#application.dict.dictMap.equipStatus}"></s:select>
			所属单位：
			<s:select list="%{#application.dict.dictMap.dept}"></s:select>
			<div>
				设备名称：<input type="text" name="equipName" />
			</div>
		</div>
		<div>
			<div class="operator">
				<input type="button" value="添加" class="btn"
					onclick="window.location='${pageContext.request.contextPath}/equipment/equipmentAction_add.action'" />
				<input type="button" value="查询" class="btn" />
			</div>
		</div>
		<div class="dataTable">
			<table id="userTable">
				<thead>
					<tr>
						<td>名称</td>
						<td>类型</td>
						<td>规格</td>
						<td>厂家</td>
						<td>操作</td>
					</tr>
				</thead>
				<tr>
					<td>1</td>
					<td>张三1</td>
					<td>男</td>
					<td>15058888888</td>
					<td><a
						href="${pageContext.request.contextPath}/equipment/equipmentAction_detail.action">详情&nbsp;</a><a
						href="${pageContext.request.contextPath}/equipment/equipmentAction_edit.action">&nbsp;修改</a><a
						href="#">&nbsp;删除</a> <a
						href="${pageContext.request.contextPath}/equipment/equipmentMaintenanceAction_add.action">&nbsp;维护</a>
						<a
						href="${pageContext.request.contextPath}/equipment/equipmentRejectAction_add.action">&nbsp;报废</a></td>
				</tr>
				<tr class="content2">
					<td>1</td>
					<td>张三1</td>
					<td>男</td>
					<td>15058888888</td>
					<td><a
						href="${pageContext.request.contextPath}/equipment/equipmentAction_detail.action">详情&nbsp;</a><a
						href="${pageContext.request.contextPath}/equipment/equipmentAction_edit.action">&nbsp;修改</a><a
						href="#">&nbsp;删除</a> <a
						href="${pageContext.request.contextPath}/equipment/equipmentMaintenanceAction_add.action">&nbsp;维护</a>
						<a
						href="${pageContext.request.contextPath}/equipment/equipmentRejectAction_add.action">&nbsp;报废</a></td>
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