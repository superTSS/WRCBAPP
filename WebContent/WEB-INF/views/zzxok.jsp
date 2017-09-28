<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- ##4C5662  转换为 #7CFC00-->
<!-- 黑框：空调  红框：智能前头柜 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>生产中心机房总览图</title>
<!-- 包含头部信息用于适应不同设备 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="../favicon.ico">
<script type="text/javascript" src="js/jquery-1.12.0.js"></script>
<link rel="stylesheet" type="text/css" href="js/ext/resources/css/ext-all.css" />
<script type="text/javascript" src="js/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="js/ext/ext-all.js"></script>
<script src="js/alertInfo.js"></script>
<style>
.remove {
	background-image: url(img/delete.gif) !important;
}

.ack {
	background-image: url(img/ack.png) !important;
}

.error {
	background-image: url(img/error.png) !important;
}

.device {
	background-image: url(img/cog.png) !important;
}

#fzx123:hover, #yd123:hover {
	background-color: red;
}

a {
	text-decoration: none;
}

.transformer1 {
	cursor: pointer;
}

.transformer2 {
	cursor: pointer;
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
			
			var svg_obj = document.getElementById("zzx");
			svg_obj.setAttribute("width",winWidth);
			svg_obj.setAttribute("height",winHeight*9.9/10);			
		})
	</script>
<style>
body {
	margin: 0 0;
	padding: 0 0;
	background-color: rgb(76, 86, 98);
}

.stroke_color {
	stroke: #5E8ADA;
}

.tabsty {
	border: solid 1px #08D5C1;
}

.toPointer {
	cursor: pointer;
}
</style>
</head>

<body>

	<!-- 主中心机房 -->
	<svg version="1.1" id="zzx" xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1024 768"
		enable-background="new 0 0 1024 768" xml:space="preserve">
		<!-- logo和说明 -->
