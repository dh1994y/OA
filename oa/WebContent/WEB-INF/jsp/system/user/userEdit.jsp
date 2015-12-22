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
	width: 350px;
}

.form textarea {
	border: 1px solid threeddarkshadow;
}

.btn {
	margin-top: 25px;
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
	<div class="title">编辑用户页面</div>
	<div class="container">
		<div class="back">
			<a
				href="${pageContext.request.contextPath}/system/user/userAction_home.action">返回用户记录主页</a>
		</div>
		<div class="form">
			<form id="form"
				action="${pageContext.request.contextPath}/system/user/userAction_save.action"
				method="post">
				<div class="inline-div">
					<div class="block-div">
						<span>*&nbsp;</span>用户名：
						<input type="text" name="username" />
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>性别：
						<s:select list="%{#application.dict.dictMap.gender}" name="gender"></s:select>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>手机：
						<input type="text" name="mobilephone" />
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>邮箱：
						<input type="text" name="email" />
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>所属部门：
						<s:select list="%{#application.dict.dictMap.dept}" name="department"></s:select>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>入职时间：
						<input type="text" name="onDutyDate" />
						<span></span>
					</div>
				</div>
				<div class="inline-div">
					<div class="block-div">
						<span>*&nbsp;</span>帐户名：
						<input type="text" name="account" />
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>出生日期：
						<input type="text" name="brithday" />
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>电话：
						<input type="text" name="telephone" />
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>地址：
						<input type="text" name="address" />
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>是否在职：
						<s:select list="%{#application.dict.dictMap.isDuty}" name="isDuty"></s:select>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>离职时间：
						<input type="text" name="offDutyDate" />
						<span></span>
					</div>
				</div>
				<div>
					备注：<br/>
					<textarea rows="5" cols="50"></textarea>
				</div>
				<div>
					<input type="submit" value="修改" class="btn" />
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