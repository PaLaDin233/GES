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
<link href="../css/find_job.css" rel="stylesheet" type="text/css"/>
<link href="../css/release_emp.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">

function choose(){
	var t=document.getElementById("textarea_").value;
	if(t.length > 200){
		alert("内容已超限请修改！");
		return false;
	}
}
      //然后写一个方法把这一大长串的数组给他调到你需要的地方去
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
		<tr>
			<th><a class="menu_option" href = ${sessionScope.menu1href} >${sessionScope.menu1}</a></th>	
			<th><a class="menu_option" href = ${sessionScope.menu2href} >${sessionScope.menu2}</a></th>	
			<th><a class="menu_option" href = ${sessionScope.menu3href} >${sessionScope.menu3}</a></th>	
			<th><a class="menu_option" href = ${sessionScope.menu4href} >${sessionScope.menu4}</a></th>
		</tr>
		</table>
		</div>
		<div class="main_body">
			
			<div class="bodytitle">
				发布招聘信息:
			</div>
			<form action="${pageContext.request.contextPath }/release_empServlet" method="post" onsubmit="return choose()">
			<div class="choosebox">
			<input type="hidden" name="emp_com_id" value=${sessionScope.com_id} />
			<div>招聘标题：<input tytle="text" name="emp_title"></div>
				职位标签：
					<label name="emp_five" ><input name="emp_five" type="checkbox" />五险一金</label>
					<label name="emp_live"><input name="emp_live" type="checkbox" />包吃包住</label>
					<label name="emp_travel"><input name="emp_travel" type="checkbox" />假期旅游</label>
					<label name="emp_year_present"><input name="emp_year_present" type="checkbox" />年终奖</label>
					<label name="emp_moretime_money"><input name="emp_moretime_money" type="checkbox" />加班补偿</label>
				
				<table>
			   	<tr>
			   		<td>
			   			薪资待遇：
				   		<select id="first" name="emp_leftmoney" onchange="change1('');">
				            <option value="不限">不限&nbsp;&nbsp;&nbsp;</option>
				            <option value=0>0</option>
				            <option value=1000>1000</option>
				            <option value=2000>2000</option>
				            <option value=3000>3000</option>
				            <option value=4000>4000</option>
				            <option value=5000>5000</option>
				            <option value=6000>6000</option>
				            <option value=7000>7000</option>
				            <option value=8000>8000</option>
				        </select>
				        -
				        <select id="second" name="emp_rightmoney" onchange="change2('');">
				            <option value="不限">不限&nbsp;&nbsp;&nbsp;</option>
				            <option value=1000>1000</option>
				            <option value=2000>2000</option>
				            <option value=3000>3000</option>
				            <option value=4000>4000</option>
				            <option value=5000>5000</option>
				            <option value=6000>6000</option>
				            <option value=7000>7000</option>
				            <option value=8000>8000</option>
				            <option value=9000>9000</option>
				        </select>
			   		</td>
			   		<td>
			   			 工作地点：
					    <select id="prov" name="emp_place_prov" onchange="change();">
				            <option>--请选择省份--</option>
				        </select>
				        -
				        <select id="city" name="emp_place_city">
				            <option>--请选择城市--</option>
				        </select>
			   		</td>  
			   	</tr>
			   	</table>
			</div> 
			<div class="choosebox">
				招聘内容：
			</div>
			<div class="textarea">
				<textarea id="textarea_" name="emp_detail"></textarea>
				<div class="release_emp_button">
					<input type="reset" value="重置" onclick="Reset()" />
					<input type="submit" value="提交" />
				</div>
			</div>
		</form>
		</div>
	</body>
	
	</body>
</html>