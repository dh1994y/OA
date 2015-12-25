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

.title {
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
	margin-bottom: 50px;
}

.form span {
	color: red;
}

.block-div {
	margin: 20px 0px;
	font-size: 18px;
}

.inline-div {
	display: inline-block;
	padding-right: 25px;
	width: 300px;
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
	<div class="container">
		<div class="back">
			<a
				href="${pageContext.request.contextPath}/myPanel/personal/personalInfoAction_edit.action">编辑个人信息</a>
		</div>
		<div class="form">

			<div class="inline-div">
				<div class="block-div">用户名：<s:property value="username"/></div>
				<div class="block-div">性别：<s:property value="gender"/></div>
				<div class="block-div">手机： <s:property value="mobilePhone"/></div>
				<div class="block-div">邮箱： <s:property value="email"/></div>
				<div class="block-div">所属部门：<s:property value="units"/></div>
			</div>
			<div class="inline-div">
				<div class="block-div">帐户名： <s:property value="account"/></div>
				<div class="block-div">出生日期： <s:property value="birthday"/></div>
				<div class="block-div">电话： <s:property value="telephone"/></div>
				<div class="block-div">地址：<s:property value="address"/></div>
				<div class="block-div">入职时间： <s:property value="onDutyDate"/></div>
			</div>
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
		
	</script>
</body>
</html>