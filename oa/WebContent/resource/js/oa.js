

/* 创建菜单栏 

	config要求传入格式：
		var config = {
			mainNavList : ['我的面板','工作流程管理'],
			leftNavList : [ 
				[
					{name:"代办事宜",url:"123.jsp"},{name:"个人信息维护",url:"234.jsp"}
				],
				[
					{name:"修改密码",url:"index.jsp"}
				]
			]
		}
*/


function createMenu(config){
	//解析config参数
	var mainNavList = config.mainNavList;//一维数组 name
	var mainNavCount = mainNavList.length;//主菜单数目
	var leftNavList = config.leftNavList;//leftNavItem leftNavItem[0] name url
	
	//获取dom元素
	var mainNavContainerDom = $("#main-nav");
	var leftNavContainerDom = $("#page-middle-left-nav");
	var rightContentContainerDom = $("#page-middle-right-content");
	
	//开始构建菜单
	for(var i=0;i<mainNavCount;i++){
		//构建相关id
		var mid = "m0"+(i+1);
		var lid = "l0"+(i+1);
		var rid = "r0"+(i+1);
		var did = "d0"+(i+1);
		var fid = "f0"+(i+1);
		
		//创建mainNavItemDom   主菜单能够定位到 左侧 右侧 模块
		var mainNavItemDom = $('<li id="'+mid+'" leftMark="'+lid+'" rightMark="'+rid+'"><a href="javascript:void(0);">'+mainNavList[i]+'</a></li>');
		mainNavContainerDom.append(mainNavItemDom);
		//为主菜单项添加点击事件
		mainNavItemDom.click(function(){
			//当前添加活动样式 其余移除活动样式
			$(this).addClass("active").siblings().removeClass("active");
			//切换左侧导航栏
			var leftNavId = $(this).attr("leftMark");
			$('#'+leftNavId).addClass("li-show").remove('li-hidden').siblings().removeClass("li-show").addClass("li-hidden");
			//切换时自动点击左侧第一选项卡
			var leftNavliArr = $('#'+leftNavId).children(":first").children();
			//alert(leftNavliArr.size());
			//判断当左侧没有选中项时自动选择第一项
			//注意dom元素对象长度要用size() 不能用length
			for(var k=0;k<leftNavliArr.size();k++){			
				var item = leftNavliArr.get(k);
				if($(item).hasClass("active")){
					break;
				}
				if(k==leftNavliArr.size()-1){
					$('#'+leftNavId).children(":first").children(":first").click();
				}
			}
			//切换右侧内容区
			var rightContentId = $(this).attr("rightMark");
			$('#'+rightContentId).addClass("li-show").remove('li-hidden').siblings().removeClass("li-show").addClass("li-hidden");
		});
		
		
		//创建leftNavItemDom   左侧需要定位到 iframe 模块
		var leftNavItemDom = $('<li id="'+lid+'" iframeMark="'+fid+'"></li>');
		leftNavContainerDom.append(leftNavItemDom);
		var leftNavItemUlDom = $('<ul class="nav nav-pills nav-stacked"></ul>');
		leftNavItemDom.append(leftNavItemUlDom);
		for(var j=0;j<leftNavList[i].length;j++){
			//创建左侧导航子菜单项
			var leftNavItemUlLiDom = $('<li url="'+leftNavList[i][j].url+'"><a href="javascript:void(0);">'+leftNavList[i][j].name+'</a></li>');
			leftNavItemUlDom.append(leftNavItemUlLiDom);
			//创建子菜单项点击事件
			leftNavItemUlLiDom.click(function(){
				//当前项未被选中时生效
				if(!$(this).hasClass("active")){
					//当前为活动其余非活动样式
					$(this).addClass("active").siblings().removeClass("active");
					//获取iframe跳转url
					var url = $(this).attr("url");
					//获取对应iframe id
					var iframeId = $(this).parent().parent().attr("iframeMark");
					//设置url
					$("#"+iframeId).attr("src",url);
				}
			});
		}
		
		
		//创建rightContentDom
		var rightContentDom = $('<li id="'+rid+'"><div id="'+did+'" class=".content-div"><iframe id="'+fid+'" src="#"></iframe></div></li>');
		rightContentContainerDom.append(rightContentDom);
	
		//创建完成自动点击第一项
		mainNavContainerDom.children(":first").click();
	}
}