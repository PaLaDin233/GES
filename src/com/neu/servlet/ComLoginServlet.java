package com.neu.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neu.service.ComInfoService;

/**
 * Servlet implementation class ComLoginServlet
 */
@WebServlet("/ComLoginServlet")
public class ComLoginServlet extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<String,String[]> params=request.getParameterMap();
		ComInfoService service=new ComInfoService();
		Map<String, String> map=service.checkLogin(params);
		HttpSession session=request.getSession();
		if(map==null){
			session.setAttribute("errormsg", "用户名或密码错误");
			response.sendRedirect("ComLogin.jsp");
			}
		else{
			session.setAttribute("userid", map.get("com_id"));
			session.setAttribute("com_id", map.get("com_id"));
			session.setAttribute("errormsg", "");
			session.setAttribute("username", map.get("com_name"));
			session.setAttribute("loginpage", "../ComLogin.jsp");
			
			session.setAttribute("menu1href","home_page.jsp");
			session.setAttribute("menu1","首页");
			session.setAttribute("menu2href","FindJobForCom.jsp");
			session.setAttribute("menu2","招聘信息");
			session.setAttribute("menu3href","mod_com_psd.jsp");
			session.setAttribute("menu3","修改密码");
			session.setAttribute("menu4href","release_emp.jsp");
			session.setAttribute("menu4","发布招聘");
			session.setAttribute("errormsg", "");
			response.sendRedirect("/GES/page/home_page.jsp");
		}
	}

}
