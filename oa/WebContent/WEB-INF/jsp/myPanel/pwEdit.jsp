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
	margin-left: 101px;
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
	<div class="title">编辑密码页面</div>
	<div class="container">
		<div class="form">
			<form id="form"
				action="${pageContext.request.contextPath}/myPanel/personal/personalInfoAction_updatePwd.action"
				method="post">
				<div>
					<span>*&nbsp;</span>新密码：
					<input type="text" name="password" id="password" value="<s:property value="%{password}"/>"/>
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>重复密码：
					<input type="text" name="rePassword" value="<s:property value="%{password}"/>"/>
					<span></span>
				</div>
				<div>
					<input type="submit" value="确认" class="btn" />
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
				password : {
					required : true,
				},
				rePassword : {
					required : true,
					equalTo : "#password", 
				}
			},
			messages : {
				password : {
					required : "请输入密码",
				},
				rePassword : {
					required : "请再次输入密码",
					equalTo : "两次输入不一致"
				}
			},
			errorPlacement : function(error, element) {
				error.appendTo(element.next());
			},
			submitHandler : function(form) {
				//alert("submitted");
				form.submit();
			}
		});
	</script>
</body>
</html>