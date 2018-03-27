package com.neu.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neu.service.AdminInfoService;
/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		//String name=request.getParameter("adm_no");
		Map<String,String[]> params=request.getParameterMap();//获取表单的值
		//Map<String,String> map=ConvertUtil.convertMap(params);//转化为支持的数据类型
		AdminInfoService service=new AdminInfoService();
		Map<String, String> map=service.checkLogin(params);
		HttpSession session=request.getSession();
		//HttpSession session=request.getSession();
		if(map==null){
			session.setAttribute("errormsg", "用户名或密码错误");//登陆界面提示错误信息
			response.sendRedirect("AdmLogin.jsp");//返回登陆界面继续操作
			}
		else{
			session.setAttribute("errormsg", "");//清空登陆界面错误信息
			session.setAttribute("username", map.get("adm_name"));//获取用户名
			session.setAttribute("userid", map.get("adm_id"));
			session.setAttribute("menu1href","home_page.jsp");//设置菜单1为首页
			session.setAttribute("menu1","首页");
			session.setAttribute("menu2href","admin_audit.jsp");//菜单2为审核招聘界面
			session.setAttribute("menu2","审核招聘");
			session.setAttribute("menu3href","admin_manage.jsp");//菜单3为管理用户界面
			session.setAttribute("menu3","管理用户");
			session.setAttribute("menu4href","mod_admin_psd.jsp");//清空菜单第四个选项
			session.setAttribute("menu4","修改密码");
			session.setAttribute("loginpage", "../AdmLogin.jsp");//获取注销后到达界面
			response.sendRedirect("/GES/page/home_page.jsp");
		}
		//List<Map<String,String>> list=service.findByParams(params);
		//if(list.get("adm_no")==name){//存在用户且密码正确	
		//	if(list.get("adm_psd")==psd){
		//		System.out.println("成功");
		//	}
		//	else{
		//		System.out.println("密码错误");
		//	}
			//response.sendRedirect("home_page.jsp");
		//}
		//else{//密码错误或不存在用户
			
		//	System.out.println("用户名不存在");
			//response.sendRedirect("error.jsp");
		//}
	}

}
