<!-- 这是所有界面的模版，不是具体的某个界面 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>青岛理工大学GES</title>
<link rel="shortcut icon" type="../image/x-icon" href="icon.png" media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
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
					<th><a class="menu_option" href = ${sessionScope.menu1href} >${sessionScope.menu1}</a></th>	
					<th><a class="menu_option" href = ${sessionScope.menu2href} >${sessionScope.menu2}</a></th>	
					<th><a class="menu_option" href = ${sessionScope.menu3href} >${sessionScope.menu3}</a></th>	
					<th><a class="menu_option" href = ${sessionScope.menu4href} >${sessionScope.menu4}</a></th>	
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
<script language="javascript">
			   var my = new Date();
			   function showc(){
				    var k=1;
				    var j=1;
				    var today;
				    var tomonth;
				    var theday=1;//日期
				    var max;
				    var temp;
				    var tempday;//这个月第一天的星期
				    document.write ("<b class='month'>" + my.getFullYear() + "-" + (my.getMonth()+1) + "</b>");
				    //标题几年几月
				    document.write ("<div class='day'>");
				    document.write ("<br><table class='day' align='center'>");
				    //整个日历的边框和大小 
				    document.write ("<tr>");
				    document.write ("<td><font color='red'>Sun</font></td>");
				    document.write ("<td>Mon</td>");
				    document.write ("<td>Tue</td>");
				    document.write ("<td>Wed</td>");
				    document.write ("<td>Thu</td>");
				    document.write ("<td>Fri</td>");
				    document.write ("<td>Sat</td>");
				    document.write ("</tr>");
				    temp=my.getDate();
				    my.setDate(1);
				    //document.write (my.getDate());
				    tempday=my.getDay();//返回第一天是星期几
				    my.setDate(temp);
				    today=my.getDay();//返回现在星期几
				    
				    switch ((my.getMonth()+1)) {
					    case 1:
					    case 3:
					    case 5:
					    case 7:
					    case 8:
					    case 10:
					    case 12:
					    max=31;
					    break;
					    case 4:
					    case 6:
					    case 9:
					    case 11:
					    max=30;
					    break;
					    default:
					    max=29;//这里没有考虑闰月！！
					    //document.write (max);
				    }
				    for(k=0;k<6;k++) {
				    	document.write ("<tr>");
				    	for(j=0;j<=6;j++) {
				    		document.write ("<td height='23' width='39'>");
				    		if(j>=(tempday)) {
				    			tempday=0;//设置为最小，相当于取消判断条件
				   				if(theday<=max) {
				    				 if(theday==my.getDate())
				     					document.write ("<font color='#fbd97d'>[" + theday + "]</font>");
				    				else if(j==0)
				    					 document.write ("<font color='red'>" + theday + "</font>");
				    				 else
				    					 document.write (theday);
				     				theday++;
				    			}
				    		}
				    		document.write ("</td>");
				   		 }
				    	document.write ("</tr>");
				    }
				    document.write ("</table>");
				    document.write ("</div>");
			   }
			   showc();
			</script>
		</div>
	</body>
</html>