package com.neu.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neu.service.ComInfoService;
import com.neu.service.StuInfoService;

/**
 * Servlet implementation class AdminSearchComServlet
 */
@WebServlet("/AdminSearchComServlet")
public class AdminSearchComServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchComServlet() {
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
		request.setCharacterEncoding("UTF-8");
		Map<String, String[]> params=request.getParameterMap();
		ComInfoService service=new ComInfoService();
		List<Map<String,String>> list=
				service.findByParams(params);
		HttpSession session=request.getSession();
		session.setAttribute("userinfo", list);
//----------------------------------------------------		
		session.setAttribute("user_id","企业id");
		session.setAttribute("user_no","企业用户名");
		session.setAttribute("user_name","企业名");
		session.setAttribute("stu_iswork"," ");
		session.setAttribute("stu_com_name"," ");
		session.setAttribute("stu_money"," ");
		response.sendRedirect("page/userinfo.jsp");
	}

}
