<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 黑框：空调  红框：智能前头柜 -->
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8"> 
    <title>异地机房总览图</title>
    <!-- 包含头部信息用于适应不同设备 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../favicon.ico"> 
	<script type="text/javascript" src="js/jquery-1.12.0.js"></script>
    <link rel="stylesheet" type="text/css" href="js/ext/resources/css/ext-all.css" />
    <script type="text/javascript" src="js/ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="js/ext/ext-all.js"></script>
    <script src="js/alertInfo.js"></script>
	<style >
		.remove {
            background-image:url(img/delete.gif) !important;
        }
  		.ack{
  			 background-image:url(img/ack.png) !important;
  		}
  		.error{
  			 background-image:url(img/error.png) !important;
  		}
		.device{
  			 background-image:url(img/cog.png) !important;
  		}
  		#zzx123:hover,#fzx123:hover{ 
  			background-color:red;
  		}
  		a{
  			text-decoration:none;
  		}
  		.transformer1{
  			cursor:pointer;
  		}
  		.transformer2{
  			cursor:pointer;
  		}
	</style>
	<script>
		$(document).ready(function()
		{
			var winWidth;
			var winHeight;
			
			if(window.innerWidth)
				winWidth = window.innerWidth;
			else if((document.body) && document.body.clientWidth)
				winWidth= document.body.clientWidth;
			
			if(window.innerHeight)
				winHeight = window.innerHeight;
			else if((document.body) && document.body.clientHeight)
				winHeight= document.body.clientHeight;
			
			var svg_obj = document.getElementById("yd");
			svg_obj.setAttribute("width",winWidth);
			svg_obj.setAttribute("height",winHeight*8.7/10);
		})
	</script>
	<style>
		body{
			margin:0 0;
			padding:0 0;
			background-color:rgb(76,86,98);
		}
		
		.stroke_color{
			stroke:#5E8ADA; 
		}
		.tabsty{
			border:solid 1px #08D5C1;
		}
		.toPointer{
			cursor:pointer;
		}
	</style>
  </head>

  <body>	
	<!--异地机房图-->
		<svg version="1.1" id="yd" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			 viewBox="0 0 1024 643" enable-background="new 0 0 1024 643" xml:space="preserve">
			<!-- <rect x="2.58" y="14.607" fill="none" class="stroke_color" stroke-miterlimit="10" width="1020" height="80"/> -->
			<image xlink:href="img/wrcbyd.png" x="0.58" y="25.607" height="60" width="600"/>
			<rect x="3.109" y="103.867" fill="none" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="83.612" height="440"/>
			<text transform="matrix(1 0 0 1 32.8237 285.7292)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">异</text>
			<text transform="matrix(1 0 0 1 32.8237 310.7292)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">地</text>
			<text transform="matrix(1 0 0 1 32.8237 337.7292)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">机</text>
			<text transform="matrix(1 0 0 1 32.8237 364.5291)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">房</text>
			<rect   x="87.821" y="103.867" fill="#4C5662" class="stroke_color md-trigger" stroke-miterlimit="10" width="425" height="440"/>
			<text transform="matrix(1 0 0 1 273.8184 131.1116)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">机柜Y1</text>
			<rect  id="Y011" x="120" y="172" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="80" height="60"/>
			<rect id="Y012" x="120" y="293" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="80" height="60"/>
			<rect  id="Y013" x="120" y="414" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="80" height="60"/>
			<text transform="matrix(1 0 0 1 142 252)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">30U</text>
			<text transform="matrix(1 0 0 1 142 371)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">36U</text>
			<text transform="matrix(1 0 0 1 142 493)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">42U</text>
			<rect id="Y014" x="260" y="172" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="80" height="60"/>
			<rect id="Y015" x="260" y="293" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="80" height="60"/>
			<text transform="matrix(1 0 0 1 282 252)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">32U</text>
			<text transform="matrix(1 0 0 1 282 371)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">38U</text>
			<rect id="Y016" x="405" y="172" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="80" height="60"/>
			<rect id="Y017" x="405" y="293" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="80" height="60"/>
			<text transform="matrix(1 0 0 1 427 252)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">34U</text>
			<text transform="matrix(1 0 0 1 427 371)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">40U</text>
			
			
			<rect x="512.813" y="103.867" fill="#4C5662" class="stroke_color md-trigger" stroke-miterlimit="10" width="510" height="440"/>
			<text transform="matrix(1 0 0 1 745.6582 132.1116)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">机柜Y2</text>
			<rect  id="Y021" x="587" y="370" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="80" height="60"/>
			<rect id="Y022" x="587" y="200" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="80" height="60"/>
			<text transform="matrix(1 0 0 1 608 280)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">4-8U</text>
			<text transform="matrix(1 0 0 1 600 451)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">15-18U</text>
			<rect id="Y023" x="735" y="370" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="80" height="60"/>
			<rect id="Y024" x="735" y="200" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="80" height="60"/>
			<text transform="matrix(1 0 0 1 748 280)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">11-12U</text>
			<text transform="matrix(1 0 0 1 748 451)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">19-20U</text>
			<rect id="Y025" x="875" y="370" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="80" height="60"/>
			<rect id="Y026" x="875" y="200" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="80" height="60"/>
			<text transform="matrix(1 0 0 1 888 280)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">13-14U</text>
			<text transform="matrix(1 0 0 1 900 451)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">42U</text>
		
			<!-- 链接 -->
			<rect x="2.578" y="550.371" fill="#4C5662" class="stroke_color transformer1" stroke-miterlimit="10" width="509.957" height="36.031"/>
			<text transform="matrix(1 0 0 1 218.3779 574.3105)" fill="#ffffff" class="transformer1" font-family="Microsoft YaHei" font-size="16">生产中心机房</text>	
			<rect x="512.578" y="550.371" fill="#4C5662" class="stroke_color transformer2" stroke-miterlimit="10" width="509.957" height="36.031"/>	 
			<text transform="matrix(1 0 0 1 730.3779 574.3105)" fill="#ffffff" class="transformer2" font-family="Microsoft YaHei" font-size="16">副中心机房</text> 
		</svg>		
  </body>
 <div id="hello-win" class="x-hidden">
    <div class="x-window-header">告警详细信息</div>
</div>
<div id="dev-win" class="x-hidden">
    <div class="x-window-header">设备详细信息</div>
</div>
    <script type="text/javascript">
	//setInterval('getAlert()',3000);
	function getAlert(){
		$.ajax({
			url : '<%=path%>/getAlert.do?location=yd',
			type : 'get',
			dataType : 'json',
			success:function(result)
			{
   				var jg = "";  //Q48 14U
				if(result.length > 0){
					for (var i = 0; i < result.length; i++) 
					{		
						jg = result[i].devLocation;
						switch(result[i].severity){
						case 3:
							fill_color = "#FF0900";	
							break;
						case 4:
							fill_color = "#FF0900";
							break;
						case 5: 
							fill_color = "#FF0900";
							break;
						default:
							fill_color = "#7CFC00";	
						}
						if($("#"+jg)!=null){
							$("#"+jg).css("fill",fill_color);
						}else if($("#"+jg)==null){
						}
					}
				}
					
			}
   	 	});
	};	

  </script>
  
   <!-- 跳转页面 -->
  <script type="text/javascript">
   
  	$(".transformer1").click(function(){
  		window.location.href='zzxok.do';
  	})
  	$(".transformer2").click(function(){
  		window.location.href='fzxok.do';
  	})
  </script>
</html>