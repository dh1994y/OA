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

.inline-div {
	display: inline-block;
	padding-right: 25px;
	width: 250px;
}
</style>
</head>
<body>
	<div class="title">菜单详情页面</div>
	<div class="container">
		<div class="back">
			<a
				href="${pageContext.request.contextPath}/system/menu/menuAction_home.action">返回菜单记录主页</a>
		</div>
		<div class="detail">

			<div class="block-div">菜单名：xxx</div>
			<div class="block-div">菜单等级：xxx</div>
			<div class="block-div">菜单序号：xxx</div>
			<div class="block-div">上级菜单：xxx</div>
			<div class="block-div">是否启用：xxx</div>
			<div class="block-div">
				访问路径：<br />
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