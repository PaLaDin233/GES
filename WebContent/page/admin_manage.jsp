<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>青岛理工大学GES</title>
<link rel="shortcut icon" type="../image/x-icon" href="icon.png" media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link href="../css/admin_manage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function validateCode() 
{
	var com_name=document.getElementById("stu_no").value;
	if(com_name.length == 0){
		alert("请输入学生账号！");
		createCode();
		return false;
	}

	var com_psd=document.getElementById("stu_psd").value;
	if(com_psd.length == 0){
		alert("请输入密码！");
		createCode();
		return false;
	}
	
	var re_psd=document.getElementById("re_psd").value;
	if(re_psd.length == 0) {
		alert("请重复输入密码！");
		createCode();
		return false;
	} else if(re_psd != com_psd){
		alert("重复输入密码错误！");
		createCode();
		return false;
	}
}
</script>
</head>
	<body>
		<div class="main_title">
			<div id="h5" class="check_text"><h5>就业信息网</h5></div>
			<div class="check_text">欢迎 ${sessionScope.username}进入&nbsp;
			<a href = ${sessionScope.loginpage}>注销</a>	<!-- *连接到登录页面 -->
			</div>
		</div>
		
		<div class="main_menu">
			<table>
				<tr >
					<th><a class="menu_option" href =${sessionScope.menu1href}>${sessionScope.menu1}</a></th>	
					<th><a class="menu_option" href =${sessionScope.menu2href}>${sessionScope.menu2}</a></th>	
					<th><a class="menu_option" href =${sessionScope.menu3href}>${sessionScope.menu3}</a></th>	
					<th><a class="menu_option" href =${sessionScope.menu4href}>${sessionScope.menu4}</a></th>	
				</tr>	
			<!-- 
				<tr>
					<th><a class="menu_option" href = "home_page.jsp">首页</a></th>	
					<th><a class="menu_option"  href = "find_job.jsp">招聘信息</a></th> 
					<th><a class="menu_option" href = "mod_psd.jsp">个人中心</a></th>
					<th><a class="menu_option" href = "home_page.jsp">返回首页</a></th>
				</tr>-->
			</table>
		</div>
		<div class="main_body">
		<div class="form">
			
				<table class="adm_manage">
					<tr>
					<td>学号:</td>
						<td><form action="${pageContext.request.contextPath}/AdminSearchStuServlet" method="post" >
								<input type="text" name="stu_no" />
								<input type="submit" value="查询信息"  />
							</form>
						</td>
					</tr>
					<tr>
						<td>学生姓名:</td>
						<td>
							<form action="${pageContext.request.contextPath}/admin_manageServlet" method="post" >
								<input type="hidden" name="stu_psd" value="123456" />
								<input type="text" name="stu_name" />
								<input type="submit" value="添加学生"  />
							</form>
						</td>
					</tr>
					<tr>
						<td>企业账号:</td>
						<td>
						<form action="${pageContext.request.contextPath}/AdminSearchComServlet" method="post">
								<input type="text" name="com_user">
								<input type="submit" value="查询信息">	
							</form>	
						</td>				
					</tr>
				</table>
			
			</div>	
		</div>
	</body>
</html>