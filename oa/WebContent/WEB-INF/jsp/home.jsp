<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
 <head>
  <title>OA系统</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="${pageContext.request.contextPath}/resource/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
   <link href="${pageContext.request.contextPath}/resource/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="${pageContext.request.contextPath}/resource/assets/css/main.css" rel="stylesheet" type="text/css" />
 </head>
 <body>
   <div class="header">
    <div class="dl-title"><span class="">OA系统</span></div>
    <div class="dl-log">欢迎您，<span class="dl-log-user">XXX</span>
        <a href="###" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
   </div>
   <div class="content">
    <div class="dl-main-nav">
      <ul id="J_Nav"  class="nav-list ks-clear">
       
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">
 
    </ul>
      
   </div>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resource/assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resource/assets/js/bui-min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resource/assets/js/config-min.js"></script>
  <script>
     BUI.use('common/main',function(){
      	$.getJSON('${pageContext.request.contextPath}/system/menu/menuAction_getMenu.action',function(json){
      		//json转化为对象
      		var array = eval(json);
      		var mainMenu = array[0];
      		//注意此处要把json字符串转为对象
      		var config = eval(array[1]);
      		//创建主菜单
      		var nav = $('#J_Nav');
      		for(var i=0;i<mainMenu.length;i++){
      			if(i==0){
      				nav.append('<li class="nav-item dl-selected"><div class="nav-item-inner nav-storage">'+mainMenu[i]+'</div></li>');
      			}else{
      				nav.append('<li class="nav-item"><div class="nav-item-inner nav-storage">'+mainMenu[i]+'</div></li>');
      			}
      		}
      		//创建子菜单
      		//主页显示
      		//config[0].menu[0].items[0].closeable = false;
      		//alert(JSON.stringify(config));
      		new PageUtil.MainPage({
      	        modulesConfig : config
      	      });
      		//alert(config);
      	});
    });
 
  </script>
 </body>
</html>