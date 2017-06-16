<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BOS-便捷、安全、稳定</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta name="Keywords" content="keyword1,keyword2,keyword3" />
<meta name="Description" content="网页信息的描述" />
<meta name="Author" content="itcast.cn" />
<meta name="Copyright" content="All Rights Reserved." />
<link rel="shortcut icon" type="image/x-icon" href="logo.ico" />
<link rel="stylesheet" type="text/css" href="default.css" />
<!-- 引入easyui的样式 -->
<link rel="stylesheet" type="text/css"
	href="js/easyui/themes/default/easyui.css" />
<!-- 引入easyui的icon图标样式 -->
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css" />
<!-- 引入jquery的核心js文件 -->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<!-- 引入easyui的核心js文件-->
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery.time.js"></script>

</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#timer").runtime();
		})
	</script>
<body class="easyui-layout">	
	<!-- 北部 -->
	<div data-options="region:'north'" , style="height: 82px;">
		<div style="height: 80px; background: url('images/topbg.gif')">

			<div
				style="position: absolute; right: 15px; top: 15px; font-size: 12px; color: #fff;">
				<strong>${session_user.name}</strong>&nbsp;欢迎您， <span id="timer"> </span>
			</div>
			<div style="position: absolute; right: 15px; top: 50px;">
			
				<a href="javascript:void(0)" id="mb" class="easyui-menubutton"     
				        data-options="menu:'#mm',iconCls:'icon-edit'">控制面板</a>   
				<div id="mm" style="width:150px;">   
				    <div data-options="iconCls:'icon-lock'">修改密码</div>   
				    <div data-options="iconCls:'icon-man'">联系管理员</div>   
				    <div class="menu-sep"></div>   
				    <div data-options="iconCls:'icon-cancel'">退出系统</div>
				</div>  
				
			</div>

		</div>
	</div>
	
	<!-- 南部区域 -->
		<div data-options="region:'south',height:30,border:false"
			style="padding-top:5px;background-color:#E6E6FA;">
			<table style="width:100%; border-collapse: collapse;">
				<tr>
					<td style="width: 280px;">
						<div style="color:#999;font-size:11px;">
							© 2003-2016 传智播客  - 版权所有    
						</div>
					</td>
					<td>
						<span style="background:url(images/online.png) no-repeat left;padding-left:18px;font-size:11px;color:#445588;">在线人数：1</span>
					</td>
				</tr>
			</table>
		</div>		

	<!-- 西部 -->
	<div data-options="region:'west',title:'bos-菜单导航',split:true,iconCls:'icon-man',width:160">

		<div id="aa" class="easyui-accordion" data-options="fit:true">

			<div title="系统管理"
				data-options="iconCls:'icon-mini-add',selected:true"
				style="overflow: auto; padding: 10px;">
				<h3 style="color: #0099FF;">Accordion for jQuery</h3>
				<p>Accordion is a part of easyui framework for jQuery. It lets
					you define your accordion component on web page more easily.</p>
			</div>
			<div title="基础数据" data-options="iconCls:'icon-mini-add'"
				style="padding: 10px;">content2</div>

			<div title="受理中心" data-options="iconCls:'icon-mini-add'">content3</div>
		</div>

	</div>

	<!-- 中部 -->
	<div data-options="region:'center'"
		style="width: '50px', padding:20px; background: #eee;">
		
		<div id="tt" class="easyui-tabs" data-options="border:false,fit:true">
			
				
				<div style="padding: 5px;" title="消息中心">
					<table class="easyui-datagrid" style="height: auto">
						<thead>
							<tr>
								<th data-options="field:'priority'">优先级</th>
								<th data-options="field:'state'">状态</th>
								<th data-options="field:'subject'">主题</th>
								<th data-options="field:'sender'">发送人</th>
								<th data-options="field:'senddate'">发送日期</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>重要</td>
								<td>未查看</td>
								<td>2013元旦配送最新方案调整</td>
								<td>刘能</td>
								<td>2012-12-30</td>
							</tr>
						</tbody>
					</table>
				</div>
				
		
	

</body>

</html>