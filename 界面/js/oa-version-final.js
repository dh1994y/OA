

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
	//辅助参数
	var x = 1;
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
		
		
		//创建leftNavItemDom   
		var leftNavItemDom = $('<li id="'+lid+'"></li>');
		leftNavContainerDom.append(leftNavItemDom);
		var leftNavItemUlDom = $('<ul class="nav nav-pills nav-stacked"></ul>');
		leftNavItemDom.append(leftNavItemUlDom);
		for(var j=0;j<leftNavList[i].length;j++){
			//创建左侧导航子菜单项  需要包含创建右上navid did+rt+x 和 右下id did+rb+x 即需要定位到did
			var lnavid = lid+"lnav0"+(j+1);
			var leftNavItemUlLiDom = $('<li id="'+lnavid+'" flag="close" didMark="'+did+'" url="'+leftNavList[i][j].url+'"><a href="javascript:void(0);">'+leftNavList[i][j].name+'</a></li>');
			leftNavItemUlDom.append(leftNavItemUlLiDom);
			//创建子菜单项点击事件
			leftNavItemUlLiDom.click(function(){
				
				if($(this).attr("flag")=="open"){
					//alert(11);
					//定位
					//当前为活动其余非活动样式
					$(this).addClass("active").siblings().removeClass("active");
					$("#"+$(this).attr("drtidMark")).removeClass("myli-close").addClass("myli-active").siblings().removeClass("myli-active").addClass("myli-close");
					$("#"+$(this).attr("drbidMark")).removeClass("li-hidden").addClass("li-show").siblings().removeClass("li-show").addClass("li-hidden");
					return;
				}
				$(this).attr("flag","open");
				//当前项未被选中时生效
				if(!$(this).hasClass("active")){
					//当前为活动其余非活动样式
					$(this).addClass("active").siblings().removeClass("active");
					//创建右上id
					var drtid = $(this).attr("didMark")+"rt"+x;
					//创建左上id
					var drbid = $(this).attr("didMark")+"rb"+x;
					x++;//更新x保证id唯一
					if(x==100){
						x=1;
					}
					//创建右上标签
					//alert($(this).children(":first").text());
					var rtLabelDom = $('<li id="'+drtid+'" class="myli-active" drbidMark="'+drbid+'" lidMark="'+$(this).attr("id")+'"><a>'+$(this).children(":first").text()+'</a><img src="image/close.png"/></li>');
					$(this).attr("drtidMark",drtid).attr("drbidMark",drbid);
					//添加到容器
					$("#"+$(this).attr("didMark")).children(":first").children(":first").append(rtLabelDom);
					rtLabelDom.siblings().removeClass("myli-active").addClass("myli-close");
					//为右上标签添加点击事件
					rtLabelDom.children(":first").click(function(){
						//触发左导航点击事件
						//alert("添加"+$(this).parent().attr("lidMark"));
						$("#"+$(this).parent().attr("lidMark")).click();
					});
					//为右上标签close图标添加点击事件
					rtLabelDom.children(":last").click(function(){
						//alert("关闭");
						//若为当前选中项 移除时将左侧导航active移除
						var lnavItemDom = $("#"+$(this).parent().attr("lidMark"));
						lnavItemDom.attr("flag","close");
						if(lnavItemDom.hasClass("active")){
							//alert("移除样式");
							lnavItemDom.removeClass("active");
							//选中上一个标签
							//alert($(this).parent().next());
							if($(this).parent().next().length>0){
								$(this).parent().next().children(":first").click();
							}else if($(this).parent().prev().length>0){
								$(this).parent().prev().children(":first").click();
							}
						}
						//移除iframe 先移除iframe避免 移除导航条后找不到 this
						$("#"+$(this).parent().attr("drbidMark")).remove();
						//移除导航条
						$($(this).parent()).remove();	
					});
					
					
					//创建右下iframe
					var rbIframeDom = $('<li id="'+drbid+'" class="li-show"><iframe src="'+$(this).attr("url")+'"></iframe></li>');
					//添加到容器
					$("#"+$(this).attr("didMark")).children(":last").children(":first").append(rbIframeDom);
					rbIframeDom.siblings().removeClass("li-show").addClass("li-hidden");
					
				}
			});
		}
		
		//创建rightContentDom
		var rightContentDom = $('<li id="'+rid+'"><div id="'+did+'" class=".content-div">'+'<div id="page-middle-right-top"><ul id="page-middle-right-nav" ></ul></div><div id="page-middle-right-below"><ul id="page-middle-right-content"></ul></div>');
		rightContentContainerDom.append(rightContentDom);
	
		//创建完成自动点击第一项
		mainNavContainerDom.children(":first").click();
	}
}