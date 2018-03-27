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

import com.neu.service.StuInfoService;
import com.neu.util.ConvertUtil;

/**
 * Servlet implementation class AdminSearchStuServelet
 */
@WebServlet("/AdminSearchStuServlet")
public class AdminSearchStuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchStuServlet() {
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
		request.setCharacterEncoding("UTF-8");
		Map<String, String[]> params=request.getParameterMap();
		StuInfoService service=new StuInfoService();
		List<Map<String,String>> list=
				service.findByParams(params);
		HttpSession session=request.getSession();
		session.setAttribute("userinfo", list);
//----------------------------------------------------		
		session.setAttribute("user_id","学生id");
		session.setAttribute("user_no","学号");
		session.setAttribute("user_name","学生姓名");
		session.setAttribute("stu_iswork","是否工作");
		session.setAttribute("stu_com_name","公司名");
		session.setAttribute("stu_money","工资");
		response.sendRedirect("page/userinfo.jsp");
		
	}

}
