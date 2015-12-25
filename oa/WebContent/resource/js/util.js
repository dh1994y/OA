function openWindowWithName(url,width,height,name) {
  var left=(screen.availWidth-width)/2;
  var top=(screen.availHeight-height)/2;
  var ref="";
  ref += "width="+width+"px,height="+height+"px,";
  ref += "left="+left+"px,top="+top+"px,";
  ref += "resizable=yes,scrollbars=yes,status=yes,toolbar=no,systemmenu=no,location=no,borderSize=thin";//channelmode,fullscreen
  var childWindow = window.open(url,name,ref,false);
  childWindow.focus();
}

function  openWindow(url,width,height){
  openWindowWithName(url,width,height,'newwindow');
}




//格式化日期函数
function formatDate(date ,pattern){
    if(!pattern){
	    pattern="yyyy-MM-dd";
    }
	var o = {
		'M+' : date.getMonth() + 1, //月份\n"
		'd+' : date.getDate(), //日 \n"
		'h+' : date.getHours(), //小时\n"
		'm+' : date.getMinutes(), //分 \n"
		's+' : date.getSeconds(), //秒 \n"
		'S' : date.getMilliseconds()
	};
	//替换填充年份
	if (/(y+)/.test(pattern)) {
		pattern = pattern.replace(RegExp.$1, (date.getFullYear() + '')
				.substr(4 - RegExp.$1.length));
	}
	//填充替换剩余的时间元素
	for ( var key in o){
		if (new RegExp('(' + key + ')').test(pattern)){
			pattern = pattern.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[key])
					: (('00' + o[key]).substr(('' + o[key]).length)));
		}
	}
	//返回格式化结果
    return pattern;	
}


//显示虚拟进度条函数
function showProgressBar(){
	
	
	//预定义的颜色
	var colors = ['red','blue','white','black'];
	
	//1 灰色的平铺层(div)
	
	var div1 = document.createElement("div");
	
	//让div铺满全屏
	div1.style.position = 'absolute'; //使用绝对定位
	div1.style.top = 0;
	div1.style.left = 0;
	div1.style.width = '100%';
	div1.style.height = '100%';
	
	div1.style['background-color'] = 'gray';//设置背景色
	div1.style.opacity = '0.3';//设置透明度
	document.body.appendChild(div1);//把div加入文档模型
	
	//2 前进的浮动层(进度条)
	//进度条div
	var div2 = document.createElement("div");
	
	div2.style.position = 'absolute'; //使用绝对定位
	div2.style.top = '40%';
	div2.style.left = '30%';
	div2.style.width = '40%';
	div2.style.height = '2%';
	
	div2.style['background-color'] = 'gray';
	
	document.body.appendChild(div2);//把div加入文档模型
	//3 进度条随时间的推移前进
	//4 进度条颜色的切换
	var div3 =document.createElement("div");
	div2.appendChild(div3);
	
	div3.style.width = '1%';
	div3.style.height = '100%';
	div3.style['background-color'] =colors[0];
	
	var percent = 1;
	var colorIndex = 1;
	
	//每隔100毫秒进度条推进1%
	setInterval(function(){
		div3.style.width = percent+'%';
		percent += 1;
		
		//当走到100%时,重新开始走,并且切换颜色
		if(percent==100){
			percent = 1;
			div3.style['background-color'] =colors[colorIndex];
			colorIndex++;
			if(colorIndex==colors.length){
				colorIndex=0;
			}
		}
	},100);
	
}
