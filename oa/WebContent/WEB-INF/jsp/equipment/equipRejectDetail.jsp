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

.detail {
	clear: both;
	padding-top: 25px;
	height: 450px;
}

.block-div {
	margin: 20px 20px;
	font-size: 18px;
}

</style>
</head>
<body>
	<div class="title">设备报废记录详情页面</div>
	<div class="container">
		<div class="back">
			<a
				href="${pageContext.request.contextPath}/equipment/equipmentRejectAction_home.action">返回设备报废记录主页</a>
		</div>
		<div class="detail">

			<div class="block-div"><span>*&nbsp;</span>设备名称：xxx</div>
			<div class="block-div"><span>*&nbsp;</span>设备Id：xxx</div>
			<div class="block-div"><span>*&nbsp;</span>报废人：xxx</div>
			<div class="block-div"><span>*&nbsp;</span>报废日期：xxx</div>
			<div class="block-div">
				<span>*&nbsp;</span>备注：<br /><span></span>
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