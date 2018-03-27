<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%>
<!DOCTYPE html>

<html>
<head>
<meta charset = "UTF-8">
<title>寻找工作GES</title>
<link rel="shortcut icon" type="../image/x-icon" href="icon.png" media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link href="../css/find_job.css" rel="stylesheet" type="text/css"/>

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
		<tr>
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
		
			<div class="choosebox"><!-- 搜索框 -->
			<form action="${pageContext.request.contextPath}/StuFindJobServlet">
			<input type="submit" value="刷新"/></form>
			</div>	

			
			<div class="findbox"><!-- 招聘标题框 -->
				<table class="findbox">		
					<tr>
						<th class="findboxtitle">招聘标题</th>
						<th class="findboxtitle">招聘内容</th>
						<th class="findboxtitle">公司ID</th>
						<th class="findboxtitle">职位月薪</th>
						<th class="findboxtitle">工作地点</th>
						<th class="findboxtitle">发布时间</th>
					</tr>
				
				
				
				
					<c:forEach var="m" items="${sessionScope.empinfo}">
						<tr>
							<td><a>${m.emp_title}</a></td>
							<td><a>${m.emp_detail}</a></td>
							<td><a>${m.emp_com_id}</a></td>
							<td><a>${m.emp_leftmoney}-${m.emp_rightmoney}</a></td>
							<td><a>${m.emp_place_prov}-${m.emp_place_city}</a></td>
							<td><a>${m.emp_uptime}</a></td>
						</tr>	
					</c:forEach>
				</table>

			</div>
		</div>
	</body>
 <script type="text/javascript">
	 function change1() {
	     var p = document.getElementById("first"); 
	     var c = document.getElementById("second");
	     if(c.value<=p.value&&c.value!="不限"&&p.value!="不限"){
	    	    c.value="不限";
	     }	
	  }
	  function change2() {
	      var p = document.getElementById("first"); 
	      var c = document.getElementById("second");
	      if(c.value<=p.value&&c.value!="不限"&&p.value!="不限"){
	    	 	p.value="不限";
	      }	
	   }

       
	        //首先建立一个你需要省，和它对应的市的数组，如下：
	        var cityList = new Array();
	        cityList['--请选择省份--']=['--请选择市--'];
	        cityList['北京市'] = ['朝阳区', '东城区', '西城区', '海淀区', '宣武区', '丰台区', '怀柔', '延庆', '房山'];
	        cityList['上海市'] = ['宝山区', '长宁区', '丰贤区', '虹口区', '黄浦区', '青浦区', '南汇区', '徐汇区', '卢湾区'];
	        cityList['广州省'] = ['广州市', '惠州市', '汕头市', '珠海市', '佛山市', '中山市', '东莞市'];
	        cityList['深圳市'] = ['福田区', '罗湖区', '盐田区', '宝安区', '龙岗区', '南山区', '深圳周边'];
	        cityList['重庆市'] = ['俞中区', '南岸区', '江北区', '沙坪坝区', '九龙坡区', '渝北区', '大渡口区', '北碚区'];
	        cityList['天津市'] = ['和平区', '河西区', '南开区', '河北区', '河东区', '红桥区', '塘古区', '开发区'];
	        cityList['江苏省'] = ['南京市', '苏州市', '无锡市'];
	        cityList['浙江省'] = ['杭州市', '宁波市', '温州市'];
	        cityList['四川省'] = ['四川省', '成都市'];
	        cityList['海南省'] = ['海口市'];
	        cityList['福建省'] = ['福州市', '厦门市', '泉州市', '漳州市'];
	        cityList['山东省'] = ['济南市', '青岛市', '烟台市'];
	        cityList['江西省'] = ['江西省', '南昌市'];
	        cityList['广西省'] = ['柳州市', '南宁市'];
	        cityList['安徽省'] = ['安徽省', '合肥市'];
	        cityList['河北省'] = ['邯郸市', '石家庄市','保定市'];
	        cityList['河南省'] = ['郑州市', '洛阳市'];
	        cityList['湖北省'] = ['武汉市', '宜昌市'];
	        cityList['湖南省'] = ['湖南省', '长沙市'];
	        cityList['陕西省'] = ['陕西省', '西安市'];
	        cityList['山西省'] = ['山西省', '太原市'];
	        cityList['黑龙江省'] = ['黑龙江省', '哈尔滨市'];
	        cityList['其他'] = ['其他'];
			//科普小知识
	        
	        //然后写一个方法把这一大长串的数组给他调到你需要的地方去
	        function change() {
	            var pVal = document.getElementById("province").value; //获取省份列表中的值
	            var c = document.getElementById("city"); //获取城市列表
	            c.options.length = 0; //清楚当前城市列表中的值
	            for (var i in cityList) { //循环遍历cityList的属性
	                if (i == pVal) { //判断当i等于省份列表中的值时;
	                    for (var j in cityList[i]) { //循环遍历cityList[i]的属性
	                        c.add(new Option(cityList[i][j], cityList[i][j]), null)
	                        //城市列表的末尾增加一个<option>选项，text：cityList[i][j]，value：cityList[i][j]
	                    }
	                    break;
	                }
	            }
	        }
	
	        function all() {
	            var p = document.getElementById("province"); //获取省份列表
	            for (var i in cityList) { //循环遍历cityList的属性
	            	if(i!="--请选择省份--")
	                p.add(new Option(i, i), null);
	                //省份列表的末尾增加一个<option>选项，text：i，value：i
	            }
	            p = document.getElementById("lowmoney"); 
	            for (var i in moneyList) { 
	            	if(i!="不限")
	                p.add(new Option(i, i), null);
	            }
	        }
	        window.onload = all;
	
	    </script>
</html>
