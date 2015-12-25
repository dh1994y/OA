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
	<div class="title">添加设备页面</div>
	<div class="container">
		<div class="back">
			<a
				href="${pageContext.request.contextPath}/equipment/equipmentAction_home.action">返回设备记录主页</a>
		</div>
		<div class="form">
			<form id="form"
				action="${pageContext.request.contextPath}/equipment/equipmentAction_save.action"
				method="post">
				<div>
					<span>*&nbsp;</span>设备名称：<input type="text" name="equipName" /><span></span>
				</div>
				<div>
					<span>*&nbsp;</span>设备类型：
					<s:select list="%{#application.dict.dictMap.equipType}"
						name="equipType" emptyOption="true"></s:select>
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>设备规格：
					<s:select list="%{#application.dict.dictMap.equipSpec}"
						name="equipSpec" emptyOption="true"></s:select>
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>设备厂家：
					<s:select list="%{#application.dict.dictMap.equipVender}"
						name="equipVender" emptyOption="true"></s:select>
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>设备状态：
					<s:select list="%{#application.dict.dictMap.equipStatus}"
						name="equipStatus" emptyOption="true"></s:select>
					<span></span>
				</div>
				<div>
					<span>*&nbsp;</span>所属单位：
					<s:select list="%{#application.dict.dictMap.dept}"
						name="department" emptyOption="true"></s:select>
					<span></span>
				</div>
				<div>
					备注：<br />
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
				//alert("submitted");
				form.submit();
			}
		});
	</script>
</body>
</html>