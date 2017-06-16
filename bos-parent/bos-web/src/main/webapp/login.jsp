<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOS-员工登录</title>
<link href="logo.ico" rel="shortcut icon" type="image/x-icon" />
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link type="text/css" rel="stylesheet" href="css/style_grey.css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<!-- 引入easyui的样式 -->
<link rel="stylesheet" type="text/css"
	href="js/easyui/themes/default/easyui.css" />
<!-- 引入easyui的icon图标样式 -->
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css" />
<!-- 引入easyui的核心js文件-->
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery.time.js"></script>
<style>
input[type=text] {
	width: 80%;
	height: 25px;
	font-size: 12pt;
	font-weight: bold;
	margin-left: 45px;
	padding: 3px;
	border-width: 0;
}

input[type=password] {
	width: 80%;
	height: 25px;
	font-size: 12pt;
	font-weight: bold;
	margin-left: 45px;
	padding: 3px;
	border-width: 0;
}
</style>


<script type="text/javascript">
	$(window).ready(function() {
		$("#see").mouseover(function(){
			$(this).css("cursor","pointer").attr("title","换一张");
		}).click(function(){
			//onclick="javascript:document.getElementById('see').src='${path}/verify.jspx?random='+Math.random();" 
			$(this).attr("src","{path}/verify.jspx?random=" + Math.random());
		})
		
		$("#loginBtn").click(function(){
			var userId = $("#userId");
			var password = $("#password");
			var vcode = $("#vcode");
			var msg = "";
			var obj = "";
			if ($.trim(userId.val()) == "") {
				msg = "用户名不能为空!";
				obj = userId; 
			}else if (!/^\w{5,20}$/.test($.trim(userId.val()))){
				msg = "用户名格式不正确!";
				obj = userId;
			}if ($.trim(password.val())=="") {
				msg="密码不能为空"
				obj= password;
			}else if (!/^\w{5,20}$/.test($.trim(password.val()))) {
				msg = "密码格式不正确";
				obj = password;
			}else if ($.trim(vcode.val())=="") {
				msg = "验证码不能为空!";
				obj= vcode;
			}else if (!/^\w{4}$/.test($.trim(vcode.val()))) {
				msg = "验证码格式不正确!";
				obj = vcode;
			}
			
			if (msg != "") {
				alert(msg)
				obj.focus();
			}else  {
				/* var params = $("#loginform").serialize();
				$.ajax({
					url:"${path}/login.jspx",
					dataType:"json",
					type:"POST",
					data: params,
					async:true,
					success : function(data){
						console.log(data)
						if (data.status==1) {
							
							window.location.href="${path}/main.jspx";
						}else  {
							alert("登录失败")
						}
					},error : function (XMLHttpRequest, textStatus, errorThrown) {
					    // 通常 textStatus 和 errorThrown 之中
					    console.log(errorThrown)
					    // 只有一个会包含信息
					    this; // 调用本次AJAX请求时传递的options参数
					}
				}) */
				/** 把表单中的input元素序列化成 get请求的字符串 */
				var params = $("#loginform").serialize();
				// 异步请求登录
				$.ajax({
					url : "${path}/login.jspx", // 请求URL
					type : "post", // 请求方式
					data : params, // 请求参数 key=value&key=value|{key:value,key:value}
					dataType : "json", // 指定服务器响应回来的数据类型 text|html|json|jsonp|xml|script
					async : true, // 异步请求
					success : function(data){ // 请求成功需要回调的函数
						// data: 响应数据 {tip:'',status:0}
					console.log(data)
						if (data.status == 0){
							window.location.href = "${path}/main.jspx";
						}else{
							/** 让验码变一下 (事件主动触发)*/
							$("#see").trigger("click");
							$.messager.alert("警告信息",data.tip, "warning");
						}
					},
					error : function(){ // 请求出错需要回调的函数
						$.messager.alert("错误提示","亲，您的网络有问题！","error");
					}
				});
			}
		})
	})
</script>
</head>

<body style="background-color: #E6E6FA;">

	<div
		style="width: 900px; height: 50px; position: absolute; text-align: left; left: 50%; top: 50%; margin-left: -450px;; margin-top: -280px;">
		<span style="float: right; margin-top: 35px; color: #488ED5;">新BOS系统，致力于便捷、安全、稳定等方面的客户体验</span>
	</div>

	<div class="main-inner" id="mainCnt"
		style="width: 900px; height: 440px; overflow: hidden; position: absolute; left: 50%; top: 50%; margin-left: -450px; margin-top: -220px; background-image: url('images/bg_login.jpg')">
		<div id="loginBlock" class="login"
			style="margin-top: 80px; height: 255px;">
			<div class="loginFunc">
				<div id="lbNormal" class="loginFuncMobile">员工登录</div>
			</div>

			<div class="loginForm">
				<form id="loginform" method="post" class="niceform">

					<div id="idInputLine" class="loginFormIpt showPlaceholder"
						style="margin-top: 5px;">
						<input id="userId" type="text" name="userId"
							class="loginFormTdIpt" maxlength="50" /> <label for="idInput"
							class="placeholder" id="idPlaceholder">帐号：</label>
					</div>
					<div class="forgetPwdLine"></div>


					<div id="pwdInputLine" class="loginFormIpt showPlaceholder">
						<input id="password" class="loginFormTdIpt" type="password"
							name="password" /> <label for="pwdInput" class="placeholder"
							id="pwdPlaceholder">密码：</label>
					</div>

					<div class="loginFormIpt loginFormIptWiotTh"
						style="margin-top: 58px;">
						<div id="codeInputLine" class="loginFormIpt showPlaceholder"
							style="margin-left: 0px; margin-top: -40px; width: 50px;">
							<input id="vcode" class="loginFormTdIpt" type="text" name="vcode"
								title="请输入验证码" style="margin-left: 1px; margin-top: 1px;" /> <img
								id="see" src="${path}/verify.jspx" width="75"
								style="margin: 0px 0 0 60px; height: 32px;"/>
						</div>
						<span id="loginBtn" class="btn btn-login"
							style="margin-top: -36px;">登录</span>
					</div>

					<div class="loginFormIpt loginFormIptWiotTh"
						style="margin-top: 8px; font-size: 14px;">
						<input type="checkbox" name="key" value="1" /> <font color="#888">记住用户</font>&nbsp;
						&nbsp; <a href="javascript:;" id="findPwd"
							style="padding-left: 100px;">忘记密码</a> <font color="red"></font>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div
		style="width: 900px; height: 50px; position: absolute; text-align: left; left: 50%; top: 50%; margin-left: -450px;; margin-top: 220px;">
		<span style="color: #488ED5;">Powered By www.itcast.cn</span><span
			style="color: #488ED5; margin-left: 10px;">推荐浏览器（右键链接-目标另存为）：<a
			href="http://download.firefox.com.cn/releases/full/23.0/zh-CN/Firefox-full-latest.exe">Firefox</a>
		</span>
	</div>
</body>
</html>