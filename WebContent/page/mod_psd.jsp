<!-- 这是个人中心修改密码界面 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>修改密码</title>
<link rel="shortcut icon" type="../image/x-icon" href="icon.png" media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link href="../css/mod_psd.css" rel="stylesheet" type="text/css" />
</head>
	<body>
		<div class="main_title">
			<div id="h5" class="check_text"><h5>就业信息网</h5></div>
			<div class="check_text">欢迎${sessionScope.username}	
			<a href = ${sessionScope.loginpage}>注销</a>	<!-- *连接到登录页面 -->
			</div>
		</div>
		<div class="main_menu">
		<table class="main_menu_item"   >
		<tr class="main_menu_item" >
			<td><a class="menu_option"  href = "home_page.jsp">首页</a>	<!-- 超链接到首页界面 --></td>
			<td><a class="menu_option"  href = "mod_psd.jsp">修改密码</a> </td>
			<td><a class="menu_option"  href = "mod_inf.jsp">修改资料</a> </td>
		</tr>
		</table>
		</div>
		<div class="main_body">
			<div class="modpsd">
				<table class="modpsd_table" >
					<tr>
						<td class="psditem">原密码:</td>
						<td><input type="password" />*</td>
						<td><div class="psdmsg"></div></td>
					</tr>
					<tr>
						<td class="psditem">新密码:</td>
						<td><input type="password" />*</td>
						<td><div class="psdmsg">密码长度必须6-12位</div></td>
					</tr>
					<tr>
						<td class="psditem">确认密码:</td>
						<td><input type="password">*</td>
						<td><div class="psdmsg"></div></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="确认修改"></input>
						<input type="reset" value="重置"></input></td>
					</tr>
				</table>
				
			</div>
		</div>
	</body>
</html>