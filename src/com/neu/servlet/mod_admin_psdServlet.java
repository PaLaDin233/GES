package com.neu.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neu.service.AdminInfoService;
import com.neu.service.ComInfoService;
import com.neu.service.StuInfoService;

/**
 * Servlet implementation class AddAdminServlet
 */
@WebServlet("/mod_admin_psdServlet")
public class mod_admin_psdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mod_admin_psdServlet() {
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
		request.setCharacterEncoding("UTF-8");
		Map<String, String[]> params=request.getParameterMap();
		AdminInfoService service=new AdminInfoService();
		int flag = service.check_psd(params);
		System.out.println(flag);
		if(flag == 2)
			response.sendRedirect("page/mod_success.jsp");
		if(flag == 3)
			response.sendRedirect("page/mod_error.jsp");
		if(flag == 0)
			response.sendRedirect("page/mod_error1.jsp");
	}

}


