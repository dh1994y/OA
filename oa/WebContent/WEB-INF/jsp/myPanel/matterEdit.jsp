<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		form {
			margin: 0;
		}
		textarea {
			display: block;
		}
	</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/kindeditor/themes/default/default.css" />
</head>
<body>	

	<div style="margin-right:55px;float:right;">
		<a href="${pageContext.request.contextPath}/myPanel/matter/matterAction_home.action">返回待办事宜</a>
	</div>
	<form action="${pageContext.request.contextPath}/myPanel/matter/matterAction_update.action" method="post">
		<div>
			<div id="top" style="margin-left:20px;float:left;clear:both;">
				我的心情
				<div style="width:300px;height:400px;border:1px solid green;">
					<textarea rows="15" cols="20" name="feel">${matter!=null?matter.feel:""}</textarea>
				</div>
			</div>
			<div id="below" style="margin-left:20px;float:left;">
				代办事宜
				<div style="width:300px;height:400px;border:1px solid green;">
					<textarea rows="15" cols="20" name="matter">${matter!=null?matter.matter:""}</textarea>
				</div>
			</div>
		</div>
		<div style="margin-right:145px;margin-top:25px;float:right;clear:both;">
			<input type="submit" value="提交修改" style="margin-right:20px;"/>
		</div>
	</form>
	
	<script charset="utf-8" src="${pageContext.request.contextPath}/resource/kindeditor/kindeditor-min.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/resource/kindeditor/lang/zh_CN.js"></script>
	<script>
		var editorFeel;
		var editorMatter;
		KindEditor.ready(function(K) {
			editorFeel = K.create('textarea[name="feel"]', {
				minHeight : 250,
				minWidth : 300,
				allowImageUpload : true,
				uploadJson : '${pageContext.request.contextPath }/KindEditorServlet',
	            fileManagerJson : '${pageContext.request.contextPath }/resource/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
				items : [
				         'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
				         'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
				         'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
				         'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
				         'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
				         'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
				         'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'code', 'pagebreak',
				         'link', 'unlink', '|', 'about'
				 ]
			});
			editorMatter = K.create('textarea[name="matter"]', {
				minHeight : 250,
				minWidth : 300,
				allowImageUpload : true,
				uploadJson : '${pageContext.request.contextPath }/KindEditorServlet',
	            fileManagerJson : '${pageContext.request.contextPath }/resource/kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
				items : [
				         'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
				         'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
				         'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
				         'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
				         'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
				         'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
				         'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'code', 'pagebreak',
				         'link', 'unlink', '|', 'about'
				 ]
			});
		});
	</script>
</body>
</html>