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
			所属单位：
			<s:select list="%{#application.dict.dictMap.dept}" emptyOption="true" id="department"></s:select>
			用户性别：
			<s:select list="%{#application.dict.dictMap.gender}"
				emptyOption="true" id="gender"></s:select>
			是否在职：
			<s:select list="%{#application.dict.dictMap.isDuty}"
				emptyOption="true" id="isDuty"></s:select>
			<div>
				用户名称：<input type="text" id="username"/>
			</div>
		</div>
		<div>
			<div class="operator">
				<input type="button" value="添加" class="btn"
					onclick="window.location='${pageContext.request.contextPath}/system/user/userAction_userAdd.action'" />
				<input type="button" value="查询" class="btn" onclick="query()" />
			</div>
		</div>
		<div class="dataTable">
			<table id="userTable">
				<thead>
					<tr>
						<td>姓名</td>
						<td>性别</td>
						<td>帐号</td>
						<td>所属单位</td>
						<td>是否在职</td>
						<td>手机</td>
						<td>操作</td>
					</tr>
				</thead>
				
			</table>
		</div>
	</div>
	<!-- 引入datatables相关文件 -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/dataTables/js/jquery.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/dataTables/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resource/dataTables/fnReloadAjax.js"></script>
	<script type="text/javascript">
	
		var options = {
			"iDisplayLength": 5,
			"oLanguage" : {
				"sUrl" : "/oa/resource/dataTables/zh_CN.txt"
			},
			"bProcessing" : true,//打开进度栏
			"columns" : [ 
			    {"data" : "username"}, 
			    {"data" : "gender"}, 
			    {"data" : "account"}, 
			    {"data" : "units"}, 
			    {"data" : "isDuty"},
			    {"data" : "mobilePhone"},
			    {"data" : "isDuty"}
			],
			"bPaginate" : true, //翻页功能
			"bLengthChange" : false, //改变每页显示数据数量
			"bFilter" : false, //过滤功能
			"bInfo" : true,//页脚信息
			"bSort" : false, //排序功能
			"bStateSave" : false,//状态保存开关,使用cookie记录当前页码,即是页面关闭,重新打开时还是上次的页码

			//ajax服务器分页逻辑
			bServerSide : true, //开启服务器支持
			sAjaxSource : "${pageContext.request.contextPath }/system/userAction_page.action?timestamp="
					+ new Date().getTime(),//指定请求路径
			fnRowCallback : function(nRow, aData, iDisplayIndex) {
				var deleteUrl = "${pageContext.request.contextPath }/system/userAction_delete.action";
				var detailUrl = "${pageContext.request.contextPath }/system/userAction_userDetail.action";
				var updateUrl = "${pageContext.request.contextPath }/system/userAction_userEdit.action";
				var content = "<a href='" + detailUrl + "?id="
						+ aData.id + "'>详情</a>&nbsp;<a href='" + updateUrl
						+ "?id=" + aData.id + "'>修改</a>&nbsp;<a id='del' href='javascript:void(0)' url='"
						+ deleteUrl + "?id=" + aData.id + "'>删除</a>"
				//把一行的最后一个单元格里的内容替换为删除超链接 和 修改超链接
				$(":last-child", nRow).html(content);
				$(":last-child", $(":last-child", nRow)).click(function(){
					if(confirm("是否确认删除？")){
						var url = $(this).attr("url");
						$.ajax({
							url: url,
				    	    async: false,//改为同步方式
			    	        type: "GET",
			    	        success: function (data) {
			    	        	query();
				    		}
						});
					}
				});
				return nRow;
			},
			fnServerParams : function(aoData) {
				var username = $("#username").val();
				var department = $("#department").val();
				var gender = $("#gender").val();
				var isDuty = $("#isDuty").val();
				aoData.push({
					"name" : "username",
					"value" : username,
					
				});
				aoData.push({
					"name" : "units",
					"value" : department
				});
				aoData.push({
					"name" : "gender",
					"value" : gender
				});
				aoData.push({
					"name" : "isDuty",
					"value" : isDuty
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
		var pageTables = $("#userTable").dataTable(options);
		function query(){
			pageTables.fnReloadAjax();
		}
		
	</script>
</body>
</html>