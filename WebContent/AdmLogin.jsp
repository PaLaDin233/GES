<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>青岛理工大学毕业生就业信息系统</title>
<link rel="shortcut icon" type="image/x-icon" href="icon.png" media="screen" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var code;
function createCode() 
{
 code = "";
 var codeLength = 4; //验证码的长度
 var checkCode = document.getElementById("ver_img");
 var codeChars = new Array(
		0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
      'a','b','c','d','e','f','g','h',
      'i','j','k','l','m','n','o','p',
      'q','r','s','t','u','v','w','x',
      'y','z',
      'A','B','C','D','E','F','G','H',
      'I','J','K','L','M','N','O','P',
      'Q','R','S','T','U','V','W','X',
      'Y','Z'); //所有候选组成验证码的字符，当然也可以用中文的
 for(var i = 0; i < codeLength; i++) 
 {
  var charNum = Math.floor(Math.random() * 52);
  code += codeChars[charNum];
 }
 if(checkCode) 
 {
  checkCode.className = "code";
  checkCode.innerHTML = code;
 }
}
function validate() 
{
 var inputCode=document.getElementById("ver_code").value;
 var name=document.getElementById("username").value;
 var password=document.getElementById("password").value;

 if(name.length<=0)
 {
 	alert("请输入用户名！")
 	return false;
 }
 else if(password.length<=0)
 {
 	alert("请输入密码！")
 	return false;
 }
 else if(inputCode.length <= 0) 
 {
  alert("请输入验证码！");
  return false;
 }
 else if(inputCode.toUpperCase() != code.toUpperCase()) 
 {
   alert("验证码输入有误！");
   createCode();
   return false;
 }
 else{
	 return true;
 }
}  
function all(){
	createCode();
}
window.onload=all;
</script>
</head>
<body>
		
		<br><br><br><br><br><br>
		<table align="center">
			<tr>
				<td><img src="img/icon.png" width="100px" height="100px" align="center"></img></td>
				<td class="title">青岛理工大学毕业生就业信息系统</td>
			</tr>
		</table>
		<br>
		<form action="${pageContext.request.contextPath}/AdminLoginServlet" method="post" onsubmit="return validate()">
		<table class="loginTable" border="0">
			<tr>
				<th class="logintitle" colspan="3">管理员登陆</th>
			</tr>
			<tr>
				<td class="logintype">管理员账号</td>
				<td><input type="text" name="adm_no" id="username"></input>
				<div id="errormsg">${sessionScope.errormsg}</div></td>
			</tr>
			<tr>
				<td class="logintype">密码</td>
				<td><input type="password" name="adm_psd" id="password"></input></td>
			</tr>
			<tr>
				<td class="logintype">验证码</td>
				<td>
					<div class="vercode">
						<input id="ver_code" type="text"></input>
					</div>
					<div id="ver_img" onclick="createCode()">更换验证码</div>
					<!--  <img id="ver_img" alt="验证码显示失败" src="这里是验证码图片的链接"></img>-->
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value="登陆" href="Admlogin.jsp"></input>
				</td>
				
			</tr>
		</table>
		</form>
</body>

</html>