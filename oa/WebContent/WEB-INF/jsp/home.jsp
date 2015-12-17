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

<!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
<!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->
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
				<span>2015/12/9 下午 12:25</span> <span>欢迎xxx</span> <span id="exit">退出</span>
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
	<!-- 引入bootstrap的js -->
	<script
		src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/oa.js"></script>
	<script>
		
	  	$.post("/oa/system/menu/menuAction_getMenuConfig.action",function(config){
	  		
	  		createMenu(eval('('+config+')'));
	  	});
		
	  </script>
</body>
</html>