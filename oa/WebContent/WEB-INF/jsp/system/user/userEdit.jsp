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
	width: 90%;
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
	margin-bottom: 50px;
}

.form span {
	color: red;
}

.block-div {
	margin: 20px 0px;
	font-size: 18px;
}

.inline-div {
	display: inline-block;
	padding-right: 25px;
	width: 350px;
}

.form textarea {
	border: 1px solid threeddarkshadow;
}

.btn {
	margin-top: 25px;
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
	<div class="title">编辑用户页面</div>
	<div class="container">
		<div class="back">
			<a
				href="${pageContext.request.contextPath}/system/user/userAction_home.action">返回用户记录主页</a>
		</div>
		<div class="form">
			<form id="form"
				action="${pageContext.request.contextPath}/system/user/userAction_update.action"
				method="post">
				<input type="hidden" name="id" id="id" value="<s:property value="%{id}"/>"/>
				<div class="inline-div">
					<div class="block-div">
						<span>*&nbsp;</span>用户名：
						<input type="text" name="username" value="<s:property value="%{username}"/>"/>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>性别：
						<s:select list="%{#application.dict.dictMap.gender}" emptyOption="true" name="gender" value="%{gender}"></s:select>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>手机：
						<input type="text" name="mobilePhone" value="<s:property value="%{mobilePhone}"/>"/>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>邮箱：
						<input type="text" name="email" value="<s:property value="%{email}"/>"/>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>所属部门：
						<s:select list="%{#application.dict.dictMap.dept}" emptyOption="true" name="units" value="%{units}"></s:select>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>入职时间：
						<input type="text" name="onDutyDate" onclick="WdatePicker()" class="Wdate" value="<s:property value="%{onDutyDate}"/>"/>
						<span></span>
					</div>
				</div>
				<div class="inline-div">
					<div class="block-div">
						<span>*&nbsp;</span>帐户名：
						<input type="text" name="account" id="account" value="<s:property value="%{account}"/>"/>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>出生日期：
						<input type="text" name="birthday" onclick="WdatePicker()" class="Wdate" value="<s:property value="%{birthday}"/>"/>
						<span></span>
					</div>
					<div class="block-div">
						<span>&nbsp;&nbsp;&nbsp;</span>电话：
						<input type="text" name="telephone" value="<s:property value="%{telephone}"/>"/>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>地址：
						<input type="text" name="address" value="<s:property value="%{address}"/>"/>
						<span></span>
					</div>
					<div class="block-div">
						<span>*&nbsp;</span>是否在职：
						<s:select list="%{#application.dict.dictMap.isDuty}" emptyOption="true" name="isDuty" value="%{isDuty}"></s:select>
						<span></span>
					</div>
					<div class="block-div">
						<span>&nbsp;&nbsp;&nbsp;</span>离职时间：
						<input type="text" name="offDutyDate" onclick="WdatePicker()" class="Wdate" value="<s:property value="%{offDutyDate}"/>"/>
						<span></span>
					</div>
				</div>
				<div>
					备注：<br/>
					<textarea rows="5" cols="50" name="comment"><s:property value="%{comment}"/></textarea>
				</div>
				<div>
					<input type="submit" value="修改" class="btn" />
				</div>
			</form>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resource/js/jquery-2.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resource/DatePicker/WdatePicker.js"> </script>
	<script
		src="${pageContext.request.contextPath}/resource/validate/jquery.validate.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/validate/additional-methods.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/validate/messages_zh.js"></script>
	<script>
		$.validator.addMethod("checkUnique", function(value, element) { 
			//获取输入帐户名
		    var account = $("#account").val();
		    var id = $("#id").val();
		    var isUnique = false;
		    if(account!=null&&account.length>0){
		    	//使用ajax设置同步 避免post异步数据赋值延迟
		    	$.ajax({
		    		url: "/oa/system/user/userAction_checkAccountUnique.action",
		    	    async: false,//改为同步方式
	    	        type: "POST",
	    	        data: {'account':account,'id':id},
	    	        dataType: "json",
	    	        success: function (data) {
	    	        	isUnique = data;	
		    		}
		    	});
		    }
		    if(isUnique){
		    	return true;
		    }
		    return false;
		}, "不唯一");
		$("#form").validate({
			//debug : true,
			onkeyup : false,
			rules : {
				username : "required",
				gender : "required",
				mobilePhone : "required",
				email : {
				    required: true,
				    email: true
				},
				department : "required",
				account : {
					required: true,
				    checkUnique: true
				 },
				brithday : "required",
				address : "required",
				onDutyDate : "required",
				isDuty : "required",
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