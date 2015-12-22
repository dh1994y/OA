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

.detail {
	clear: both;
	padding-top: 25px;
	height: 450px;
}
.block-div {
	margin: 20px 20px;
	font-size: 18px;
}
.inline-div{
	display: inline-block;
	padding-right: 25px;
	width: 250px;
}

</style>
</head>
<body>
	<div class="title">设备详情页面</div>
	<div class="container">
		<div class="back">
			<a
				href="${pageContext.request.contextPath}/equipment/equipment/equipmentAction_home.action">返回设备记录主页</a>
		</div>
		<div class="detail">
			<div class="inline-div">
				<div class="block-div">
					设备名称：xxx
				</div>
				<div class="block-div">
					设备规格：xxx
				</div>
				<div class="block-div">
					设备状态：xxx
				</div>
				<div class="block-div">
					创建用户：xxx
				</div>
				<div class="block-div">
					最后修改用户：xxx
				</div>
			</div>
			<div class="inline-div">
				<div class="block-div">
					设备类型：xxx
				</div>
				<div class="block-div">
					设备厂家：xxx
				</div>
				<div class="block-div">
					所属单位：xxx
				</div>
				<div class="block-div">
					创建时间：xxx
				</div>
				<div class="block-div">
					最后修改时间：xxx
				</div>
			</div>
			<div class="block-div">
				备注：<br/>
				<textarea rows="5" cols="50" disabled="disabled"></textarea>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resource/js/jquery-2.1.1.min.js"></script>
	<script>
		
	</script>
</body>
</html>