<!-- 		<rect x="2.58" y="14.607" fill="none" class="stroke_color" stroke-miterlimit="10" width="1020" height="80"/> -->
		<image xlink:href="img/wrcbzxx.png" x="0.58" y="25.607" height="60" width="600" />
		<!-- <text transform="matrix(1 0 0 1 80.3779 53.3105)" fill="#ffffff" font-family="Microsoft YaHei" font-size="25">无锡农村商业银行</text>
		<text transform="matrix(1 0 0 1 80.3779 75.3105)" fill="#ffffff" font-family="Microsoft YaHei" font-size="12">WUXI RURAL COMMERCIAL BANK</text>
		<text transform="matrix(1 0 0 1 400.3779 53.3105)" fill="#ffffff" font-family="Microsoft YaHei" font-size="25">生产中心机房告警视图</text> -->
		
		<!-- 备用机房空调间 -->
		<rect x="2.58" y="94.607" fill="none" class="stroke_color" stroke-miterlimit="10" width="54.287"
			height="215" />
		<text transform="matrix(1 0 0 1 20.186 55.1455)">
			<tspan x="0" y="100" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">备</tspan>
			<tspan x="0" y="119.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">用</tspan>
			<tspan x="0" y="138.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">机</tspan>
			<tspan x="0" y="157.6" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">房</tspan>
			<tspan x="0" y="176.8" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">空</tspan>
			<tspan x="0" y="196" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">调</tspan>
			<tspan x="0" y="215.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">间</tspan>
		</text>
		
		
		<!-- 备用机房（B） -->
		<rect x="57.465" y="94.607" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="176.325" height="215" />
		<text transform="matrix(1 0 0 1 210.3315 168.729)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">备</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">用</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">机</tspan>
			<tspan x="0" y="57.6" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">房</tspan>
			<tspan x="-2" y="77.6" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">(B)</tspan>
		</text>
		<rect id="B12" data-modal="modal-1" x="175.503" y="117.347" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.917" height="23.276" />
		<rect id="B13" data-modal="modal-1" x="155.585" y="117.347" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.918" height="23.276" />
		<rect id="B14" data-modal="modal-1" x="135.669" y="117.347" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.916" height="23.276" />
		<rect id="B15" data-modal="modal-1" x="115.751" y="117.347" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.917" height="23.276" />
		<rect id="B16" data-modal="modal-1" x="95.835" y="117.347" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.916" height="23.276" />
		<rect id="B17" data-modal="modal-1" x="75.918" y="117.347" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.917" height="23.276" />
		<text transform="matrix(1.1001 0 0 1 176.5039 155.4043)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">12</text>
		<text transform="matrix(1.1001 0 0 1 155.5859 155.4043)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">13</text>
		<text transform="matrix(1.1001 0 0 1 135.6689 155.4043)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">14</text>
		<text transform="matrix(1.1001 0 0 1 115.752 155.4043)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">15</text>
		<text transform="matrix(1.1001 0 0 1 95.8359 155.4043)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">16</text>
		<text transform="matrix(1.1001 0 0 1 75.918 155.4043)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">17</text>	
		<rect x="75.918" y="183.492" fill="#8B8B83" class="stroke_color" stroke-miterlimit="10"
			width="19.917" height="23.273" />
		<rect id="B11" data-modal="modal-1" x="95.835" y="183.492" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.916" height="23.273" />
		<rect id="B10" data-modal="modal-1" x="115.751" y="183.492" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.917" height="23.273" />
		<rect id="B09" data-modal="modal-1" x="135.669" y="183.492" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.916" height="23.273" />
		<rect id="B08" data-modal="modal-1" x="155.585" y="183.492" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.918" height="23.273" />
		<rect id="B07" data-modal="modal-1" x="175.503" y="183.492" fill="#8B8B83"
			class="stroke_color md-trigger " stroke-miterlimit="10" width="19.917" height="23.273" />
		<text transform="matrix(1.1001 0 0 1 93.834 223.2725)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">11</text>
		<text transform="matrix(1.1001 0 0 1 116.5449 223.2725)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">10</text>
		<text transform="matrix(1.1001 0 0 1 141.4111 223.2715)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">9</text>
		<text transform="matrix(1.1001 0 0 1 161.2773 223.2725)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">8</text>
		<text transform="matrix(1.1001 0 0 1 181.1943 223.2705)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">7</text>
		<rect id="B06" x="75.918" y="248.237" fill="#8B8B83" class="stroke_color md-trigger"
			stroke-miterlimit="10" width="19.917" height="23.273" />
		<rect id="B05" x="95.835" y="248.237" fill="#8B8B83" class="stroke_color md-trigger"
			stroke-miterlimit="10" width="19.916" height="23.273" />
		<rect id="B04" x="115.751" y="248.237" fill="#8B8B83" class="stroke_color md-trigger"
			stroke-miterlimit="10" width="19.917" height="23.273" />
		<rect id="B03" x="135.669" y="248.237" fill="#8B8B83" class="stroke_color md-trigger"
			stroke-miterlimit="10" width="19.916" height="23.273" />
		<rect id="B02" x="155.585" y="248.237" fill="#8B8B83" class="stroke_color md-trigger"
			stroke-miterlimit="10" width="19.918" height="23.273" />
		<rect id="B01" x="175.503" y="248.237" fill="#8B8B83" class="stroke_color md-trigger"
			stroke-miterlimit="10" width="19.917" height="23.273" />
		<text transform="matrix(1.1001 0 0 1 80.6602 287.5859)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">6</text>
		<text transform="matrix(1.1001 0 0 1 100.5762 287.585)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">5</text>
		<text transform="matrix(1.1001 0 0 1 119.5469 287.5869)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">4</text>
		<text transform="matrix(1.1001 0 0 1 140.4111 287.5859)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">3</text>
		<text transform="matrix(1.1001 0 0 1 161.2773 287.5859)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">2</text>
		<text transform="matrix(1.1001 0 0 1 181.1943 287.5859)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">1</text>
		
		
		<!-- 休息室 -->
		<rect x="233.791" y="94.607" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="64.078" height="78.886" />
		<text transform="matrix(1 0 0 1 241 140)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="16">休息室</text>
		<text transform="matrix(1 0 0 1 241 255)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="16">备件库</text>
		<line fill="none" class="stroke_color" stroke-miterlimit="10" x1="233.791" y1="309.5" x2="297.87"
			y2="309.5" />
		
		
		<!-- 监控中心 -->
		<text transform="matrix(1 0 0 1 320.8833 278)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="16">监控中心</text>
		<rect x="297.87" y="94.607" fill="none" class="stroke_color" stroke-miterlimit="10" width="110"
			height="215" />
		<rect x="319.969" y="177.382" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="15.714" height="19.504" />
		<rect x="319.969" y="157.879" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="15.714" height="19.504" />
		<rect x="319.969" y="196.886" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="15.714" height="19.505" />
		<rect x="319.969" y="217.016" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="15.714" height="19.504" />
		<rect x="359.854" y="157.879" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="15.712" height="19.504" />
		<rect x="359.854" y="177.382" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="15.712" height="19.504" />
		<rect x="359.854" y="196.886" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="15.712" height="19.505" />
		<rect x="359.854" y="217.016" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="15.712" height="19.504" />
		<text transform="matrix(1.2692 0 0 1 365 119.6577)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="10.3456">J1</text>
		<text transform="matrix(1.2692 0 0 1 365 108.5347)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="10.3456">J2</text>
		<rect x="380" y="99.981" fill="none" class="stroke_color" stroke-miterlimit="10" width="18.587"
			height="10.933" />
		<rect x="380" y="111.122" fill="none" class="stroke_color" stroke-miterlimit="10" width="18.587"
			height="10.932" />
		<rect x="380" y="122.41" fill="none" class="stroke_color" stroke-miterlimit="10" width="18.587"
			height="10.937" />
		
		
		<!-- 前置机房 -->
		<rect x="408" y="94.607" fill="none" class="stroke_color" stroke-miterlimit="10" width="490"
			height="215" />	
		<text transform="matrix(1 0 0 1 590 297.9106)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="20">前置机房(Q)</text>							
		<rect name="Q" id="Q18" data-modal="modal-1" x="417.646" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<rect id="Q17" data-modal="modal-1" x="442.002" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.356" height="15.239" />
		<rect id="Q16" data-modal="modal-1" x="466.359" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.356" height="15.239" />
		<rect id="Q15" data-modal="modal-1" x="490.718" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<rect id="Q14" data-modal="modal-1" x="515.075" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.239" />
		<rect id="Q13" data-modal="modal-1" x="539.431" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.239" />
		<rect id="Q12" data-modal="modal-1" x="563.786" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.239" />
		<rect id="Q11" data-modal="modal-1" x="588.146" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.239" />
		<text transform="matrix(1.2692 0 0 1 421.1816 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">18</text>
		<text transform="matrix(1.2692 0 0 1 445.5391 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">17</text>
		<text transform="matrix(1.2692 0 0 1 469.6191 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">16</text>
		<text transform="matrix(1.2692 0 0 1 493.4688 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">15</text>
		<text transform="matrix(1.2692 0 0 1 518.6113 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">14</text>
		<text transform="matrix(1.2692 0 0 1 542.9668 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">13</text>
		<text transform="matrix(1.2692 0 0 1 566.1094 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">12</text>
		<text transform="matrix(1.2692 0 0 1 591.6816 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">11</text>		
		<rect id="Q36" data-modal="modal-1" x="417.646" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.239" />
		<rect id="Q35" data-modal="modal-1" x="442.002" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<rect id="Q34" data-modal="modal-1" x="466.359" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.359" height="15.239" />
		<rect id="Q33" data-modal="modal-1" x="490.718" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<rect id="Q32" data-modal="modal-1" x="515.075" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.239" />
		<rect id="Q31" data-modal="modal-1" x="539.431" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.239" />
		<rect id="Q30" data-modal="modal-1" x="563.786" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.239" />
		<rect id="Q29" data-modal="modal-1" x="588.146" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<text transform="matrix(1.2692 0 0 1 421.1816 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">36</text>
		<text transform="matrix(1.2692 0 0 1 445.5391 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">35</text>
		<text transform="matrix(1.2692 0 0 1 469.6191 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">34</text>
		<text transform="matrix(1.2692 0 0 1 493.4688 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">33</text>
		<text transform="matrix(1.2692 0 0 1 518.6113 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">32</text>
		<text transform="matrix(1.2692 0 0 1 542.9668 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">31</text>
		<text transform="matrix(1.2692 0 0 1 566.1094 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">30</text>
		<text transform="matrix(1.2692 0 0 1 591.6816 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">29</text>		
		<rect id="Q43" data-modal="modal-1" x="539.431" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Q44" data-modal="modal-1" x="515.075" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.238" />
		<rect id="Q45" data-modal="modal-1" x="490.718" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		<rect id="Q46" data-modal="modal-1" x="466.359" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		<rect id="Q47" data-modal="modal-1" x="442.002" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Q48" data-modal="modal-1" x="417.646" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.359" height="15.238" />
		<text transform="matrix(1.2692 0 0 1 542.9668 148.0483)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">43</text>
		<text transform="matrix(1.2692 0 0 1 518.6113 148.0483)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">44</text>
		<text transform="matrix(1.2692 0 0 1 493.4688 148.0483)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">45</text>
		<text transform="matrix(1.2692 0 0 1 469.6191 148.0483)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">46</text>
		<text transform="matrix(1.2692 0 0 1 445.5391 148.0483)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">47</text>
		<text transform="matrix(1.2692 0 0 1 421.1816 148.0493)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">48</text>
		<rect id="Q10" data-modal="modal-1" x="647.466" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.24" />
		<rect id="Q09" data-modal="modal-1" x="671.821" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="Q08" data-modal="modal-1" x="696.179" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.24" />
		<rect id="Q07" data-modal="modal-1" x="720.534" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="Q06" data-modal="modal-1" x="744.892" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="Q05" data-modal="modal-1" x="769.249" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect id="Q04" data-modal="modal-1" x="793.607" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.24" />
		<rect id="Q03" data-modal="modal-1" x="817.963" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="Q02" data-modal="modal-1" x="842.32" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect id="Q01" data-modal="modal-1" x="866.679" y="238.589" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.354" height="15.24" />
		<text transform="matrix(1.2692 0 0 1 649 269.0967)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">10</text>
		<text transform="matrix(1.2692 0 0 1 678.501 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">9</text>
		<text transform="matrix(1.2692 0 0 1 702.0723 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">8</text>
		<text transform="matrix(1.2692 0 0 1 726.8564 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">7</text>
		<text transform="matrix(1.2692 0 0 1 751.5693 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">6</text>
		<text transform="matrix(1.2692 0 0 1 775.9277 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">5</text>
		<text transform="matrix(1.2692 0 0 1 799.4971 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">4</text>
		<text transform="matrix(1.2692 0 0 1 824.6406 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">3</text>
		<text transform="matrix(1.2692 0 0 1 848.2129 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">2</text>
		<text transform="matrix(1.2692 0 0 1 873.3545 269.0967)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">1</text>		
		<rect id="Q19" data-modal="modal-1" x="863.143" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.354" height="15.24" />
		<rect id="Q20" data-modal="modal-1" x="838.784" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.239" />
		<rect id="Q21" data-modal="modal-1" x="814.427" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<rect id="Q22" data-modal="modal-1" x="790.071" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.239" />
		<rect id="Q23" data-modal="modal-1" x="765.713" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.239" />
		<rect id="Q24" data-modal="modal-1" x="741.355" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<rect id="Q25" data-modal="modal-1" x="716.998" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<rect id="Q26" data-modal="modal-1" x="692.643" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.239" />
		<rect id="Q27" data-modal="modal-1" x="668.285" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<rect id="Q28" data-modal="modal-1" x="643.93" y="180.269" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.239" />		
		<text transform="matrix(1.2692 0 0 1 865.8887 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">19</text>
		<text transform="matrix(1.2692 0 0 1 841.5303 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">20</text>
		<text transform="matrix(1.2692 0 0 1 817.9619 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">21</text>
		<text transform="matrix(1.2692 0 0 1 792.0713 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">22</text>
		<text transform="matrix(1.2692 0 0 1 768.4639 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">23</text>
		<text transform="matrix(1.2692 0 0 1 743.8906 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">24</text>
		<text transform="matrix(1.2692 0 0 1 719.3203 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">25</text>
		<text transform="matrix(1.2692 0 0 1 693.3936 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">26</text>
		<text transform="matrix(1.2692 0 0 1 669.8232 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">27</text>
		<text transform="matrix(1.2692 0 0 1 645.4668 209.272)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">28</text>
		<rect id="Q37" data-modal="modal-1" x="765.713" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.239" />
		<rect id="Q38" data-modal="modal-1" x="741.355" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Q39" data-modal="modal-1" x="716.998" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.238" />
		<rect id="Q40" data-modal="modal-1" x="692.643" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		<rect id="Q41" data-modal="modal-1" x="668.285" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Q42" data-modal="modal-1" x="643.93" y="118.97" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<text transform="matrix(1.2692 0 0 1 768.4639 148.0493)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">37</text>
		<text transform="matrix(1.2692 0 0 1 743.8906 148.0493)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">38</text>
		<text transform="matrix(1.2692 0 0 1 719.3203 148.0493)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">39</text>
		<text transform="matrix(1.2692 0 0 1 693.3936 148.0493)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">40</text>
		<text transform="matrix(1.2692 0 0 1 669.8232 148.0493)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">41</text>
		<text transform="matrix(1.2692 0 0 1 645.4668 148.0493)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="13">42</text>
		
		
		<!-- 运营商机房 -->
		<rect x="897" y="94.607" fill="none" class="stroke_color" stroke-miterlimit="10" width="75"
			height="215" />
		<text transform="matrix(1 0 0 1 905 158)">
			<tspan x="0" y="-2" fill="#ffffff" font-family="Microsoft YaHei" font-size="20">运</tspan>
			<tspan x="0" y="21.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="20">营</tspan>
			<tspan x="0" y="40.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="20">商</tspan>
			<tspan x="0" y="59.6" fill="#ffffff" font-family="Microsoft YaHei" font-size="20">机</tspan>
			<tspan x="0" y="78.8" fill="#ffffff" font-family="Microsoft YaHei" font-size="20">房</tspan>
			<tspan x="0" y="98.8" fill="#ffffff" font-family="Microsoft YaHei" font-size="20">(J)</tspan>
		</text>
		<rect id="J07" data-modal="modal-1" x="928.208" y="120.065" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="13.053" />
		<rect id="J06" data-modal="modal-1" x="928.208" y="185.873" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.239" />
		<rect id="J05" data-modal="modal-1" x="928.208" y="201.109" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect id="J04" data-modal="modal-1" x="928.208" y="216.35" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.239" />
		<rect id="J03" data-modal="modal-1" x="928.208" y="231.588" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect id="J02" data-modal="modal-1" x="928.208" y="246.829" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="13.048" />
		<rect id="J01" data-modal="modal-1" x="928.208" y="260.25" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="13.048" />
		<text transform="matrix(1.2692 0 0 1 959.2441 129.6577)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="12">7</text>
		<text transform="matrix(1.2692 0 0 1 959.2441 196.6382)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="12">6</text>
		<text transform="matrix(1.2692 0 0 1 959.2441 212.8901)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="12">5</text>
		<text transform="matrix(1.2692 0 0 1 959.2441 226.52)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="12">4</text>
		<text transform="matrix(1.2692 0 0 1 959.2441 242.4399)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="12">3</text>
		<text transform="matrix(1.2692 0 0 1 959.2441 256.1177)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="12">2</text>
		<text transform="matrix(1.2692 0 0 1 959.2441 271.5151)" fill="#ffffff"
			font-family="Microsoft YaHei" font-size="12">1</text>
		
		
		<!-- 机房空调间1 -->
		<rect x="973" y="94.607" fill="none" class="stroke_color" stroke-miterlimit="10" width="48"
			height="215" />
		<text transform="matrix(1 0 0 1 988 170.1123)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">机</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">房</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">空</tspan>
			<tspan x="0" y="57.6" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">调</tspan>
			<tspan x="0" y="76.8" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">间</tspan>
			<tspan x="0" y="96" fill="#ffffff" font-family="Microsoft YaHei" font-size="16"> 1</tspan>
		</text>
		
		
		<!-- 空调室外机2 -->
		<rect x="2.58" y="333.755" fill="none" class="stroke_color" stroke-miterlimit="10" width="83.069"
			height="125" />
		<text transform="matrix(1 0 0 1 35.186 355)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">空</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">调</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">室</tspan>
			<tspan x="0" y="57.6" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">外</tspan>
			<tspan x="0" y="76.8" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">机</tspan>
			<tspan x="0" y="96" fill="#ffffff" font-family="Microsoft YaHei" font-size="16"> 2</tspan>
		</text>
		
		
		<!-- 钢瓶间 -->
		<rect x="85.645" y="333.755" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="83.069" height="125" />
		<text transform="matrix(1 0 0 1 120 380)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">钢</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">瓶</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">间</tspan>
		</text>
		
		
		<!-- 空调管井 -->
		<rect x="235.42" y="332.486" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="77.081" height="125" />
		<text transform="matrix(1 0 0 1 265 370)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">空</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">调</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">管</tspan>
			<tspan x="0" y="57.6" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">井</tspan>
		</text>
		
		
		<!-- 男厕 -->
		<rect x="369.544" y="332.486" fill="none" class="stroke_color" stroke-miterlimit="10" width="80"
			height="125" />
		<text transform="matrix(1 0 0 1 400 380)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">弱</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">电</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">间</tspan>
		</text>
		
		
		<!-- 女厕 -->
		<rect x="499.204" y="332.486" fill="none" class="stroke_color" stroke-miterlimit="10" width="80"
			height="125" />		
		<text transform="matrix(1 0 0 1 530 380)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">弱</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">电</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">间</tspan>
		</text>
		
		
		<!-- 水管井 -->
		<rect x="623.431" y="332.486" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="77.082" height="125" />	
		<text transform="matrix(1 0 0 1 650 380)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">水</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">管</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">井</tspan>
		</text>
		
		
		<!-- 动力室 -->
		<rect x="729.534" y="332.887" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="242.995" height="172" />
		<text transform="matrix(1 0 0 1 938.2422 400.6895)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">动</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">力</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">室</tspan>
		</text>
		<rect x="737.713" y="340.429" fill="none" class="stroke_color" stroke-miterlimit="10" width="39"
			height="21.878" />
		<rect x="737.713" y="365.706" fill="none" class="stroke_color" stroke-miterlimit="10" width="39"
			height="21.877" />
		<rect x="737.713" y="392.232" fill="none" class="stroke_color" stroke-miterlimit="10" width="39"
			height="21.878" />
		<rect x="737.713" y="418.221" fill="none" class="stroke_color" stroke-miterlimit="10" width="39"
			height="21.88" />
		<rect x="737.713" y="444.826" fill="none" class="stroke_color" stroke-miterlimit="10" width="39"
			height="21.878" />
		<rect x="737.713" y="471.156" fill="none" class="stroke_color" stroke-miterlimit="10" width="39"
			height="21.878" />
		<text transform="matrix(1 0 0 1 740.4619 356.7422)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">UPS1</text>
		<text transform="matrix(1 0 0 1 740.4619 382.0571)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">UPS2</text>
		<text transform="matrix(1 0 0 1 740.4619 407.2017)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">UPS3</text>
		<text transform="matrix(1 0 0 1 740.4619 432.5757)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">UPS4</text>
		<text transform="matrix(1 0 0 1 740.4619 459.9277)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">UPS5</text>
		<text transform="matrix(1 0 0 1 740.4619 487.7813)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">UPS6</text>
		<rect x="800.678" y="356.738" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="35.034" height="115.35" />
		<text transform="matrix(1 0 0 1 810.2422 400.6895)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">电</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">池</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">组</tspan>
		</text>
		<rect x="850.678" y="356.738" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="35.034" height="115.35" />
		<text transform="matrix(1 0 0 1 860.2422 400.6895)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">电</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">池</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">组</tspan>
		</text>
		<rect x="899.227" y="383.318" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="30.035" height="63.351" />
		<text transform="matrix(1 0 0 1 906.2422 400.6895)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">电</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">池</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">组</tspan>
		</text>
		
		
		<!-- 空调室外机1 -->
		<rect x="973.529" y="332.887" fill="none" class="stroke_color" stroke-miterlimit="10" width="48"
			height="172" />
		<text transform="matrix(1 0 0 1 988 370.9058)">
			<tspan x="0" y="0" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">空</tspan>
			<tspan x="0" y="19.2" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">调</tspan>
			<tspan x="0" y="38.4" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">室</tspan>
			<tspan x="0" y="57.6" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">外</tspan>
			<tspan x="0" y="76.799" fill="#ffffff" font-family="Microsoft YaHei" font-size="16">机</tspan>
			<tspan x="0" y="96" fill="#ffffff" font-family="Microsoft YaHei" font-size="16"> 1</tspan>
		</text>
		
		
		<!-- 省联社灾备 -->
		<rect x="2.58" y="459.32" fill="none" class="stroke_color" stroke-miterlimit="10" width="166.138"
			height="45.482" />
		<text transform="matrix(1 0 0 1 114.4053 475.3496)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="15">省联社</text>
		<text transform="matrix(1 0 0 1 114.4053 494.2959)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="15">  灾备</text>
		<rect x="52.131" y="467.639" fill="#7CFC00" class="stroke_color" stroke-miterlimit="10"
			width="25.143" height="15.424" />
		<rect x="52.131" y="483.877" fill="#7CFC00" class="stroke_color" stroke-miterlimit="10"
			width="25.143" height="15.42" />
		<rect x="84.81" y="467.639" fill="#7CFC00" class="stroke_color" stroke-miterlimit="10" width="25.142"
			height="15.424" />
		<rect x="11.581" y="483.877" fill="#7CFC00" class="stroke_color" stroke-miterlimit="10"
			width="25.142" height="15.42" />
		<text transform="matrix(1 0 0 1 89.6406 479.6836)" fill="#000000" font-family="Microsoft YaHei"
			font-size="13">S1</text>
		<text transform="matrix(1 0 0 1 57.1318 479.6836)" fill="#000000" font-family="Microsoft YaHei"
			font-size="13">S2</text>
		<text transform="matrix(1 0 0 1 57.1318 496.5254)" fill="#000000" font-family="Microsoft YaHei"
			font-size="13">S3</text>
		<text transform="matrix(1 0 0 1 12.3818 496.5254)" fill="#000000" font-family="Microsoft YaHei"
			font-size="13"> S4</text>
		
		
		<!-- 测试研发机房 -->
		<rect x="2.579" y="505.805" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="234.965" height="185.568" />	
		<text transform="matrix(1 0 0 1 59.4053 532.209)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="20">测试研发机房(C)</text>	
		<rect id="C17" data-modal="modal-1" x="21.292" y="548.807" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="C18" data-modal="modal-1" x="21.292" y="564.076" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C19" data-modal="modal-1" x="21.292" y="579.316" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.236" />
		<rect id="C20" data-modal="modal-1" x="21.292" y="594.553" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="C21" data-modal="modal-1" x="21.292" y="609.465" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C22" data-modal="modal-1" x="21.292" y="624.707" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C23" data-modal="modal-1" x="21.292" y="639.947" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C24" data-modal="modal-1" x="21.292" y="655.188" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.236" />
		<text transform="matrix(1 0 0 1 54.3408 561.877)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">17</text>
		<text transform="matrix(1 0 0 1 54.3408 577.3525)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">18</text>
		<text transform="matrix(1 0 0 1 54.3408 592.2109)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">19</text>
		<text transform="matrix(1 0 0 1 54.3408 606.8438)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">20</text>
		<text transform="matrix(1 0 0 1 54.3408 622.5449)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">21</text>
		<text transform="matrix(1 0 0 1 54.3408 638.4023)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">22</text>
		<text transform="matrix(1 0 0 1 54.3408 653.4971)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">23</text>
		<text transform="matrix(1 0 0 1 54.3408 669.3535)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">24</text>
		<rect id="C09" data-modal="modal-1" x="101.312" y="548.807" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="C10" data-modal="modal-1" x="101.312" y="564.076" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C11" data-modal="modal-1" x="101.312" y="579.316" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.236" />
		<rect id="C12" data-modal="modal-1" x="101.312" y="594.553" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="C13" data-modal="modal-1" x="101.312" y="609.467" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C14" data-modal="modal-1" x="101.312" y="624.707" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C15" data-modal="modal-1" x="101.312" y="639.947" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C16" data-modal="modal-1" x="101.312" y="655.188" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.236" />
		<text transform="matrix(1 0 0 1 135.6025 561.877)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">9</text>
		<text transform="matrix(1 0 0 1 134.6025 577.3525)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">10</text>
		<text transform="matrix(1 0 0 1 134.6025 592.2109)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">11</text>
		<text transform="matrix(1 0 0 1 134.6025 606.8438)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">12</text>
		<text transform="matrix(1 0 0 1 134.6016 622.5449)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">13</text>
		<text transform="matrix(1 0 0 1 134.6016 637.4023)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">14</text>
		<text transform="matrix(1 0 0 1 134.6016 653.4971)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">15</text>
		<text transform="matrix(1 0 0 1 134.6025 669.3535)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">16</text>
		<rect id="C01" data-modal="modal-1" x="180.974" y="548.807" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.236" />
		<rect id="C02" data-modal="modal-1" x="180.974" y="564.076" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.236" />
		<rect id="C03" data-modal="modal-1" x="180.974" y="579.316" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.236" />
		<rect id="C04" data-modal="modal-1" x="180.974" y="594.553" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="C05" data-modal="modal-1" x="180.974" y="609.467" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C06" data-modal="modal-1" x="180.974" y="624.707" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C07" data-modal="modal-1" x="180.974" y="639.947" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="C08" data-modal="modal-1" x="180.974" y="655.188" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.236" />
		<text transform="matrix(1 0 0 1 214.458 561.877)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">1</text>
		<text transform="matrix(1 0 0 1 214.458 577.3525)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">2</text>
		<text transform="matrix(1 0 0 1 214.458 592.2109)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">3</text>
		<text transform="matrix(1 0 0 1 214.458 606.8438)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">4</text>
		<text transform="matrix(1 0 0 1 214.458 622.5449)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">5</text>
		<text transform="matrix(1 0 0 1 214.458 637.4023)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">6</text>
		<text transform="matrix(1 0 0 1 214.458 653.4971)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">7</text>
		<text transform="matrix(1 0 0 1 214.458 669.3535)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">8</text>
		
		
		<!-- 主机房 -->
		<rect x="237.544" y="505.805" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="461.969" height="185.568" />
		<text transform="matrix(1 0 0 1 422.2544 532.209)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="20">主机房(Z)</text>
		<rect id="Z14" data-modal="modal-1" x="593.752" y="648.496" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="Z13" data-modal="modal-1" x="593.752" y="633.314" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Z12" data-modal="modal-1" x="593.752" y="618.072" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Z11" data-modal="modal-1" x="593.752" y="602.834" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Z10" data-modal="modal-1" x="593.752" y="587.594" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="Z09" data-modal="modal-1" x="593.752" y="572.354" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="Z08" data-modal="modal-1" x="593.752" y="556.877" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<text transform="matrix(1 0 0 1 624.4531 661.8066)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">14</text>
		<text transform="matrix(1 0 0 1 624.4551 646.5664)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">13</text>
		<text transform="matrix(1 0 0 1 624.458 631.3281)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">12</text>
		<text transform="matrix(1 0 0 1 624.4551 616.0859)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">11</text>
		<text transform="matrix(1 0 0 1 624.4551 601.1758)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">10</text>
		<text transform="matrix(1 0 0 1 627.4551 585.249)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">9</text>
		<text transform="matrix(1 0 0 1 627.4551 568.3418)" fill="#ffffff" font-family="Microsoft YaHei'"
			font-size="13">8</text>
		<rect id="Z01" data-modal="modal-1" x="654.108" y="556.877" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Z02" data-modal="modal-1" x="654.108" y="572.354" fill="#7CFC00"
			class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="Z03" data-modal="modal-1" x="654.108" y="587.594" fill="#7CFC00"
			class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect id="Z04" data-modal="modal-1" x="654.108" y="602.834" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Z05" data-modal="modal-1" x="654.108" y="618.072" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Z06" data-modal="modal-1" x="654.108" y="633.314" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect id="Z07" data-modal="modal-1" x="654.11" y="648.496" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.355" height="15.24" />
		<text transform="matrix(1 0 0 1 684.9551 568.3418)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">1</text>
		<text transform="matrix(1 0 0 1 684.9551 585.249)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">2</text>
		<text transform="matrix(1 0 0 1 684.9551 601.1758)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">3</text>
		<text transform="matrix(1 0 0 1 684.9531 616.0859)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">4</text>
		<text transform="matrix(1 0 0 1 684.9551 631.4414)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">5</text>
		<text transform="matrix(1 0 0 1 684.9531 646.5664)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">6</text>
		<text transform="matrix(1 0 0 1 684.9531 662.8066)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">7</text>
			
		<!-- 存储右 -->
		<rect x="521.959" y="564.734" fill="#8B8B83" class="stroke_color" stroke-miterlimit="10"
			width="30.356" height="15.236" />
		<!-- 存储左 -->
		<rect x="477.491" y="564.734" fill="#8B8B83" class="stroke_color" stroke-miterlimit="10"
			width="30.356" height="15.236" />
			
		<rect x="418.721" y="564.734" fill="#8B8B83" class="stroke_color toPointer" stroke-miterlimit="10"
			width="24.356" height="15.236" />
		<rect x="393.577" y="564.734" fill="#8B8B83" class="stroke_color toPointer" stroke-miterlimit="10"
			width="24.356" height="15.236" />
			
		<rect id="Z27" data-modal="modal-1" x="354.292" y="564.734" fill="#7CFC00"
			class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="24.356" height="15.238" />
		<rect id="Z26" data-modal="modal-1" x="329.148" y="564.734" fill="#7CFC00"
			class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="24.357" height="15.238" />		
		<rect id="Z25" x="277.531" y="564.734" fill="#7CFC00" class="stroke_color md-trigger toPointer" stroke-miterlimit="10"
			width="24.357" height="15.238" />  
		<text transform="matrix(1 0 0 1 281.3711 560.0703)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">25</text>	
		<text transform="matrix(1 0 0 1 333.3711 560.0703)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">26</text>
		<text transform="matrix(1 0 0 1 358.3711 560.0703)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">27</text>
		<rect id="Z15" data-modal="modal-1" x="547.493" y="619.086" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.236" />
		<rect id="Z16" data-modal="modal-1" x="522.352" y="619.086" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.236" />
		<rect id="Z19" data-modal="modal-1" x="483.884" y="619.086" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.356" height="15.236" />
		<rect id="Z20" data-modal="modal-1" x="458.74" y="619.086" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.356" height="15.236" />
		<rect id="Z21" data-modal="modal-1" x="418.721" y="619.086" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.356" height="15.236" />
		<rect id="Z22" data-modal="modal-1" x="393.577" y="619.086" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.356" height="15.236" />
		<rect id="Z23" data-modal="modal-1" x="355.076" y="619.086" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.356" height="15.236" />
		<rect id="Z24" data-modal="modal-1" x="329.932" y="619.086" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.236" />
		<rect id="Z17" x="291.149" y="619.086" fill="#7CFC00" class="stroke_color toPointer" stroke-miterlimit="10"
			width="24.357" height="15.236" />
		<rect id="Z18" data-modal="modal-1" x="266.006" y="619.086" fill="#7CFC00"
			class="stroke_color md-trigger toPointer" stroke-miterlimit="10" width="24.356" height="15.236" />
		<text transform="matrix(1 0 0 1 332.3711 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">24</text>
		<text transform="matrix(1 0 0 1 357.9082 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">23</text>
		<text transform="matrix(1 0 0 1 395.0166 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">22</text>
		<text transform="matrix(1 0 0 1 420.7666 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">21</text>
		<text transform="matrix(1 0 0 1 458.3809 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">20</text>
		<text transform="matrix(1 0 0 1 485.5371 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">19</text>
		<text transform="matrix(1 0 0 1 548.4688 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">15</text>
		<text transform="matrix(1 0 0 1 516.957 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13"> 16</text>
		
		<rect x="398.327" y="669.727" fill="#8B8B83" class="stroke_color" stroke-miterlimit="10"
			width="24.356" height="15.236" />
		<rect x="373.183" y="669.727" fill="#8B8B83" class="stroke_color" stroke-miterlimit="10"
			width="24.358" height="15.236" />
		<rect id="Z30" data-modal="modal-1" x="474.275" y="669.727" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		<rect id="Z31" data-modal="modal-1" x="449.132" y="669.727" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		
		<text transform="matrix(1 0 0 1 268.8389 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">18</text>
		<text transform="matrix(1 0 0 1 293.5889 616.4355)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">17</text>
		<text transform="matrix(1 0 0 1 476.7148 665.1875)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">30</text>
		<text transform="matrix(1 0 0 1 453.5713 665.1875)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">31</text>
		<text transform="matrix(1 0 0 1 522.957 559.6563)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">存储</text>
		<text transform="matrix(1 0 0 1 478.3477 559.6563)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">存储</text>
		
		
		<!-- 网络机房 -->
		<rect x="729.534" y="505.805" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="291.564" height="185.568" />
		<text transform="matrix(1 0 0 1 830.3906 532.209)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="20">网络机房(W)</text>
		<rect name="W" id="W01" data-modal="modal-1" x="746.747" y="541.764" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect name="W" id="W02" data-modal="modal-1" x="746.747" y="556.557" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect name="W" id="W03" data-modal="modal-1" x="746.747" y="571.797" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect name="W" id="W04" data-modal="modal-1" x="746.747" y="587.037" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect name="W" id="W05" data-modal="modal-1" x="746.747" y="602.633" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect name="W" id="W06" data-modal="modal-1" x="746.747" y="617.402" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect name="W" id="W07" data-modal="modal-1" x="746.747" y="631.195" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<rect name="W" id="W08" data-modal="modal-1" x="746.747" y="646.434" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.24" />
		<rect name="W" id="W09" data-modal="modal-1" x="746.747" y="661.68" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.357" height="15.238" />
		<text transform="matrix(1 0 0 1 781.8984 554.8047)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">1</text>
		<text transform="matrix(1 0 0 1 781.8984 570.1777)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">2</text>
		<text transform="matrix(1 0 0 1 781.8984 585.2918)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">3</text>
		<text transform="matrix(1 0 0 1 781.8984 600.498)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">4</text>
		<text transform="matrix(1 0 0 1 781.8984 616.3047)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">5</text>
		<text transform="matrix(1 0 0 1 781.8984 630.4121)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">6</text>
		<text transform="matrix(1 0 0 1 781.8984 644.6504)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">7</text>
		<text transform="matrix(1 0 0 1 781.8984 660.877)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">8</text>
		<text transform="matrix(1 0 0 1 781.8984 676.3535)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">9</text>
		<rect name="W" id="W10" data-modal="modal-1" x="814.089" y="541.764" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		<rect name="W" id="W11" data-modal="modal-1" x="814.089" y="556.557" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W12" data-modal="modal-1" x="814.089" y="571.797" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W13" data-modal="modal-1" x="814.089" y="586.037" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W14" data-modal="modal-1" x="814.089" y="600.633" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W15" data-modal="modal-1" x="814.089" y="615.402" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W16" data-modal="modal-1" x="814.089" y="631.195" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		<rect name="W" id="W17" data-modal="modal-1" x="814.089" y="646.434" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W18" data-modal="modal-1" x="814.089" y="661.68" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />		
		<text transform="matrix(1 0 0 1 848.8066 554.7705)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">10</text>
		<text transform="matrix(1 0 0 1 848.8066 570.1777)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">11</text>
		<text transform="matrix(1 0 0 1 848.8066 585.5918)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">12</text>
		<text transform="matrix(1 0 0 1 848.8066 600.498)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">13</text>
		<text transform="matrix(1 0 0 1 848.8066 615.9727)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">14</text>
		<text transform="matrix(1 0 0 1 848.8066 630.2129)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">15</text>
		<text transform="matrix(1 0 0 1 848.8066 644.6504)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">16</text>
		<text transform="matrix(1 0 0 1 848.8066 660.877)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">17</text>
		<text transform="matrix(1 0 0 1 848.8066 676.3535)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">18</text>
		<rect name="W" id="W19" data-modal="modal-1" x="891.961" y="541.152" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		<rect name="W" id="W20" data-modal="modal-1" x="891.961" y="556.947" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W21" data-modal="modal-1" x="891.961" y="571.188" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		<rect name="W" id="W22" data-modal="modal-1" x="891.961" y="586.426" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W23" data-modal="modal-1" x="891.961" y="600.02" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W24" data-modal="modal-1" x="891.961" y="615.791" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.238" />
		<rect name="W" id="W25" data-modal="modal-1" x="891.961" y="631.584" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W26" data-modal="modal-1" x="891.961" y="646.826" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<rect name="W" id="W27" data-modal="modal-1" x="891.961" y="661.066" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.358" height="15.24" />
		<text transform="matrix(1 0 0 1 926.7178 554.8047)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">19</text>
		<text transform="matrix(1 0 0 1 926.7178 570.1777)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">20</text>
		<text transform="matrix(1 0 0 1 926.7178 585.5918)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">21</text>
		<text transform="matrix(1 0 0 1 926.7178 600.498)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">22</text>
		<text transform="matrix(1 0 0 1 926.7178 615.9727)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">23</text>
		<text transform="matrix(1 0 0 1 926.7178 630.2129)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">24</text>
		<text transform="matrix(1 0 0 1 926.7178 644.4531)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">25</text>
		<text transform="matrix(1 0 0 1 926.7178 660.877)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">26</text>
		<text transform="matrix(1 0 0 1 926.7178 676.3535)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">27</text>
		<rect name="W" id="W28" data-modal="modal-1" x="965.35" y="541.17" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.24" />
		<rect name="W" id="W29" data-modal="modal-1" x="965.35" y="556.969" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.24" />
		<rect name="W" id="W30" data-modal="modal-1" x="965.35" y="571.209" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.24" />
		<rect name="W" id="W31" data-modal="modal-1" x="965.35" y="586.451" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.238" />
		<rect name="W" id="W32" data-modal="modal-1" x="965.35" y="600.045" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.236" />
		<rect name="W" id="W33" data-modal="modal-1" x="965.35" y="615.816" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.234" />
		<rect name="W" id="W34" data-modal="modal-1" x="965.35" y="631.611" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.238" />
		<rect name="W" id="W35" data-modal="modal-1" x="965.35" y="646.85" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.24" />
		<rect name="W" id="W36" data-modal="modal-1" x="965.35" y="661.09" fill="#7CFC00"
			class="stroke_color md-trigger toPointer " stroke-miterlimit="10" width="24.36" height="15.24" />
		<text transform="matrix(1 0 0 1 999.2715 554.8047)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">28</text>
		<text transform="matrix(1 0 0 1 999.2715 570.5918)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">29</text>
		<text transform="matrix(1 0 0 1 999.2715 585.1777)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">30</text>
		<text transform="matrix(1 0 0 1 999.2715 600.498)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">31</text>
		<text transform="matrix(1 0 0 1 999.2715 615.3047)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">32</text>
		<text transform="matrix(1 0 0 1 999.2715 630.4121)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">33</text>
		<text transform="matrix(1 0 0 1 999.2715 644.6504)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">34</text>
		<text transform="matrix(1 0 0 1 999.2715 658.3535)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">35</text>
		<text transform="matrix(1 0 0 1 999.2715 676.877)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="13">36</text>
		
		
		<!-- 机房空调间2 -->
		<text transform="matrix(1 0 0 1 492.3779 715.3105)" fill="#ffffff" font-family="Microsoft YaHei"
			font-size="16">机房空调间2</text>
		<rect x="2.578" y="691.371" fill="none" class="stroke_color" stroke-miterlimit="10"
			width="1018.957" height="36.031" />


		<!-- 链接 -->
		<rect x="2.578" y="731.371" fill="#4C5662" class="stroke_color  transformer1"
			stroke-miterlimit="10" width="509.957" height="36.031" />
		<text transform="matrix(1 0 0 1 218.3779 755.3105)" fill="#ffffff" class="  transformer1"
			font-family="Microsoft YaHei" font-size="16">副中心机房</text>	
		<rect x="512.578" y="731.371" fill="#4C5662" class="stroke_color  transformer2"
			stroke-miterlimit="10" width="509.957" height="36.031" />	 
		<text transform="matrix(1 0 0 1 730.3779 755.3105)" fill="#ffffff" class="  transformer2"
			font-family="Microsoft YaHei" font-size="16">异地机房</text>
	
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
			url : '<%=path%>/getAlert.do?location=zzx',
			type : 'get',
			dataType : 'json',
			success : function(result) {
				var jg = ""; //Q48
				var level = 0;
				if(result.length > 0 ){
					for (var i = 0; i < result.length; i++) {
						jg = result[i].devLocation;
						switch (result[i].severity) {
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
						if ($("#" + jg) != null) {
							$("#" + jg).css("fill", fill_color);
						} else if ($("#" + jg) == null) {

						}
				}
				
				}
			}
		});
	};
</script>

<!-- 跳转页面 -->
<script type="text/javascript">
	$(".transformer1").click(function() {
		window.location.href = 'fzxok.do';
	})
	$(".transformer2").click(function() {
		window.location.href = 'ydok.do';
	})
</script>
</html>