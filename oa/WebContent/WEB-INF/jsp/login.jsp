<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>OA登录</title>

<style type="text/css">

	input:focus{
		border: 1px solid green;
	}
	body {
		background-color: #F1F4F5;
		font-family: Tahoma, Verdana, STHeiTi, simsun, sans-serif;
		font-size: 20px;
	}
	
	.head {
		height: 50px;
	}
	
	.title {
		text-align: center;
		color: deepskyblue;
	}
	
	.login-box {
		width: 500px;
		height: 300px;
		box-shadow: #CFD6DE 0px 5px 5px 0px;
		margin: 0px auto;
		background-color: #FFFFFF;
		border-radius: 25px 25px 15px 15px;
		padding-top: 25px;
	}
	
	.errorMessage {
		color: red;
		height: 35px;
		text-align: center;
	}
	.row{
		margin: 25px 0px;
		text-align: center;
	}
	.row label{
		width: 100px;
		display: inline-block;
		text-align: right;
	}
	.text{
		width: 200px;
	}
	.pwd{
		width: 200px;
	}
	.ckNum{
		width: 100px;
	}
	.ckImg{
		height: 25px; 
		width: 100px;
		padding-left: 5px;
	}
</style>

</head>
<body>

	<div class="head"></div>
	<div class="title">
		<h1>OA协同办公平台登录</h1>
	</div>
	<div class="login-box">
		<div class="errorMessage">
			<s:actionerror/>	
		</div>
		<form action="system/user/userAction_login.action" method="post" class="form">
			<div class="row">
				<label>用户名：</label><input type="text" name="account" placeholder="用户名" class="text" value="${cookie.accountCookie.value}"/>
			</div>
			<div class="row">
				<label>密码：</label><input type="password" name="password" placeholder="密码" class="pwd" value="${cookie.passwordCookie.value}"/>
			</div>
			<div class="row">
				<label>验证码：</label><input type="text" name="checkNumber" placeholder="验证码" class="ckNum"/><img src="${pageContext.request.contextPath}/resource/utils/checkNumber.jsp" class="ckImg" onclick="this.src='${pageContext.request.contextPath}/resource/utils/checkNumber.jsp?timestamp='+new Date().getTime()"/>
			</div>
			<div class="row">
				<input type="submit" value="登录"/> <input type="checkbox" name="isRemember" value="yes"/>记住我
			</div>
		</form>
	</div>

</body>
</html>