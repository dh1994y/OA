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
	padding-top: 35px;
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
	<div class="title">添加报废记录页面</div>
	<div class="container">
		<div class="back">
			<a
				href="${pageContext.request.contextPath}/equipment/equipment/equipmentAction_home.action">返回设备记录主页</a>
		</div>
		<div class="form">
			<form id="form"
				action="${pageContext.request.contextPath}/equipment/equipment/equipmentRejectAction_save.action"
				method="post">
				<div>
					<input type="hidden" value="<s:property value="%{id}"/>" name="equipId"/>
					<span>*&nbsp;</span>设备名称：<s:property value="equipName"/>
				</div>
				<div>
					<span>*&nbsp;</span>报废人：<s:property value="%{#session.user.username}"/>
				</div>
				<div>
					<span>*&nbsp;</span>备注：<span></span><br/>
					<textarea rows="5" cols="50" name="comment"></textarea>
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
		$.validator.addMethod("textAreaCK",function(value, element){
			return false;
			if(value==null||value.lenght==0){
				return false;
			}
			return true;
		},"必须输入备注信息");
		$("#form").validate({
			debug : true,
			onkeyup : false,
			rules : {
				comment : "textAreaCK",
			},
			errorPlacement : function(error, element) {
				error.appendTo(element.prev().prev());
			},
			submitHandler : function(form) {
				//alert("submitted");
				form.submit();
			}
		});
	</script>
</body>
</html>