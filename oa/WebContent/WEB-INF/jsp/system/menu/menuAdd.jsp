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
	width: 75%;
	margin: 20px auto;
}
.title{
	height: 20px;
	float: left;
	color: blue;
}
.back {
	height: 20px;
	float: right;
}

.form {
	clear: both;
	height: 450px;
}

.form div {
	margin: 20px 75px;
}

.form span {
	color: red;
}

.form textarea {
	border: 1px solid threeddarkshadow;
}

.btn {
	margin-left: 181px;
	background-color: aquamarine;
	border-radius: 7px;
	width: 75px;
	height: 30px;
	border: none;
}

::-moz-focus-inner {
	border: 0px;
}
</style>
</head>
<body>
	<div class="title">添加菜单页面</div>
	<div class="container">
		<div class="back">
			<a
				href="${pageContext.request.contextPath}/system/menu/menuAction_home.action">返回菜单记录主页</a>
		</div>
		<div class="form">
			<form id="form"
				action="${pageContext.request.contextPath}/system/menu/menuAction_save.action"
				method="post">
				<div>
					<span>*&nbsp;</span>菜单名：
					<input type="text" name="name" />
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>菜单等级：
					<s:select list="%{#application.dict.dictMap.menuLevel}"
						name="level"></s:select>
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>菜单序号：
					<input type="text" name="orderValue">
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>上级菜单：
					<s:select list="%{#application.dict.dictMap.equipVender}"
						name="parentId"></s:select>
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>是否启用：
					是<input type="radio" name="isUse" value="1">&nbsp;否<input type="radio" name="isUse" value="0">
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>访问路径：<br/>
					<textarea rows="5" cols="50" name="url"></textarea>
					<span></span>
				</div>
				<div>
					<input type="submit" value="添加" class="btn" />
				</div>
			</form>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resource/js/jquery-2.1.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/validate/jquery.validate.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/validate/additional-methods.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/validate/messages_zh.js"></script>
	<script>
		$("#form").validate({
			//debug : true,
			rules : {
				name : "required",
				level : "required",
				orderValue : "required",
				parentId : "required",
				isUse : "required",
				url : "required"
			},
			messages : {
				name : "请输入菜单名称",
				level : "请选择菜单等级",
				orderValue : "请输入菜单序号",
				parentId : "请选择上级菜单",
				isUse : "请选择是否启用",
				url : "请输入映射路径"
			},
			errorPlacement : function(error, element) {
				error.appendTo(element.next());
			},
			submitHandler : function(form) {
				alert("submitted");
				form.submit();
			}
		});
	</script>
</body>
</html>