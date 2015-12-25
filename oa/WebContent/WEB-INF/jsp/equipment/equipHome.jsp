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
			<s:select list="%{#application.dict.dictMap.equipType}"
				emptyOption="true" id="equipType"></s:select>
			设备规格：
			<s:select list="%{#application.dict.dictMap.equipSpec}"
				emptyOption="true" id="equipSpec"></s:select>
			设备厂家：
			<s:select list="%{#application.dict.dictMap.equipVender}"
				emptyOption="true" id="equipVender"></s:select>
			设备状态：
			<s:select list="%{#application.dict.dictMap.equipStatus}"
				emptyOption="true" id="equipStatus"></s:select>
			所属单位：
			<s:select list="%{#application.dict.dictMap.dept}" emptyOption="true"
				id="department"></s:select>
			<div>
				设备名称：<input type="text" name="equipName" id="equipName" />
			</div>
		</div>
		<div>
			<div class="operator">
				<input type="button" value="添加" class="btn"
					onclick="window.location='${pageContext.request.contextPath}/equipment/equipmentAction_equipAdd.action'" />
				<input type="button" value="查询" class="btn" onclick="query()"/>
			</div>
		</div>
		<div class="dataTable">
			<table id="equipTable">
				<thead>
					<tr>
						<td>名称</td>
						<td>编号</td>
						<td>类型</td>
						<td>规格</td>
						<td>厂家</td>
						<td>状态</td>
						<td>操作</td>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<!-- 引入datatables相关文件 -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/dataTables/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resource/dataTables/fnReloadAjax.js"></script>
	<script type="text/javascript">
		var options = {
			"iDisplayLength" : 5,
			"oLanguage" : {
				"sUrl" : "/oa/resource/dataTables/zh_CN.txt"
			},
			"bProcessing" : true,//打开进度栏
			"columns" : [ {
				"data" : "equipName"
			}, {
				"data" : "equipNum"
			}, {
				"data" : "equipType"
			}, {
				"data" : "equipSpec"
			}, {
				"data" : "equipVender"
			}, {
				"data" : "equipStatus"
			}, {
				"data" : "equipVender"
			}, ],
			"bPaginate" : true, //翻页功能
			"bLengthChange" : false, //改变每页显示数据数量
			"bFilter" : false, //过滤功能
			"bInfo" : true,//页脚信息
			"bSort" : false, //排序功能
			"bStateSave" : false,//状态保存开关,使用cookie记录当前页码,即是页面关闭,重新打开时还是上次的页码

			//ajax服务器分页逻辑
			bServerSide : true, //开启服务器支持
			sAjaxSource : "${pageContext.request.contextPath }/equipment/equipmentAction_page.action?timestamp="
					+ new Date().getTime(),//指定请求路径
			fnRowCallback : function(nRow, aData, iDisplayIndex) {
				var deleteUrl = "${pageContext.request.contextPath }/equipment/equipmentAction_delete.action";
				var detailUrl = "${pageContext.request.contextPath }/equipment/equipmentAction_detail.action";
				var updateUrl = "${pageContext.request.contextPath }/equipment/equipmentAction_equipEdit.action";
				var rejectUrl = "${pageContext.request.contextPath }/equipment/equipmentRejectAction_add.action";
				var maintenanceUrl = "${pageContext.request.contextPath }/equipment/equipmentMaintenanceAction_add.action";
				var content = "<a href='" + detailUrl + "?id=" + aData.id
						+ "'>详情</a>&nbsp;<a href='" + updateUrl + "?id="
						+ aData.id + "'>修改</a>&nbsp;<a id='"+aData.id+"' href='javascript:void(0)' url='"
						+ maintenanceUrl + "?id=" + aData.id + "'>维修</a>&nbsp;<a id='"+aData.id+"' href='javascript:void(0)' url='"
						+ rejectUrl + "?id=" + aData.id + "'>报废</a>&nbsp;<a id='del' href='javascript:void(0)' url='"
						+ deleteUrl + "?id=" + aData.id + "'>删除</a>"
				//把一行的最后一个单元格里的内容替换为删除超链接 和 修改超链接
				$(":last-child", nRow).html(content);
				var lastChild = $(":last-child", $(":last-child", nRow));
				lastChild.click(function() {
					if (confirm("是否确认删除？")) {
						var url = $(this).attr("url");
						$.ajax({
							url : url,
							async : false,//改为同步方式
							type : "GET",
							success : function(data) {
								query();
							}
						});
					}
				});
				lastChild.prev().click(function(){
					//报废
					//ajax判断当前设备是否已报废
					var url = $(this).attr("url");
					var id = $(this).attr("id");
					var equipStatus = "正常";
					$.ajax({
						dataType : 'json',
						url : "${pageContext.request.contextPath }/equipment/equipmentAction_checkStatus.action",
						async : false,//改为同步方式
						type : "POST",
						data : {"id" : id },
						"success" : function(data){
							equipStatus = data;
						}
					});
					if(equipStatus == "报废"){
						alert("该设备已报废，无法执行该操作！");
					}else{
						window.location = url;
					}
				});
				lastChild.prev().prev().click(function(){
					//维修
					//ajax判断当前设备是否已报废
					var url = $(this).attr("url");
					var id = $(this).attr("id");
					var equipStatus = "正常";
					$.ajax({
						dataType : 'json',
						url : "${pageContext.request.contextPath }/equipment/equipmentAction_checkStatus.action",
						async : false,//改为同步方式
						type : "POST",
						data : {"id" : id },
						"success" : function(data){
							equipStatus = data;
						}
					});
					if(equipStatus == "正常"){
						alert("该设备正常，无需维修！");
					}else if(equipStatus == "报废"){
						alert("该设备已报废，无法执行该操作！");
					}else{
						window.location = url;
					}
				});
				return nRow;
			},
			fnServerParams : function(aoData) {
				var equipType = $("#equipType").val();
				var equipSpec = $("#equipSpec").val();
				var equipStatus = $("#equipStatus").val();
				var equipVender = $("#equipVender").val();
				var equipName = $("#equipName").val();
				var department = $("#department").val();
				aoData.push({
					"name" : "equipType",
					"value" : equipType,

				});
				aoData.push({
					"name" : "equipSpec",
					"value" : equipSpec
				});
				aoData.push({
					"name" : "equipStatus",
					"value" : equipStatus
				});
				aoData.push({
					"name" : "equipVender",
					"value" : equipVender
				});
				aoData.push({
					"name" : "equipName",
					"value" : equipName
				});
				aoData.push({
					"name" : "department",
					"value" : department
				});
			},
			//需要从服务器请求数据时调用
			fnServerData : function(sSource, aoData, fnCallback, oSettings) {
				oSettings.jqXHR = $.ajax({
					"dataType" : 'json',
					"type" : "POST",
					"url" : sSource,
					"data" : aoData,
					"success" : fnCallback
				});
			}
		}
		var pageTables = $("#equipTable").dataTable(options);
		function query() {
			pageTables.fnReloadAjax();
		}
	</script>
</body>
</html>