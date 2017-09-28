Ext.onReady(function() {
	Ext.BLANK_IMAGE_URL = 'js/ext/resources/images/default/s.gif';
	Ext.QuickTips.init();
	var winWidth = window.innerWidth;
	var winHeight = window.innerHeight;
	var win2Width = winWidth/2;
	var win4Width = winWidth/2;
	var win2Height = winHeight /2;
	var win4Height = winHeight /2;
	
	var porj = "/WRCBAPP"
	var win2;  //设备信息
	var win4;  //告警信息
	var xg = Ext.grid;  
	var fields2=[{
		name:"Node",
	},{
		name : 'devName',
	},{
		name : 'devType',
	},{
		name : 'devModel',
	},{
		name : 'devLocation',
	},{
		name: 'identifier',
		hidden:true
	}];
	var sm2 = new xg.CheckboxSelectionModel({
		handleMouseDown :Ext.emptyFn
	});
	var cm2 = new xg.ColumnModel([ 
		new Ext.grid.RowNumberer(),{
		header : "设备IP",
		width : 12,
		sortable : true,
		dataIndex : 'Node'
	}, {
		header : "设备名称",
		width : 12,
		sortable : true,
		dataIndex : 'devName'
	}, {
		header : "设备类型",
		width : 10,
		sortable : true,
		dataIndex : 'devType'
	},{
		header : "设备型号",
		width : 10,
		sortable : true,
		dataIndex : 'devModel'
	},{
		header : "机架位置",
		width : 10,
		sortable : true,
		dataIndex : 'devLocation'
	}]);
	var getDeviceInfo = porj+'/getDeviceInfo.do';
	var devicestore = new Ext.data.Store( {
		proxy : new Ext.data.HttpProxy( {
			url : getDeviceInfo,
			method : 'POST'
				}),
		reader : new Ext.data.JsonReader( {
			fields : fields2
		})
	});
	
	var grid2 = new xg.GridPanel({
		id : 'button-grid2',
		store : devicestore,
		cm : cm2,
		viewConfig : {
			forceFit : true
		},
		columnLines : true,
		buttonAlign : 'center',
	//	width : 600,
	//	height : 300,
		frame : true
	});
	//--------------------------------以上是获取设备信息的配置--------------------------------
	var fields4=[{
		name:"Node",
	},{
		name : 'devName',
	},{
		name : 'devType',
	},{
		name : 'lastOccurrence',
		type : 'date',
		dateFormat : 'Y-m-d H:i:s'
	},{
		name:"Acknowledged"
	},{
		name : 'summary',
	},{
		name : 'severity'
	},{
		name: 'identifier'
	},{
		name: 'Serial'
	}]
	var sm4= new Ext.grid.CheckboxSelectionModel({
		handleMouseDown :Ext.emptyFn
	})
	var cm4 = new xg.ColumnModel([ sm4, {
		id : 'Node',
		header : "设备IP",
		width : 12,
		sortable : true,
		dataIndex : 'Node'
	}, {
		header : "设备名称",
		width : 12,
		sortable : true,
		dataIndex : 'devName'
	}, {
		header : "设备类型",
		width : 10,
		sortable : true,
		dataIndex : 'devType'
	}, {
		header : "告警时间",
		width : 20,
		sortable : true,
		dataIndex : 'lastOccurrence',
		type:'date',
		renderer: Ext.util.Format.dateRenderer('Y年m月d日 H时:m分:s秒')
	}, {
		header : "确认（是/否）",
		width : 10,
		sortable : true,
		dataIndex : 'Acknowledged',
		renderer:function(value)
		{
			if(value == 0)
				return '<span>未确认</span>';
			else if (value == 1)
				return '<span>已确认</span>';
			else 
				return '<span>错误</span>';
		}
	},  {
		header : "告警详情",
		width : 20,
		sortable : true,
		dataIndex : 'summary',
		renderer:function(value)
		{
			return "<span ext:qtip='"+value+"'>'"+value+"'</span>";
		}
	}, {
		header:"告警等级",
		width:20,
		dataIndex:'severity',
		hidden:true

	},{
		header : "告警唯一ID",
		width : 20,
		sortable : true,
		dataIndex : 'identifier',
		hidden:true
	},{
		header : "告警唯一Serial",
		width : 20,
		sortable : true,
		dataIndex : 'Serial',
		hidden:true
	}]);
	var getAlertDetail = porj+'/getAlertDetail.do';
	var alertstore = new Ext.data.Store( {
		proxy : new Ext.data.HttpProxy( {
			url : getAlertDetail,
			method : 'POST'
				}),
		reader : new Ext.data.JsonReader( {
			fields : fields4
		})
	});
	
	
	var grid4 = new xg.GridPanel({
		id : 'button-grid4',
		store : alertstore,
		cm : cm4,
		sm : sm4,
		viewConfig : {
			forceFit : true,
			scrollOffset: 0
			
		},
		columnLines : true,
		buttonAlign : 'center',
		tbar : [ {
			text : '事件确认',
			tooltip : '事件是否处理完毕',
			iconCls : 'ack',
			defaultType : 'button',
			handler:function(){
				var needAck = new Array() ; //放入需要被确认的identifier
				var selections = grid4.getSelectionModel().getSelections();
				if(selections.length>0)
				{
					    Ext.Msg.confirm('提示', '你确定处理完事件了吗？', function(_btn) {
					    if (_btn == 'yes') {
					    	for(var i = 0 ; i < selections.length; i++){
					    		if (selections[i].get('Acknowledged') == 0 )
					    			{
					    				needAck.push(selections[i].get('Serial'));//放入identifier
					    			}
					    	}
					    	var needAckStr = needAck.join(',');//将数组变成,分割字符串
					    	//将数据提交到后台进行确认事件
					    	 Ext.Ajax.request({
					    		 url:porj+'/updateAcknowledged.do',
					    		 sync:true,
					    		 method : 'POST',
					    		 params : {   //Identifiers
					    		      name :needAckStr
					    		   },
					    		 success : function(response, options) {
					    			 var json= Ext.decode(response.responseText);
					    		     Ext.Msg.alert("提示","您成功确认"+json.total+"条告警！");
					    		     for (var i = 0; i < selections.length; i++) {
								           var record = selections;
								           alertstore.remove(record);
								      }
								     grid4.view.refresh();
								     alertstore.reload();  //继续用上次参数去试
					    		   },
					    		 failure : function(response)
					    		 {
					    			 Ext.Msg.alert("提示","请检查网络！");
					    		 }
					    		 
					    	 });
					       
					      }
					     });
				} else
			        Ext.Msg.alert("提示","你还没有选中记录.");
			}
		}, '-', {
			text : '删除',
			tooltip : '删除告警信息',
			iconCls : 'remove',
			handler:function(){
				var needDel = new Array() ; //放入需要被确认的identifier
				var selections = grid4.getSelectionModel().getSelections();
				if(selections.length>0)
				{
					    Ext.Msg.confirm('提示', '你确认删除选中的记录吗？', function(_btn) {
					    if (_btn == 'yes') {
					    	for(var i = 0 ; i < selections.length; i++){
					    		needDel.push(selections[i].get('Serial'));//放入identifier
					    	}
					    	var needDelStr = needDel.join(',');//将数组变成,分割字符串
					    	//将数据提交到后台进行删除事件
					    	 Ext.Ajax.request({
					    		 url:porj+'/deleteAlertInfo.do',
					    		 sync:true,
					    		 method : 'POST',
					    		 params : {   //Identifiers
					    		      name :needDelStr
					    		   },
					    		 success : function(response, options) {
					    		     var json= Ext.decode(response.responseText);
					    		     Ext.Msg.alert("提示","您成功删除"+json.total+"条告警！");
					    		     for (var i = 0; i < selections.length; i++) {
								           var record = selections;
								           alertstore.remove(record);
								      }
								     grid4.view.refresh();
								     alertstore.reload();  //刷新
								     //判断该机柜是否没有告警，就把机柜颜色换回来
								     if(grid4.getStore().getCount() <= 0 ){
								    	$("#"+win4.title).css("fill","#7CFC00");
								    	//$("#"+win4.title).css("fill","#FF0000");
								     }
								 	
					    		   },
					    		 failure : function(response)
					    		 {
					    			 Ext.Msg.alert("提示","请检查网络！");
					    		 }
					    		 
					    	 });
					    
					      }
					     });
				}else
			        Ext.Msg.alert("提示","你还没有选中记录.");
			}
		} ],
		//width : 600,
		//height : 300,
		frame : true
	});
	
	//--------------------------以上是告警信息配置---------------------------------
	
	$(".toPointer").each(function() {
		$(this).click(function() {
			var imgid = $(this).attr("id");  //机柜编号
			if(imgid.indexOf('Y01')!= -1)
			{
				imgid = 'Y01';
			}
			if(imgid.indexOf('Y02') != -1)
			{
				imgid = 'Y02';
			}
			var button = Ext.get(document.getElementById(imgid));
			var el_color = $(this).css('fill');     
			if(el_color == null || el_color == "rgb(124, 252, 0)"){
				var isNetworkDevice = $(this).attr("name");//机柜是否是网络设备，因为网络设备归一个表，其他设备一个表。便于快速查询
				var svg = document.getElementsByTagName("svg")[0];
				var devOrganization = svg.id;  //获取到底是主中心还是副中心
				//alert('isNetworkDevice:'+isNetworkDevice+",svg.id="+devOrganization+",jgbh="+imgid)
				if(isNetworkDevice == undefined || isNetworkDevice == null)
					devicestore.load({params:{jgbh:imgid,devOrganization:devOrganization}});
				else
					devicestore.load({params:{jgbh:imgid,devOrganization:devOrganization}});
				if (!win2) {
					win2 = new Ext.Window({
						applyTo : 'dev-win',
						layout : 'fit',
						width : win2Width,
						height : win2Height,
						closeAction : 'hide',
						plain : true,
						items : [ grid2 ],
						iconCls : 'device'
					});
				}
				win2.show();
				win2.on('close',function(){
					win2 = null;
				})
			} //展示机柜信息
			if(el_color == "rgb(255, 9, 0)" || el_color == "rgb(255, 161, 0)" || el_color == "rgb(247, 249, 16)"){
				var svg = document.getElementsByTagName("svg")[0];
				var devOrganization = svg.id;  //获取到底是主中心还是副中心
				
				alertstore.load({params:{jgbh:imgid,devOrganization:devOrganization}});
				if (!win4) {
					   win4 = new Ext.Window({
						applyTo : 'hello-win',
						layout : 'fit',
						width : win4Width,
						height : win4Height,
						closable:true,
						closeAction : 'hide',
						plain : true,
						items : [ grid4 ],
						iconCls : 'error'
					});
				}
				win4.on('close',function(){
					//grid4.getStore().reload();
					//grid4.getView().refresh();
					//win4.close();
					
					win4.title ='';   //为了将红色框复原而使用
					win4 = null;
				});
				win4.on('hide',function(){
					if(grid4.getStore().getCount() <= 0 ){
						$("#"+win4.title).css("fill","#7CFC00");
					}
				})
				win4.title = imgid;
				win4.show();
				grid4.getStore().on('load',function(s,records){  //改变行的颜色
				        var girdcount=0;
				        var color = "";
				        s.each(function(r){
				            if(r.get('severity')==3){
				            	if(r.get('Acknowledged') == 0)
				            	{
				            		 color = "#FFFF00";
				            	}else if(r.get('Acknowledged') == 1){
				            		 color = "#8F8F8F";
				            	}
				            	grid4.getView().getRow(girdcount).style.backgroundColor=color;
				            }else if(r.get('severity')==4){
				            	if(r.get('Acknowledged') == 0) //0 未确认  1 确认
				            	{
				            		 color = "#FFB329";
				            	}else if(r.get('Acknowledged') == 1){
				            		 color = "#8F8F8F";
				            	}
				                grid4.getView().getRow(girdcount).style.backgroundColor=color;
				            }else if(r.get('severity')==5){
				            	if(r.get('Acknowledged') == 0)
				            	{
				            		 color = "#FF0000";
				            	}else if(r.get('Acknowledged') == 1){
				            		 color = "#8F8F8F";
				            	}
				                grid4.getView().getRow(girdcount).style.backgroundColor=color;
				            }
				            girdcount=girdcount+1;
				        });
				    });
			}//展示告警信息
		}
		)
	});

});
