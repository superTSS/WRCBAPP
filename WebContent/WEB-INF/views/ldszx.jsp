<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>两地三中心网络带宽实时利用率</title>
    <script type="text/javascript" src="js/jquery-1.12.0.js"></script>
    <style type="text/css">
		body {
			background:RGB(76,86,98);
			width:1010px;
			margin:0 auto;
			padding:0;
			
		}
		p{
			font-size: 18px;
			color: white;
			font-family: "Microsoft YaHei" ! important;
			
		}
	</style>
	
	<script>
		$(document).ready(function(){
			var w = window.innerWidth;
			var h = window.innerHeight;
		})
	</script>
</head>
<body>
	<div style="width:1010px;height:750px;">
		<!-- 头部logo图片说明 -->
		<div style="width:1010px;height:60px;">
			<img src="img/wrcbldszx.png">
		</div>
		
		<!-- 地图 -->
		<div id="left_line" style="width:510px;height:690px;float:left;">
			<div id="line" style="width:510px;height:460px;padding-top: 20px;"></div>
			
			<div id="miaoshu" style="width:510px;height:200px;">
				<div style="width:90%;height:50px;border:1px solid #5E8ADA;border-radius:5px;margin:0 auto;">
					<div style="float:left;width:20%;height:50px;line-height:50px;text-align:center;font-family:Microsoft YaHei;font-size:15px;border-right:1px solid #5E8ADA;">
						<font color="white">主中心</font>
					</div>
					<div style="float:left;text-align:left;font-size:15px;margin-top:5px;">
						<div style="height:20px;margin-left:5px;"><font color="white">地址：江苏省无锡市滨湖区金融二街9号</font></div>
						<div style="height:25px;margin-left:5px;"><font color="white">值班电话：18118919675</font></div>
					</div>
				</div>
				
				<div style="width:90%;height:50px;border-bottom:1px solid #5E8ADA;border-left:1px solid #5E8ADA;border-right:1px solid #5E8ADA;border-radius:5px;margin:0 auto;">
					<div style="float:left;width:20%;height:50px;line-height:50px;text-align:center;font-family:Microsoft YaHei;font-size:15px;border-right:1px solid #5E8ADA;">
						<font color="white">副中心</font>
					</div>
					<div style="float:left;text-align:left;font-size:15px;margin-top:5px;">
						<div style="height:20px;margin-left:5px;"><font color="white">地址：江苏省无锡市梅村锡梅花园15-45</font></div>
						<div style="height:25px;margin-left:5px;"><font color="white">值班电话： 0510-88157075</font></div>
					</div>
				</div>
				
				<div style="width:90%;height:50px;border-bottom:1px solid #5E8ADA;border-left:1px solid #5E8ADA;border-right:1px solid #5E8ADA;border-radius:5px;margin:0 auto;">
					<div style="float:left;width:20%;height:50px;line-height:50px;text-align:center;font-family:Microsoft YaHei;font-size:15px;border-right:1px solid #5E8ADA;">
						<font color="white">异地中心</font>
					</div>
					<div style="float:left;text-align:left;font-size:15px;margin-top:5px;">
						<div style="height:20px;margin-left:5px;"><font color="white">地址：江苏省南京市浦口区龙华路紫金农商行3楼</font></div>
						<div style="height:25px;margin-left:5px;"><font color="white">值班电话：18915987899</font></div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 坐标 -->
		<div style="width:500px;height:680px;float:right;">
			<div id="guangqian" style="height:320px;width:100%;position:relative;"></div>
    		<div id="network" style="height:360px;width:100%;position:relative;"></div>
		</div> 
	</div>
    
    <script src="js/echarts-all.js"></script>
    <script type="text/javascript">
		var winWidth;
		var winHeight;
		// 获取窗口宽度
		if (window.innerWidth)
		winWidth = window.innerWidth;
		else if ((document.body) && (document.body.clientWidth))
		winWidth = document.body.clientWidth;
		// 获取窗口高度
		if (window.innerHeight)
		winHeight = window.innerHeight;
		else if ((document.body) && (document.body.clientHeight))
		winHeight = document.body.clientHeight;
		
		
		
		//为需要交互的数据，所定义的变量
		var net_z2f = 40;
		var net_y2f = 40;
		var net_z2y = 30;  //定义主到异地的负载
		var net_f2y = 90;  //定义副到异地的负载
		var net_f2z = 50;
		
		var light_z2f = 200;
		var light_z2y = 75;
		var light_f2z = 1;
		var light_f2y = 0.8;
		
		
		var lineChart = echarts.init(document.getElementById('line')); 
		var networkChart = echarts.init(document.getElementById('network'));  

		lineopt = {
			//backgroundColor: '#2F3140',
			backgroundColor: 'RGB(76,86,98)',
			title : {
				text: '',
				subtext:'',
				x:'center',
				textStyle : {
					color: '#fff'
				}
			},
			tooltip : {
				trigger: 'item',
				backgroundColor:'rgba(0,0,0,0.3)',
				formatter: '{b}',
				alwaysShowContent:true
			},
			dataRange: {
						show:false,
						calculable : false,
						splitList:[
						   {
							   start:0,
							   end:10,
							   color:'#BF3EFF'   //核心
						   },
						   {
							   start:10,
							   end:20,
							   color:'#FFC125'  // 主副运管互联
						   },
						   {
							   start:20,
							   end:30,
							   color:'#7CFC00'   //主异运管互联
						   },
						   {
							   start:30,
							   end:40,
							   color:'#00c5cd'     //副异运管互联
						   },
						   {
							   start:70,
							   end:100,
							   color:'red'
							}
						           ]
			},
			series : [
				{
					name: '江苏',
					type: 'map',
					roam: false,
					hoverable: false,
					mapType: '江苏',
					mapLocation:{
						x:18,
						y:25,
						width:545,
						height:424
					},
					itemStyle:{
						normal:{
							borderColor:'rgba(100,149,237,1)',
							borderWidth:1,
							areaStyle:{
								//color: '#2F3140' 
									color: 'RGB(76,86,98)' 
								//color: '#FF0000'  修改地图的背景色
							},
							label:{
								show:false,
								textStyle:{
									color:'white',
									fontSize:15,
									fontFamily:'microsoft yahei',
								}
							}
						}
					},
					data:[{name: '南京市'},
					      {name:'无锡市'}],
				    markLine : {
						smooth:true,
						//smoothness:0.11,		
						effect : {
							show: true,
							scaleSize: 1,
							period: 15,
							color: '#fff',
							shadowBlur: 10
						},
						itemStyle : {
							normal: {
								label:{
									show:false,
									formatter:'{b}',
									textStyle:{
										align:'right'
									}},
								borderWidth:2,
								lineStyle: {
									type: 'solid',
									shadowBlur: 10
								}
							}
						},
						
						data : [
							[{name:'主'},{name:'副',value:5}],
							[{name:'主',smoothness:0.2},{name:'异地',value:25}],
							[{name:'异地',smoothness:0.1},{name:'主',value:25}],
							[{name:'异地'},{name:'副',value:35}],
							[{name:'副'},{name:'主',value:15}],
						    [{name:'副',smoothness:0.1},{name:'异地',value:35}]
						    
						]
					},
					markPoint : {
						//symbol:'pin',
						//symbolSize : function (v){
						//	return 10 + v/10
						//},
						symbolSize : 20,
						effect : {
							show: false,
							shadowBlur : 0,
							
						},
						itemStyle:{
							normal:{
								//color:['#72AE2C'],   这个是南京和无锡的颜色块 字的背景色
								color:['#ff0000'],  //
								label:{show:true,formatter:'{b}'}
							},
							emphasis: {
								label:{position:'top'}
							}
						},
						data : [
								{name:'主'},
								{name:'异地'},
								{name:'副'}
						]
					},
				
					geoCoord: {
						'异地': [118.567413,32.041544],
						/*'异地': [118.767413,32.041544],*/
						'主': [120.201663,31.404729],
						'副': [120.391663,31.854729]
					}
					
					
				}
			]
		};

		networkopt = {
			tooltip : {
				trigger: 'axis'
			},
			animationDurationUpdate: 2000,
			title:{
				show:true,
				text:'网\n络\n带\n宽\n利\n用\n率\n%',
				textAlign:'left',
				x:'22',
				y:'center',
				textStyle:{
							color:'white',
							fontSize:15,
							fontWeight: 'normal',
							fontFamily:'microsoft yahei'
						}
			},
			color:["#BF3EFF","#FFC125","#7CFC00","#00c5cd"],
			calculable : true,
			grid:{
				borderColor:'RGB(76,86,98)',
			},
			legend: {
				//data:['主副核心互联','主异核心互联','副异核心互联','主副服务器一区二层互联','主副服务器二区二层互联','主副广域网互联1','主副广域网互联2','主副外联区互联','主副运管互联','主异运管互联','副异运管互联'],
				data:['主副核心互联','主副运管互联','','主异运管互联','副异运管互联'],
				//padding: 4, 
				textStyle:{
							color:'white',
							fontSize:13,
							fontFamily:'microsoft yahei'
				},
			//	orient:'vertical',
				orient:'horizontal',
				x:'center',
				//x:'left',
				y:0,
				selected:{
					'主副核心互联' : true,
				//	'主异核心互联' : true,
				//	'副异核心互联' : true,
				//	'主副服务器一区二层互联' : true,
				//	'主副服务器二区二层互联' : true,
				//	'主副广域网互联1' : true,
				//	'主副广域网互联2' : true,
				//	'主副外联区互联' : true,
					'主副运管互联' : true,
					'主异运管互联' : true,
					'副异运管互联' : true
				}
			},
			xAxis : [
				{
					type : 'category',
					splitLine:{
						show:false
					},
					axisTick:{
						length:10
					},
					axisLabel:{
						show:true,
						textStyle:{
							color:'white',
							fontSize:13,
							fontFamily:'microsoft yahei'
						}
					},
					boundaryGap : true,
					data : ['11:05','11:10','11:15','11:20','11:25','11:30','11:35']
				}
			],
			yAxis : [
				{
					type : 'value',
					//name: '利用率%',
					name: '',
					axisTick: {length:-2},
					/* axisTick:{
						show:true
					}, */
					
					splitLine:{
						show:false
					},
					splitNumber : 5,   //分  为5段
		            axisLabel : {
		                textStyle:{
							color:'white',
							fontSize:13,
							fontFamily:'microsoft yahei'
		                },
		            },
				}
			],

			series : [
				{
					name:'主副核心互联',
					type:'line',
					smooth:true,
					symbol:'none',
					data:[1,1,1,1,1,1,1]
				},
				{
					name:'主副运管互联',
					type:'line',
					smooth:true,
					symbol:'none',
					data:[1,1,1,1,1,1,1]
				},
				{
					name:'主异运管互联',
					type:'line',
					smooth:true,
					symbol:'none',
					data:[1,1,1,1,1,1,1]
				},
				{
					name:'副异运管互联',
					type:'line',
					smooth:true,
					symbol:'none',
					data:[1,1,1,1,1,1,1]
				},
			]
		};
                    

		var guangqianChart = echarts.init(document.getElementById('guangqian')); 
			
		guangqianopt = {
			tooltip : {
				trigger: 'axis'
			},
			animationDurationUpdate: 2000,
			title:{
				show:true,
				text:'S\nA\nN\n交\n换\n机\n带\n宽\n利\n用\n率\n%',
				textAlign:'left',
				x:'22',
				y:'center',
				textStyle:{
							color:'white',
							fontSize:15,
							fontWeight: 'normal',
							fontFamily:'microsoft yahei'
						}
			},
			color:["#FFF","#7FFF00","yellow"],
			calculable : true,
			grid:{
				borderColor:'RGB(76,86,98)',
			},
			legend: {
				data:['NBU','SRDF','MirrorView'],
				textStyle:{
							color:'white',
							fontSize:14,
							fontFamily:'microsoft yahei'
				},
				//orient:'vertical',   //图例方向问题
				orient:'horizontal',
				x:'center',  //图例是左还是右
				selected:{
					'NBU'  : true,
					'SRDF' : true,
					'MirrorView' : true,
				}
			},
			xAxis : [
				{
					type : 'category',
					splitLine:{
						show:false
					},
					axisTick:{
						length:10
					},
					axisLabel:{
						show:true,
						textStyle:{
							color:'white',
							fontSize:13,
							fontFamily:'microsoft yahei'
						}
					},
					boundaryGap : true,
					data : ['11:05','11:10','11:15','11:20','11:25','11:30','11:35']
				}
			],
			yAxis : [
				{
					type : 'value',
					name: '',
					axisTick:{
						show:true
					},
					splitLine:{
						show:false
					},
					splitNumber : 5,   //分  为5段
		            axisLabel : {
		                textStyle:{
							color:'white',
							fontSize:13,
							fontFamily:'microsoft yahei'
		                },
		            },
				}
			],
			series : [
				{
					name:'NBU',
					type:'line',
					smooth:true,
					symbol:'none',
					data:[1,1,1,1,1,1,1],
				},
				{
					name:'SRDF',
					type:'line',
					smooth:true,
					symbol:'none',
					data:[1,1,1,1,1,1,1],
				},{
					name:'MirrorView',
					type:'line',
					symbol:'none',
					smooth:true,
					data:[1,1,1,1,1,1,1],
				}
			]
		};
		// 为echarts对象加载数据 
		lineChart.setOption(lineopt); 
		networkChart.setOption(networkopt);
		// 为echarts对象加载数据 
		guangqianChart.setOption(guangqianopt); 
    </script>
    
    <script type="text/javascript">
    setInterval('getNetworkData()', 5000 * 12 );
    setInterval('getGuangqianData()',5000 * 12 );
    setInterval('getLinestatusData()',5000 * 12 );
   function getGuangqianData(){
	   $.ajax({
		   url:'<%=path%>/getGuangqianData.do',
		   type:'get',
		   dataType:'json',
		   success:function(result)
		   {
			 //for 光纤  data  line2 
  				var guangxian_xData = [];
  				var guangxian_virtual_Data = [];     //MIRROWVIEW
  				var guangxian_nbu_Data = [];		 //NBU
  				var guangxian_storage_Data = [];     //SRDF
  				
  				for(var i = 0 ; i <  result.guangqian_z2f_virtual.capdate.length;i++)
  				{
  					guangxian_xData.push(result.guangqian_z2f_virtual.capdate[i]);
  					guangxian_virtual_Data.push(result.guangqian_z2f_virtual.useage[i]);
  				}
  				
  				for(var i = 0 ; i <  result.guangqian_z2f_nbu.capdate.length;i++)
  				{
  					guangxian_xData.push(result.guangqian_z2f_nbu.capdate[i]);
  					guangxian_nbu_Data.push(result.guangqian_z2f_nbu.useage[i]);
  				}
  				for(var i = 0 ; i <  result.guangqian_z2f_storage.capdate.length;i++)
  				{
  					guangxian_storage_Data.push(result.guangqian_z2f_storage.useage[i]);
  				}   				
  				
  				guangqianopt.xAxis[0].data = guangxian_xData;
  				guangqianopt.series[0].data = guangxian_nbu_Data;
  				guangqianopt.series[1].data = guangxian_nbu_Data;
  				//guangqianopt.series[1].data = guangxian_virtual_Data;
  				guangqianopt.series[2].data = guangxian_storage_Data;
  				guangqianChart.setOption(guangqianopt,true);// 重新加载图表

		   },
		   failure:function(errmsg)
		   {
			   
		   }
	   })
   }
   
    function getNetworkData(){
    	 $.ajax({
    		url:'<%=path%>/getNetworkData.do',
   			type : 'get',
   			dataType : 'json',
   			success:function(result)
   			{
   				//for network data:map and line1 
   				var line_xData = [];
   				var line_obj1001_Data = [];
   				var line_obj1003_Data = [];
   				var line_obj1005_Data = [];
   				var line_obj10011_Data = [];
   				var line_obj10012_Data = [];
   				var line_obj10023_Data = [];
   				var line_obj103254ae4_Data = [];
   				var line_obj101240_Data = [];
   				var line_obj10012po12_Data = [];
   				var line_obj103254ae21_Data = [];
   				var line_obj100112_Data = [];
   				for(var i = 0 ; i <  result.ip16631001Ethernet31.capdate.length;i++)
   				{
   					line_xData.push(result.ip16631001Ethernet31.capdate[i]);
   					line_obj1001_Data.push(result.ip16631001Ethernet31.useage[i]);
   				}
   				for(var i = 0 ; i < result.ip16631003Ethernet321.capdate.length;i++)
   				{
   					line_obj1003_Data.push(result.ip16631003Ethernet321.useage[i]);
   				}
   				for(var i = 0 ; i <  result.ip16631005Ethernet345.capdate.length;i++)
   				{
   					line_obj1005_Data.push(result.ip16631005Ethernet345.useage[i]);
   				}
   				for(var i = 0 ; i < result.ip166310011Po39.capdate.length;i++)
   				{
   					line_obj10011_Data.push(result.ip166310011Po39.useage[i]);
   				}
   				for(var i = 0 ; i < result.ip166310012Po76.capdate.length;i++)
   				{
   					line_obj10012_Data.push(result.ip166310012Po76.useage[i]);
   				}
   				for(var i = 0 ; i < result.ip166310023Gi111.capdate.length;i++)
   				{
   					line_obj10023_Data.push(result.ip166310023Gi111.useage[i]);
   				}
   				for(var i = 0 ; i < result.ip1663103254ae4.capdate.length;i++)
   				{
   					line_obj103254ae4_Data.push(result.ip1663103254ae4.useage[i]);
   				}
   				for(var i = 0 ; i < result.ip1663101240ge0047.capdate.length;i++)
   				{
   					line_obj101240_Data.push(result.ip1663101240ge0047.useage[i]);
   				}
   				for(var i = 0 ; i < result.ip166310012Po12.capdate.length;i++)
   				{
   					line_obj10012po12_Data.push(result.ip166310012Po12.useage[i]);
   				}
   				for(var i = 0 ; i < result.ip1663103254ae21.capdate.length;i++)
   				{
   					line_obj103254ae21_Data.push(result.ip1663103254ae21.useage[i]);
   				}
   				for(var i = 0 ; i < result.ip1663100112Gi213.capdate.length;i++)
   				{
   					line_obj100112_Data.push(result.ip1663100112Gi213.useage[i]);
   				}
   			//data:['主副核心互联','主异核心互联','副异核心互联','主副服务器一区二层互联','主副服务器二区二层互联',
   			       // '主副广域网互联1','主副广域网互联2','主副外联区互联','主副运管互联','主异运管互联','副异运管互联'],
   				networkopt.xAxis[0].data = line_xData;
   				/*networkopt.series[0].data = line_obj1001_Data;
   				networkopt.series[1].data =line_obj10012po12_Data  ;
   				networkopt.series[2].data = line_obj100112_Data ;
   			    networkopt.series[3].data = line_obj1003_Data;
   				networkopt.series[4].data = line_obj1005_Data;
   				networkopt.series[5].data = line_obj10012_Data;
   				networkopt.series[6].data = line_obj10011_Data;
   				networkopt.series[7].data = line_obj10023_Data;
   				*/
   				networkopt.series[0].data = line_obj1001_Data;
   				networkopt.series[1].data = line_obj103254ae4_Data;
   				networkopt.series[2].data = line_obj103254ae21_Data;
   				networkopt.series[3].data = line_obj10023_Data;
   				
   				networkChart.setOption(networkopt);// 重新加载图表
   				/*lineopt.series[0].markLine.data = [
      				                				[{name:'主'},{name:'异地',value:result.line_z2y.useage[result.line_z2y.capdate.length-1]}],
      				                				[{name:'主'},{name:'副',value:result.line_z2f.useage[result.line_z2f.capdate.length-1]}],
      				                				[{name:'副'},{name:'异地',value:result.line_f2y.useage[result.line_f2y.capdate.length-1]}],
      				                				[{name:'副'},{name:'主',value:result.line_f2z.useage[result.line_f2z.capdate.length-1]}],
      				                			];
   				lineChart.setOption(lineopt,true); 
   				*/
   				
   			}
    	   })
    }
    
    
    </script>
    
    <!-- 显示地图链路状态信息 -->
    
    <script>
    function isEmptyObject(obj) {
    	 for (var key in obj) {
    	  return false;
    	 }
    	 return true;
    	}

    function  getLinestatusData(){
    $.ajax({
		url:'<%=path%>/getLineData.do',
			type : 'get',
			dataType : 'json',
			success:function(result)
			{
				/* [{name:'主'},{name:'副',value:5}],
				[{name:'主',smoothness:0.2},{name:'异地',value:25}],
				[{name:'异地',smoothness:0.1},{name:'主',value:25}],
				[{name:'异地'},{name:'副',value:35}],
				[{name:'副'},{name:'主',value:15}],
			    [{name:'副',smoothness:0.1},{name:'异地',value:35}] */
				if(isEmptyObject(result))
				{
					lineopt.series[0].markLine.data = [
														[{name:'主'},{name:'副',value:5}],
														[{name:'副'},{name:'主',value:15}],
	     				                				[{name:'主'},{name:'异地',value:25}],
	     				                				[{name:'异地'},{name:'主',value:25}],
	     				                				[{name:'副'},{name:'异地',value:35}],
	     				                				[{name:'异地'},{name:'副',value:35}]
	     				                			];
				}else{
				lineopt.series[0].markLine.data = [
													[{name:'主'},{name:'副',value:result['zfhxhl']['zfhxhl']}],
													[{name:'副'},{name:'主',value:result['zfyghl']['zfyghl']}],
     				                				[{name:'主'},{name:'异地',value:result['zyyghl']['zyyghl']}],
     				                				[{name:'异地'},{name:'主',value:result['zyyghl']['zyyghl']}],
     				                				[{name:'副'},{name:'异地',value:result['fyyghl']['fyyghl']}],
     				                				[{name:'异地'},{name:'副',value:result['fyyghl']['fyyghl']}],
     				                			];
				}
  				lineChart.setOption(lineopt,true); 
			}
    })
    }
    
    
  
    
    
    </script>
    
    
</body>
