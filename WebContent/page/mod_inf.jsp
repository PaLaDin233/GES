<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>青岛理工大学GES</title>
<link rel="shortcut icon" type="../image/x-icon" href="icon.png" media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link href="../css/mod_inf.css" rel="stylesheet" type="text/css" />
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
					<td><a class="menu_option"  href = "home_page.jsp">首页</a>	<!-- 超链接到首页界面 --></td>
					<td><a class="menu_option"  href = "mod_stu_psd.jsp">修改密码</a> </td>
					<td><a class="menu_option"  href = "mod_inf.jsp">修改资料</a> </td>
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
		<form action="${pageContext.request.contextPath }/StuModInfServlet" method="post">
			<table class="personal_data_table">
				<tr>
					<input type="hidden" value=${sessionScope.userid} name="stu_id"/>
				</tr>
				<tr>
					<td>学号:</td>
					<td id="userid">${sessionScope.stu_no}</td>
				</tr>
				<tr>
					<td>姓名:</td>
					<td>
				        <input type="text" name="stu_name" id="" value=${sessionScope.username} />
					</td>
				</tr>
				<tr>
					<td>是否就业:</td>
					<td><input type="radio" name="stu_iswork">是
						<input type="radio" name="stu_iswork" checked="checked">否</td>
				</tr>
				<tr>
					<td>公司名:</td>
					<td>
				        <input type="text" name="stu_com_name" id="" value=${sessionScope.stu_com_name} />
					</td>
				</tr>
				<tr>
					<td>工资:</td>
					<td>
				        <input type="text" name="stu_money" id="" value=${sessionScope.stu_money} />
					</td>
				</tr>
				<tr>
					<td>工作地点:</td>
					<td>
				        <select name="stu_place_prov" id="prov" onchange="change();">
				            <option>--请选择省份--</option>
				        </select>
				        <select name="stu_place_city" id="city">
				            <option>--请选择市--</option>
				        </select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div class="personal_data_submit">
						<input type="submit" value="保存" >
						</div>
					</td>
				</tr>
			</table>
		</form>
			
			
		</div>
	</body>
	<script language="javascript" type="text/javascript"
	 src="My97DatePicker/WdatePicker.js"></script>
	 <script type="text/javascript">
   
      var cityList = new Array();
      cityList['--请选择省份--']=['--请选择城市--'];
      cityList['北京市'] = ['--请选择城市--','朝阳区', '东城区', '西城区', '海淀区', '宣武区', '丰台区', '怀柔', '延庆', '房山'];
      cityList['上海市'] = ['--请选择城市--','宝山区', '长宁区', '丰贤区', '虹口区', '黄浦区', '青浦区', '南汇区', '徐汇区', '卢湾区'];
      cityList['广州省'] = ['--请选择城市--','广州市', '惠州市', '汕头市', '珠海市', '佛山市', '中山市', '东莞市'];
      cityList['深圳市'] = ['--请选择城市--','福田区', '罗湖区', '盐田区', '宝安区', '龙岗区', '南山区', '深圳周边'];
      cityList['重庆市'] = ['--请选择城市--','俞中区', '南岸区', '江北区', '沙坪坝区', '九龙坡区', '渝北区', '大渡口区', '北碚区'];
      cityList['天津市'] = ['--请选择城市--','和平区', '河西区', '南开区', '河北区', '河东区', '红桥区', '塘古区', '开发区'];
      cityList['江苏省'] = ['--请选择城市--','南京市', '苏州市', '无锡市'];
      cityList['浙江省'] = ['--请选择城市--','杭州市', '宁波市', '温州市'];
      cityList['四川省'] = ['--请选择城市--','四川省', '成都市'];
      cityList['海南省'] = ['--请选择城市--','海口市'];
      cityList['福建省'] = ['--请选择城市--','福州市', '厦门市', '泉州市', '漳州市'];
      cityList['山东省'] = ['--请选择城市--','济南市', '青岛市', '烟台市'];
      cityList['江西省'] = ['--请选择城市--','江西省', '南昌市'];
      cityList['广西省'] = ['--请选择城市--','柳州市', '南宁市'];
      cityList['安徽省'] = ['--请选择城市--','安徽省', '合肥市'];
      cityList['河北省'] = ['--请选择城市--','邯郸市', '石家庄市','保定市'];
      cityList['河南省'] = ['--请选择城市--','郑州市', '洛阳市'];
      cityList['湖北省'] = ['--请选择城市--','武汉市', '宜昌市'];
      cityList['湖南省'] = ['--请选择城市--','湖南省', '长沙市'];
      cityList['陕西省'] = ['--请选择城市--','陕西省', '西安市'];
      cityList['山西省'] = ['--请选择城市--','山西省', '太原市'];
      cityList['黑龙江省'] = ['--请选择城市--','黑龙江省', '哈尔滨市'];
      cityList['其他'] = ['--请选择城市--','其他'];
//科普小知识
      
      //然后写一个方法把这一大长串的数组给他调到你需要的地方去
      function change() {
          var pVal = document.getElementById("prov").value; //获取省份列表中的值
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
      function Reset() {  	 
         var c = document.getElementById("city"); //获取城市列表
         c.options.length = 0; //清楚当前城市列表中的值
		 c.add(new Option("--请选择城市--", "--请选择城市--"), null);
	 }
      function all() {
          var p = document.getElementById("prov"); 
          for (var i in cityList) { 
          	if(i!="--请选择省份--")
              p.add(new Option(i, i), null);
          }
      }
      window.onload=all;
     
	function checkName(){
		var pwd=document.getElementById("phone_number").value;
		var reg=/^[1][345678][0-9]{9}$/;
		var msg=document.getElementById("name_msg");
		if(reg.test(pwd))	
		{
			msg.innerHTML="√";
			msg.className="personal_data_success";
			return true;
		}
		msg.innerHTML="输入号码有误";
		msg.className="personal_data_error";
		return false;
	}
	function focusName(obj){
		var msg=document.getElementById("name_msg");
		msg.innerHTML="*11位中国大陆号码";
		msg.className="";
		//让控件中的内容高亮显示(全选)
		obj.select();
	}
	function personal_Name(obj){
		var msg=document.getElementById("personal_msg");
		msg.className="";
		//让控件中的内容高亮显示(全选)
		obj.select();
	}
	</script>
</html>