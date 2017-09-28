<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>链接入口</title>
	<script type="text/javascript" src="js/jquery-1.12.0.js"></script>
	<style>
		body{
			background-color:rgb(221,221,221);
		}
		a {
			text-decoration:none;
			color:black;
		}
		.itm{
			width:100%;height:35px;background-color:white;border-radius:5px;margin-top:10px;line-height:35px;font-size:large;margin-left:10px;
		}
		.itma{
			padding-left: 10px;
		}
		.itm :hover{
			background-color:rgb(65,139,202);
			cursor: pointer;
		}
		.changeRemedy{
			width: 100% ; height:35px; padding-left: 10px;
		}
	</style>
</head>


<body>

	<div style="margin-top:10px;">
		<img src="img/wrcb_logo.png" />
	</div>
	
	<div style="width:90%;margin:20px auto 20px;">
		<div class="itm">
			<a href="http://166.3.64.136:15200/cnp.html" target="_blank" style="text-decoration:none;"><div class="itma">TEPS控制台</div></a>
		</div>
		
		<!-- <div class="itm">
			<a href="https://166.3.64.143：16311/ibm/console" target="_blank" style="text-decoration:none;"><div class="itma">ITNM控制台</div></a>
		</div>
 -->		
		<div class="itm">
			<a href="https://166.3.64.142:9569/srm" target="_blank" style="text-decoration:none;"><div class="itma">TPC控制台</div></a>
		</div>
		
		<div class="itm">
			<a href="https://166.3.64.143:16311/ibm/console" target="_blank" style="text-decoration:none;"><div class="itma">应用系统监控平台</div></a>
		</div>
		
		<div class="itm">
			<a href="https://166.3.64.143:16311/ibm/console" target="_blank" style="text-decoration:none;"><div class="itma">告警事件列表界面</div></a>
		</div>
		
		<div class="itm">
			<a href="ldszx.do" style="text-decoration:none;" target="_blank"><div class="itma">两地三中心界面</div></a>
		</div>
		
		<div class="itm">
			<a href="https://166.3.64.143:16311/ibm/console" target="_blank" style="text-decoration:none;"><div class="itma">骨干网视图界面</div></a>
		</div>
		
		<div class="itm">
			<a href="zzx.do" style="text-decoration:none;" target="_blank"><div class="itma">主中心机房拓扑界面</div></a>
		</div>
		<div class="itm">
			<a href="fzx.do" style="text-decoration:none;" target="_blank"><div class="itma">副中心机房拓扑界面</div></a>
		</div>
		<div class="itm">
			<a href="yd.do" style="text-decoration:none;" target="_blank"><div class="itma">异地机房拓扑界面</div></a>
		</div>
		<!-- <div class="itm">
			<a href="sms.jsp" style="text-decoration:none;" target="_blank"><div class="itma">修改短信联系人</div></a>
		</div> -->
		<div class="itm">
			<div id="chRemedy1" class="changeRemedy">
				<span>Remedy-OMNIBUS主-开启中</span>
			</div>
		</div>
		<div class="itm">
			<div id="chRemedy2" class="changeRemedy">
				<span>Remedy-OMNIBUS备-开启中</span>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	//发送开或者关到后台将脚本可以开启或者关闭到remedy工单系统
	    $(".changeRemedy").bind('click',function(){
	    	var id = $(this).attr('id');
	    	var data = { };
	    	if(id == 'chRemedy1')
	    	{
	    		var v  = $('#'+id).find('span').html().trim();
	    		if(v.indexOf('开启中') != -1 ){  //如果是开启中发送一个关闭消息过去
	    			data ={id:'chRemedy1',on:'no'}
	    		}
	    		if(v.indexOf('关闭中') != -1) //如果是关闭中，发送一个开启消息过去
	    		{
	    			data ={id:'chRemedy1',on:'yes'}
	    		}
	    	}else if (id == 'chRemedy2')
	    	{
	    		var v  = $('#'+id).find('span').html();
	    		if(v.indexOf('开启中') != -1 ){  //如果是开启中发送一个关闭消息过去
	    			data ={id:'chRemedy2',on:'no'}
	    		}
	    		if(v.indexOf('关闭中') != -1) //如果是关闭中，发送一个开启消息过去
	    		{
	    			data ={id:'chRemedy2',on:'yes'}
	    		}
	    	}
	    	$.ajax({
	    		url:'<%=path%>/changeRemedy.do',
				type : 'post',
				data:data,
				dataType : 'json',
				success:function(result){
					//var result = {id:'chRemedy1',changed:'yes',status:'n'}; // id 代表 哪个按钮  changed 表示修改成功 status 表示当前状态
					if(result.changed == 'yes' && result.id == 'chRemedy1')
					{
						if(result.status == 'no')
							$("#"+result.id).find('span').html('Remedy-OMNIBUS主-关闭中');
						if(result.status == 'yes')
							$("#"+result.id).find('span').html('Remedy-OMNIBUS主-开启中');
					}
					if(result.changed == 'yes' && result.id == 'chRemedy2')
					{
						if(result.status == 'no')
							$("#"+result.id).find('span').html('Remedy-OMNIBUS备-关闭中');
						if(result.status == 'yes')
							$("#"+result.id).find('span').html('Remedy-OMNIBUS备-开启中');
					}
				}
	    	})
	    });
		
	
	</script>
	
</body>
</html>
