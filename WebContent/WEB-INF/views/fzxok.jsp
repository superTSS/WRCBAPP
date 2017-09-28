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
    <title>副中心机房总览图</title>
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
  		#zzx123:hover,#yd123:hover{
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
			
			var svg_obj_mc = document.getElementById("fzx");
			svg_obj_mc.setAttribute("width",winWidth);
			svg_obj_mc.setAttribute("height",winHeight*8.7/10);
			
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
	<!--梅村机房图-->
		<svg version="1.1" id="fzx" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			 viewBox="0 0 1024 643" enable-background="new 0 0 1024 643" xml:space="preserve">
			
			<!-- <rect x="2.58" y="14.607" fill="none" class="stroke_color" stroke-miterlimit="10" width="1020" height="80"/> -->
			<image xlink:href="img/wrcbfzx.png" x="0.58" y="25.607" height="60" width="800"/>
			
			<rect x="3.209" y="103.867" fill="none" class="stroke_color" stroke-miterlimit="10" width="83.612" height="440"/>
			<text transform="matrix(1 0 0 1 35.8237 258.9294)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">同</text>
			<text transform="matrix(1 0 0 1 35.8237 285.7292)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">城</text>
			<text transform="matrix(1 0 0 1 35.8237 310.7292)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">副</text>
			<text transform="matrix(1 0 0 1 35.8237 337.7292)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">中</text>
			<text transform="matrix(1 0 0 1 35.8237 364.5291)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">心</text>
			<text transform="matrix(1 0 0 1 35.8237 391.3289)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">机</text>
			<text transform="matrix(1 0 0 1 35.8237 418.1296)" fill="#ffffff" font-family="Microsoft YaHei" font-size="18">房</text>
			
			<rect x="87.821" y="103.867" fill="none" class="stroke_color" stroke-miterlimit="10" width="169.991" height="440"/>
			<text transform="matrix(1 0 0 1 146.8184 138.1116)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">空调间</text>
			<rect x="143.626" y="192.114" fill="none" class="stroke_color" stroke-miterlimit="10" width="60" height="80"/>
			<rect x="143.625" y="313.733" fill="none" class="stroke_color" stroke-miterlimit="10" width="60" height="80"/>
			<rect x="143.625" y="438.101" fill="none" class="stroke_color" stroke-miterlimit="10" width="60" height="80"/>
			
			
			<text transform="matrix(1 0 0 1 360.4351 138.1116)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">主机房(Z)</text>
			<rect x="256.813" y="103.867" fill="none" class="stroke_color" stroke-miterlimit="10" width="290.984" height="440"/>
			<rect id="Z04" data-modal="modal-1" x="470.606" y="240.244" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.777" height="60"/>
			<rect id="Z05" data-modal="modal-1" x="385.415" y="240.244" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.777" height="60"/>
			<rect id="Z06" data-modal="modal-1" x="300.117" y="240.244" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.777" height="60"/>
			<rect id="Z01" data-modal="modal-1" x="470.606" y="395.668" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.778" height="60"/>
			<rect id="Z02" data-modal="modal-1" x="385.415" y="395.668" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.777" height="60"/>
			<rect id="Z03" data-modal="modal-1" x="300.117" y="395.668" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.777" height="60"/>
			<text transform="matrix(1.0465 0 0 1 485.0049 477.9099)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">1</text>
			<text transform="matrix(1 0 0 1 403.3252 477.9099)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">2</text>
			<text transform="matrix(1 0 0 1 314.209 477.9099)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">3</text>
			<text transform="matrix(1 0 0 1 485.0049 322.1726)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">4</text>
			<text transform="matrix(1 0 0 1 403.3252 322.1726)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">5</text>
			<text transform="matrix(1 0 0 1 314.209 322.1726)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">6</text>
			
			
			<text transform="matrix(1 0 0 1 650.6582 138.1116)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">前置机房(Q)</text>
			<rect x="547.813" y="103.867" fill="none" class="stroke_color" stroke-miterlimit="10" width="290.984" height="440"/>
			<rect id="Q05" data-modal="modal-1" x="597.99" y="395.668" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.778" height="60"/>
			<rect id="Q04" data-modal="modal-1" x="637.769" y="395.668" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.778" height="60"/>
			<rect id="Q03" data-modal="modal-1" x="677.548" y="395.668" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.777" height="60"/>
			<rect id="Q02" data-modal="modal-1" x="717.325" y="395.668" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.778" height="60"/>
			<rect id="Q01" data-modal="modal-1" x="757.104" y="395.668" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.778" height="60"/>
			<rect id="Q10" data-modal="modal-1" x="596.99" y="240.244" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.778" height="60"/>
			<rect id="Q09" data-modal="modal-1" x="636.769" y="240.244" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.778" height="60"/>
			<rect id="Q08" data-modal="modal-1" x="676.548" y="240.244" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.777" height="60"/>
			<rect id="Q07" data-modal="modal-1" x="715.325" y="240.244" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.778" height="60"/>
			<rect id="Q06" data-modal="modal-1" x="755.104" y="240.244" fill="#7CFC00" class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="39.778" height="60"/>
			<text transform="matrix(1 0 0 1 772.1035 477.9099)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">1</text>
			<text transform="matrix(1 0 0 1 732.3262 477.9099)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">2</text>
			<text transform="matrix(1 0 0 1 694.6758 477.9099)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">3</text>
			<text transform="matrix(1 0 0 1 652.7695 477.9099)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">4</text>
			<text transform="matrix(1 0 0 1 611.9902 477.9099)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">5</text>
			<text transform="matrix(1 0 0 1 606.9922 322.1726)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">10</text>
			<text transform="matrix(1 0 0 1 651.7695 322.1726)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">9</text>
			<text transform="matrix(1 0 0 1 691.6758 322.1726)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">8</text>
			<text transform="matrix(1 0 0 1 732.3262 322.1726)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">7</text>
			<text transform="matrix(1 0 0 1 772.1035 322.1726)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">6</text>
			
			
			<text transform="matrix(1 0 0 1 880 138.1116)" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">网络机房(W)</text>
			<rect x="839.78" data-modal="modal-1" y="103.867" fill="none" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="182.99" height="440"/>
			<rect id="W08" data-modal="modal-1" x="911.387" y="187" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="39.777" height="40"/>
			<rect id="W07" data-modal="modal-1" x="911.387" y="227" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="39.777" height="40"/>
			<rect id="W06" data-modal="modal-1" x="911.387" y="267" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="39.777" height="40"/>
			<rect id="W05" data-modal="modal-1" x="911.387" y="307" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="39.777" height="40"/>
			<rect id="W04" data-modal="modal-1" x="911.387" y="347" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="39.777" height="40"/>
			<rect id="W03" data-modal="modal-1" x="911.387" y="387" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="39.777" height="40"/>
			<rect id="W02" data-modal="modal-1" x="911.387" y="427" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="39.777" height="40"/>
			<rect id="W01" data-modal="modal-1" x="911.387" y="467" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="39.777" height="40"/>
			<text transform="matrix(1 0 0 1 959.6074 492.0994)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">1</text>
			<text transform="matrix(1 0 0 1 959.6074 452.0994)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">2</text>
			<text transform="matrix(1 0 0 1 959.6074 412.0994)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">3</text>
			<text transform="matrix(1 0 0 1 959.6074 372.0994)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">4</text>
			<text transform="matrix(1 0 0 1 959.6074 332.6257)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">5</text>
			<text transform="matrix(1 0 0 1 959.6074 292.6062)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">6</text>
			<text transform="matrix(1 0 0 1 959.6074 252.6116)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">7</text>
			<text transform="matrix(1 0 0 1 959.6074 212.0989)" fill="#ffffff" font-family="Microsoft YaHei" font-size="15">8</text>
				
			<!-- 链接 -->
			<rect x="2.578" y="550.371" fill="#4C5662" class="stroke_color transformer1" stroke-miterlimit="10" width="509.957" height="36.031"/>
			<text transform="matrix(1 0 0 1 218.3779 574.3105)" fill="#ffffff" class="transformer1" font-family="Microsoft YaHei" font-size="16">生产中心机房</text>	
			<rect x="512.578" y="550.371" fill="#4C5662" class="stroke_color transformer2" stroke-miterlimit="10" width="509.957" height="36.031"/>	 
			<text transform="matrix(1 0 0 1 730.3779 574.3105)" fill="#ffffff" class="transformer2" font-family="Microsoft YaHei" font-size="16">异地机房</text> 
		</svg>		

	
	
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
			url : '<%=path%>/getAlert.do?location=fzx',
			type : 'get',
			dataType : 'json',
			success:function(result)
			{
   				var jg = "";  //Q48 14U
				var jg1= "";  //Q48
				var level = 0;
				for (var i = 0; i < result.length; i++) 
				{		
					if(result.length > 0){
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
  		window.location.href='ydok.do';
  	})
  </script>
	
    
  </body>
</html>