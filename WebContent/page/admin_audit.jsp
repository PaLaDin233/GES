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
<title>审核招聘信息</title>

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
				<tr >
					<th><a class="menu_option" href = ${sessionScope.menu1href} >${sessionScope.menu1}</a></th>	
					<th><a class="menu_option" href = ${sessionScope.menu2href} >${sessionScope.menu2}</a></th>	
					<th><a class="menu_option" href = ${sessionScope.menu3href} >${sessionScope.menu3}</a></th>	
					<th><a class="menu_option" href = ${sessionScope.menu4href} >${sessionScope.menu4}</a></th>	
				</tr>
			</table>
		</div>
		
		
		
		<div class="main_body">
				<div class="findbox"><!-- 招聘标题框 -->
					<div>
					<table class="findboxindex">
						<%!  
						    public static final String DRIVER = "com.mysql.jdbc.Driver";  
						    public static final String USER = "root";  
						    public static final String PASS = "root";  
						    public static final String URL = "jdbc:mysql://localhost:3306/ges";  
						    public static final int PAGESIZE = 16;  
						    int pageCount;  
						    int curPage = 1;  
						%>
					</table>
					</div>
					
					<table class="findbox">		
					
						<tr>
					
							<th class="findboxtitle">招聘标题</th>
							<th class="findboxtitle">公司名称</th>
							<th class="findboxtitle">发布时间</th>
							<th class="findboxtitle">审核状态</th>
							<th class="findboxtitle">操作</th>
						</tr>
						
						
						<%  
					    //一页放5个  
							    String user = null;  
							    String pass = null;  
							    try{  
							        Class.forName(DRIVER);  
							        Connection con = DriverManager.getConnection(URL,USER,PASS);  
							        String sql = "SELECT emp_id,emp_title,emp_uptime,emp_status FROM tb_emp";
							        PreparedStatement stat = con.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);  
							        ResultSet rs = stat.executeQuery();  
							        rs.last();  
							        int size = rs.getRow();  
							        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
							        String tmp = request.getParameter("curPage");  
							        if(tmp==null){
							            tmp="1";  
							        }  
							        curPage = Integer.parseInt(tmp);  
							        if(curPage>=pageCount) curPage = pageCount;  
							        if(curPage<=1) curPage = 1;  
							        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);  
							        
							        int count = 0;  
							          
							        do{  
							            if(count>=PAGESIZE)break;  
							            int emp_id = rs.getInt(1);  
							            String emp_title = rs.getString(2);
							            
							            
							            
							            
							            String emp_uptime1 = rs.getString(3);
							            StringBuffer res = new StringBuffer();
							            res.append(emp_uptime1.substring(0, 4));
							            res.append("年");
							            res.append(emp_uptime1.substring(4, 6));
							            res.append("月");
							            res.append(emp_uptime1.substring(6, 8));
							            res.append("日");
							            res.append(emp_uptime1.substring(8, 10));
							            res.append("时");
							            res.append(emp_uptime1.substring(10, 12));
							            res.append("分");
							            String emp_uptime = res + "";      
							            
							            String emp_status = rs.getString(4);  
							            count++;  
							            %>  
							        <tr>  
							   			<td><%=emp_id%></td>  
										<td class="jobtitle"><a href=".jsp"><%=emp_title%></a></td>
							  
							            <td>
							            	<%=emp_uptime%></td>  
							            
							            <td id="ab_<%=emp_id%>"><%=emp_status%></td>
											
										<td><a href="javascript:doyes('<%=emp_id%>')">同意</a>
											<a href="javascript:dono('<%=emp_id%>')">不同意</a>
										</td>
							           
							             
							        </tr>  
							            <%  
							        }while(rs.next());  
							        con.close();  
							    }  
							    catch(Exception e){  
							          
							    }  
							%>  
						
					</table>
				<div>
				
		
				<table class="findboxindex">
					<tr><!-- 选页数 -->
						<td><a href = "admin_audit.jsp?curPage=1" >首页</a></td>
						<td><a href = "admin_audit.jsp?curPage=<%=curPage-1%>" >上一页</a></td>
						<td><a href = "admin_audit.jsp?curPage=<%=curPage+1%>" >下一页</a></td>
						<td><a href = "admin_audit.jsp?curPage=<%=pageCount%>" >尾页</a></td>
						<td>第<%=curPage%>页/共<%=pageCount%>页 </td>		
					</tr>
				</table>
		
				
					
				</div>
			</div>
		</div>
		
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/admin_audit.js"></script>
	<script type="text/javascript">
		var doyes=function(n){
			var url="${pageContext.request.contextPath }/admin_auditalteryesServlet?emp_id="+n+"&emp_status=1";
			
			doAjax(url,n);
		};
		var dono=function(n){
			var url="${pageContext.request.contextPath }/admin_auditalternoServlet?emp_id="+n+"&emp_status=2";  
			doAjax(url,n);
		};
		
	</script>
</html>
