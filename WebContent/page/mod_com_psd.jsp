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
<script type="text/javascript">
	function check(){
		var stu_psd=document.getElementById("com_psd").value;
		if(stu_psd.length == 0){
			alert("请输入原密码！");
			return false;
		}
		var new_psd=document.getElementById("new_psd").value;
		if(new_psd.length < 6){
			alert("请按照要求输入新密码！");
			return false;
		}
		var re_psd=document.getElementById("re_psd").value;
		if(re_psd != new_psd){
			alert("请确认两次密码是否输入相同！");
			return false;
		}
	}
</script>
	<body>
		<div class="main_title">
			<div id="h5" class="check_text"><h5>就业信息网</h5></div>
			<div class="check_text">欢迎 ${sessionScope.username}进入&nbsp;
			<a href = ${sessionScope.loginpage}>注销</a>	<!-- *连接到登录页面 -->
			</div>
		</div>
		<div class="main_menu">
		<table class="main_menu_item"   >
		<tr class="main_menu_item" >
			<tr >
					<th><a class="menu_option" href = ${sessionScope.menu1href} >${sessionScope.menu1}</a></th>	
					<th><a class="menu_option" href = ${sessionScope.menu2href} >${sessionScope.menu2}</a></th>	
					<th><a class="menu_option" href = ${sessionScope.menu3href} >${sessionScope.menu3}</a></th>	
					<th><a class="menu_option" href = ${sessionScope.menu4href} >${sessionScope.menu4}</a></th>	
				</tr>
		</tr>
		</table>
		</div>
		<div class="main_body">
			<div class="modpsd">
				<form action="${pageContext.request.contextPath }/mod_com_psdServlet" method="post" onsubmit="return check()">
				<table class="modpsd_table" >
					<tr>
						<input type="hidden"  value=${sessionScope.userid}  name="com_id" id="com_id"/>
						<td class="psditem">原密码:</td>
						<td><input type="password" name="com_psd" id="com_psd" />*</td>
						<td><div class="psdmsg"></div></td>
					</tr>
					<tr>
						<td class="psditem">新密码:</td>
						<td><input type="password" name="new_psd" id="new_psd"/>*</td>
						<td><div class="psdmsg">密码长度必须6-12位</div></td>
					</tr>
					<tr>
						<td class="psditem">确认密码:</td>
						<td><input type="password" name="re_psd" id="re_psd">*</td>
						<td><div class="psdmsg"></div></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="确认修改"></input>
						<input type="reset" value="重置"></input></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</body>
</html>