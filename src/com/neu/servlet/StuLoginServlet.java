package com.neu.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neu.service.StuInfoService;

/**
 * Servlet implementation class StuinfoServlet
 */
@WebServlet("/StuLoginServlet")
public class StuLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StuLoginServlet() {
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
		Map<String,String[]> params=request.getParameterMap();//获取表单的值
		StuInfoService service=new StuInfoService();
		Map<String, String> map=service.checkLogin(params);
		HttpSession session=request.getSession();
		
		if(map==null){
			session.setAttribute("errormsg", "用户名或密码错误");
			response.sendRedirect("StuLogin.jsp");
			}
		else{
			session.setAttribute("errormsg", "");
			session.setAttribute("username", map.get("stu_name"));
			session.setAttribute("userid", map.get("stu_id"));
			session.setAttribute("stu_no", map.get("stu_no"));
			session.setAttribute("stu_com_name", map.get("stu_com_name"));
			session.setAttribute("stu_money", map.get("stu_money"));
			session.setAttribute("stu_place_prov", map.get("stu_place_prov"));
			session.setAttribute("stu_place_city", map.get("stu_place_city"));
			session.setAttribute("loginpage", "../StuLogin.jsp");
			session.setAttribute("menu1href","home_page.jsp");
			session.setAttribute("menu1","首页");
			session.setAttribute("menu2href","find_job.jsp");
			session.setAttribute("menu2","招聘信息");
			session.setAttribute("menu3href","mod_stu_psd.jsp");
			session.setAttribute("menu3","个人中心");
			session.setAttribute("menu4href","");
			session.setAttribute("menu4","");
			
			response.sendRedirect("/GES/page/home_page.jsp");
		}
	}

}
