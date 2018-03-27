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
import com.neu.util.ConvertUtil;

/**
 * Servlet implementation class StuModInfServlet
 */
@WebServlet("/StuModInfServlet")
public class StuModInfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StuModInfServlet() {
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

			Map<String,String[]> params=request.getParameterMap();//获取表单的值

			StuInfoService service=new StuInfoService();
			boolean flag=service.doUpdate(params);
			HttpSession session=request.getSession();
			if(flag){
				response.sendRedirect("page/success.jsp");
			}else{
				response.sendRedirect("page/error.jsp");
			}
			
	}

}
