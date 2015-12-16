<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<!-- 引入 Bootstrap css-->
<link
	href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div>
		<div id="left" style="float:left;margin-left:20px;margin-right:20px;">
			我的心情
			<div style="width:300px;height:300px;border:1px solid green;">
				${matter!=null?matter.feel:""}
			</div>
		</div>
		<div id="right" style="float:left;margin-left:20px;">
			代办事宜
			<div style="width:300px;height:300px;border:1px solid green;">
				${matter!=null?matter.matter:""}
			</div>
		</div>
	</div>
	<div style="margin-right:155px;margin-top:25px;float:right;clear:both;">
		<a href="${pageContext.request.contextPath}/myPanel/matter/matterAction_edit.action">编辑待办事宜</a>
	</div>
</body>
</html>