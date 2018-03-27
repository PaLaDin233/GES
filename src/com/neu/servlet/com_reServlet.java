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
 * Servlet implementation class AddAdminServlet
 */
@WebServlet("/com_reServlet")
public class com_reServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public com_reServlet() {
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
		ComInfoService service=new ComInfoService();
		int flag=service.doReg_com(params);
		if(flag == 1){
			HttpSession session=request.getSession();
			session.setAttribute("errormsg", "注册成功");
			response.sendRedirect("ComLogin.jsp");
		}else if(flag == 2){
			response.sendRedirect("page/com_reg_error1.jsp");
			
		}else{
			response.sendRedirect("page/com_reg_error.jsp");
		}
	}

}
