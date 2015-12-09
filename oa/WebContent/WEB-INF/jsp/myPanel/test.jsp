<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>OA登录</title>

<link href="${pageContext.request.contextPath}/resource/login/css/main.css" rel="stylesheet" type="text/css" />

</head>
<body>


<div class="login">
    <div class="box png">
		<div class="logo png"></div>
		<div class="input">
			<div class="log">
				<form action="${pageContext.request.contextPath}/system/menu/menuAction_home.action" method="post">
					<div class="name">
						<label>用户名</label><input type="text" class="text" id="value_1" placeholder="用户名" name="username" tabindex="1">
					</div>
					<div class="pwd">
						<label>密　码</label><input type="password" class="text" id="value_2" placeholder="密码" name="password" tabindex="2">
						<input type="submit" class="submit" tabindex="3" value="登录">
						<div class="check"></div>
					</div>
					<div class="tip"></div>
				</form>
			</div>
		</div>
	</div>
    <div class="air-balloon ab-1 png"></div>
	<div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/login/js/jQuery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/login/js/fun.base.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/login/js/script.js"></script>


<!--[if IE 6]>
<script src="js/DD_belatedPNG.js" type="text/javascript"></script>
<script>DD_belatedPNG.fix('.png')</script>
<![endif]-->
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
</div>
</body>
</html>