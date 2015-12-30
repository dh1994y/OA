<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>角色权限管理</title>
<LINK href="${pageContext.request.contextPath }/resource/css/Style.css"  type="text/css" rel="stylesheet">
</head>

<body>
	<div align="center">
		<div align="center"
			style="width: 90%; background-color: #f5fafe; height: 100%">

			<fieldset
				style="width: 100%; border: 1px solid #73C8F9; text-align: left; color: #023726; font-size: 12px; min-height: 40%">
				<legend align="left">
					权限分配
					<s:select id="roles" list="%{#request.roleList}" listKey="id"
						listValue="roleName" emptyOption="true" onchange="selectRole()"></s:select>
				</legend>
				<legend align="right">
					<button onclick="updateRole()">保存修改</button>
				</legend>

				<table cellSpacing="0" cellPadding="0" border="0">
					<s:iterator value="%{#request.groupsMap}" var="entry">
						<tr>
							<td class="ta_01" align="right" width="20%"
								style="font-weight: bold"><s:property value="%{#entry.key}" />
							</td>
							<td class="ta_01" align="left" width="90%"><s:checkboxlist
									id="menus" name="menus" list="%{#entry.value}"
									listKey="id" listValue="name"></s:checkboxlist>
							</td>
						</tr>
					</s:iterator>
				</table>
			</fieldset>

			<br />

			<fieldset
				style="width: 100%; border: 1px solid #73C8F9; text-align: left; color: #023726; font-size: 12px; min-height: 40%">
				<legend align="left">
					角色分配 <input id="account" type="text" size="15" name="account" />
					<button onclick="queryUser()">查询帐户名</button>
				</legend>

				<table id="userRoleTable" cellSpacing="0" cellPadding="0" border="0">
				</table>
			</fieldset>
		</div>
	</div>
	<!-- 引入jQuery的js) -->
	<script
		src="${pageContext.request.contextPath}/resource/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
		function selectRole() {
			var selectValue = $("#roles").val();
			if (!selectValue) {
				//拿到所有权限复选框,全部取消选中
				$("[name='menus']").each(function(index, domElement) {
					$(domElement).prop('checked', null);
				});
			} else {
				var url = "${pageContext.request.contextPath }/system/authAction_findFunctionsByRoleId.action";
				$.post(url, {
					"roleId" : selectValue,
					"timestamp" : new Date().getTime()
				}, function(data) {

					//data 此角色所有的权限的id组成的字符串,使用,分隔
					$("[name='menus']").each(function(index, domElement) {
						var value = $(domElement).val();
						var index2 = data.indexOf(value);
						if (index2 > -1) {
							$(domElement).prop('checked', 'checked');
						} else {
							$(domElement).prop('checked', null);
						}
					});
				});
			}
		}

		function updateRole() {
			var roleId = $("#roles").val();
			var menus = "";

			$("[name='menus']").each(function(index, domElement) {
				if ($(domElement).prop('checked')) {
					menus += $(domElement).val() + ",";
				}
			});
			var url = "${pageContext.request.contextPath }/system/authAction_updateRole.action";
			$.post(url, {
				"roleId" : roleId,
				"menus" : menus,
				"timestamp" : new Date().getTime()
			}, function(data) {
				alert(data);
			});
		}

		//var roleArray = [{'roleId':'001','rolename':'超级管理员'}  ,  ...];
		var roleArray = '<s:property value="%{#request.roleListJson}"  escapeHtml="false"/>';

		//根据用户名模糊查询(ajax)
		function queryUser() {
			var username = $("#username").val();
			if (!username) {
				return;
			}
			var url = "${pageContext.request.contextPath }/system/authAction_queryUser.action";
			$.post(url, {
				"username" : username,
				"timestamp" : new Date().getTime()
			}, function(data) {
				initTable(data);
			});

		}
		function initTable(userArray) {
			//先清空旧数据
			$("#userRoleTable").empty();
			for ( var i in userArray) {
				var user = userArray[i];
				var html = "";
				html += '<tr><td>' + user.username + ':</td><td>';
				html += '<form id="form'+i+'">';
				html += '	<input type="hidden" name="userId" value="'+user.userId+'" />';
				for ( var j in roleArray) {
					var role = roleArray[j];
					//标记,表示当前用户是否拥有当前角色
					var mark = false;
					//当前用户所拥有的角色
					var userRoleArray = user.roles;
					if (userRoleArray) {
						for ( var m in userRoleArray) {
							var userRole = userRoleArray[m];
							if (userRole.roleId == role.roleId) {
								mark = true;
								break;
							}
						}
					}
					if (mark) {
						html += ' <input type="checkbox" name="roles" value="'+role.roleId+'" checked="checked" />'
								+ role.rolename;
					} else {
						html += ' <input type="checkbox" name="roles" value="'+role.roleId+'"  />'
								+ role.rolename;
					}
				}
				html += ' </form>';
				html += '	</td><td><button onclick="updateUserRole(' + i
						+ ')">保存修改</button></td></tr>';

				$("#userRoleTable").append(html);
			}
		}
		function updateUserRole(i) {
			var queryString = $("#form" + i).serialize();
			var url = "${pageContext.request.contextPath }/system/authAction_updateUserRole.action?"
					+ queryString;

			$.post(url, {
				"timestamp" : new Date().getTime()
			}, function(data) {
				alert(data);
			});
		}
	</script>
</body>
</HTML>
