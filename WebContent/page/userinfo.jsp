<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>用户信息GES</title>
<link rel="shortcut icon" type="../image/x-icon" href="icon.png" media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link href="../css/find_job.css" rel="stylesheet" type="text/css"/>

</head>
	<body>
		<div class="main_title">
			<div id="h5" class="check_text"><h5>就业信息网</h5></div>
			<div class="check_text">欢迎${sessionScope.username}	
			<a href =${sessionScope.loginpage} >注销</a>	<!-- *连接到登录页面 -->
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
			
			<div class="findbox"><!-- 招聘标题框 -->
				<div>
				<table class="findboxindex">
					<tr><!-- 选页数 -->
						<td ><a class="lastpage">上一页</a></td>
						<td><a class="pagenum1">1</a></td>
						<td><a class="pagenum2">2</a></td>
						<td><a class="pagenum3">3</a></td>
						<td><a class="pagenum4">4</a></td>
						<td><a class="pagenum5">5</a></td>
						<td><a>...</a></td>
						<td><a class="nextpage">下一页</a></td>
						<td>到</td>
						<td>
							<div>
								<form action="">
								<input type="text" width="5px"/>
								<input type="submit" value="确定"/>
								</form>
							</div>
						</td>
					</tr></table>
				</div>
				<table class="findbox" border="0">		
					<tr>
						<th class="findboxtitle">${sessionScope.user_id}</th>
						<th class="findboxtitle">${sessionScope.user_no}</th>
						<th class="findboxtitle">${sessionScope.user_name}</th>
						<th class="findboxtitle">${sessionScope.stu_iswork}</th>
						<th class="findboxtitle">${sessionScope.stu_com_name}</th>
						<th class="findboxtitle">${sessionScope.stu_money}</th>
					</tr>
					
					<c:forEach var="m" items="${sessionScope.userinfo}">
						<tr>
							<td><a>${m.stu_id}${m.com_id}</a></td>
							<td><a>${m.stu_no}${m.com_user}</a></td>
							<td><a>${m.stu_name}${m.com_name}</a></td>
							<td><a>${m.stu_iswork}</a></td>
							<td><a>${m.stu_com_name}</a></td>
							<td><a>${m.stu_money}</a></td>
						</tr>	
					</c:forEach>
				</table>
				<div>
				<table class="findboxindex">
					<tr><!-- 选页数 -->
						<td ><a class="lastpage">上一页</a></td>
						<td><a class="pagenum1">1</a></td>
						<td><a class="pagenum2">2</a></td>
						<td><a class="pagenum3">3</a></td>
						<td><a class="pagenum4">4</a></td>
						<td><a class="pagenum5">5</a></td>
						<td><a>...</a></td>
						<td><a class="nextpage">下一页</a></td>
						<td>到</td>
						<td>
							<div>
								<form action="">
								<input type="text" width="5px"/>
								<input type="submit" value="确定"/>
								</form>
							</div>
						</td>
					</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
