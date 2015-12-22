<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>OA系统</title>
<meta charset="UTF-8">

<!-- 引入 自定义 css-->
<link href="${pageContext.request.contextPath}/resource/css/oa.css"
	rel="stylesheet">

</head>
<body>

	<!-- 界面布局开始 -->
	<div class="container">
		<!-- 页面头部 -->
		<div id="page-head">
			<!-- 左侧标识 -->
			<div id="page-head-logo">
				<span>OA系统</span>
			</div>
			<!-- 右侧信息 -->
			<div id="page-head-right">
				<span id="theClock"></span> <span>欢迎${user.account }</span> <a href="javascript:void(0);" onclick="window.location='${pageContext.request.contextPath}'">退出</a>
			</div>
		</div>
		<!-- 页面导航栏 -->
		<div id="page-nav">
			<ul id="main-nav" class="mynav">

			</ul>
		</div>
		<!-- 页面中间部分 -->
		<div id="page-middle">
			<!-- 左侧导航 -->
			<div id="page-middle-nav">
				<ul id="page-middle-left-nav">

				</ul>

			</div>
			<!-- 右侧内容区 -->
			<div id="page-middle-right">
				<ul id="page-middle-right-content">

				</ul>
			</div>
		</div>
		<!-- 页面尾部 -->
		<div id="page-footer"></div>
	</div>
	<!-- 界面布局结束 -->

	<!-- 引入jQuery的js) -->
	<script
		src="${pageContext.request.contextPath}/resource/js/jquery-2.1.1.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resource/js/oa.js"></script>
	<script>
		
	  	$.post("/oa/system/menu/menuAction_getMenuConfig.action",function(config){
	  		
	  		createMenu(eval('('+config+')'));
	  	});
	  	
	  	showDT();
		
	  </script>
</body>
</html>