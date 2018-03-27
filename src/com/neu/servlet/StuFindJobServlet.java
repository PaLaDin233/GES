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
import com.neu.service.admin_auditService;

/**
 * Servlet implementation class StuFindJobServlet
 */
@WebServlet("/StuFindJobServlet")
public class StuFindJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StuFindJobServlet() {
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
		admin_auditService service=new admin_auditService();
		List<Map<String,String>> list=
				service.findByParams(params);
		HttpSession session=request.getSession();
		session.setAttribute("empinfo", null);	
		for(int i=0;i<list.size();i++){
			
			if(list.get(i).get("emp_status")==null){
				list.remove(i);i--;
			}
			else if(list.get(i).get("emp_status").equals("已通过")){
				String str=list.get(i).get("emp_uptime").substring(0,8);
				list.get(i).put("emp_uptime", str);
				continue;
			}
			else{
				list.remove(i);i--;
			}
		}
		session.setAttribute("empinfo", list);	
		response.sendRedirect("page/find_job.jsp");
	}
	}

