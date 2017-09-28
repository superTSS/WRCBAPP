<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改短信联系人</title>
<script type="text/javascript" src="js/jquery-1.12.0.js"></script>
</head>
<style>
      .show{
      	width: 100%;
      	height:100px;
      	background-color: orange;
      }
	  .update{
	  	width:100%;
	  	height:200px;
	  	background-color: orange;
	  	color: black;
	  }
	  .current{
	  	width: 100%;
	  	height:100%;
	  	background-color: orange;
	  	
	  }
</style>


<body>

<div id="show" class="show">
<form action="">
<input id="btn1" type="button" value="获取当前短信联系人">
</form>
<p id="showtels"></p>
</div>

<div id="update" class="update">
<form  method="post">
<input id="telephones" name="telephones" style="width: 100%;"  type="text" value="">
<input id="btn2" type="button" value="更新当前短信联系人">
</form>
<p>注意：格式为tel=xxx,xxx,xxx，填写错误将无法发送短信</p>
<p>xxx为电话号码，以逗号隔开,tel=不能少</p>
</div>

<div class="current">
	<p>王旭电话:</p>
	<p>周丽丽电话:</p>
	<p>朱峰电话:</p>
	<p>赵海电话:</p>
	<p>鲍一鸿电话:</p>
	<p>高晓峰电话:</p>

</div>
</body>

<script type="text/javascript">
<!-- 获取当前的短信联系人-->
	$("#btn1").click(function(){
		$.ajax({
			url:'<%=path%>/sms.do',
			type : 'get',
			dataType : 'json',
			success:function(result){
				$("#showtels").html(result.telphones);
				$("#telephones").val(result.telphones);
			}
		})
	})
	
	$("#btn2").click(function(){
		$.ajax({
			url:'<%=path%>/sms.do',
			type : 'post',
			data:{telephones:$("#telephones").val()},
			dataType : 'json',
			success:function(result){
				alert(result.status);
			}
		})
	})
</script>

</html>