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
				<div class="block-div">用户名：xxx</div>
				<div class="block-div">性别：xxx</div>
				<div class="block-div">手机： xxx</div>
				<div class="block-div">邮箱： xxx</div>
				<div class="block-div">所属部门：xxx</div>
				<div class="block-div">入职时间： xxx</div>
			</div>
			<div class="inline-div">
				<div class="block-div">帐户名： xxx</div>
				<div class="block-div">出生日期： xxx</div>
				<div class="block-div">电话： xxx</div>
				<div class="block-div">地址：xxx</div>
				<div class="block-div">是否在职：xxx</div>
				<div class="block-div">离职时间： xxx</div>
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
		$("#form").validate({
			//debug : true,
			rules : {
				equipName : "required",
				equipType : "required",
				equipSpec : "required",
				equipVender : "required",
				equipStatus : "required",
				department : "required"
			},
			messages : {
				equipName : "请输入设备名称",
				equipType : "请选择设备类型",
				equipSpec : "请选择设备型号",
				equipVender : "请选择设备厂家",
				equipStatus : "请选择设备状态",
				department : "请选择设备所属部门"
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