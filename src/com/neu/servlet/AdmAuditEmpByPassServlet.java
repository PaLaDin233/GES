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

import com.neu.service.admin_auditService;

/**
 * Servlet implementation class AdmAuditEmpByPassServlet
 */
@WebServlet("/AdmAuditEmpByPassServlet")
public class AdmAuditEmpByPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmAuditEmpByPassServlet() {
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
		for(int i=0;i<list.size();i++){
			if(list.get(i).get("emp_status")==null)
			{
				
				//list.get(i).put("emp_status", "未审核");
				list.remove(i);
				i--;
			}
			else if(list.get(i).get("emp_status").equals("0")){
				//list.get(i).put("emp_status", "未通过");
				list.remove(i);
				i--;
				continue;
			}
			else if(list.get(i).get("emp_status").equals("1")){
				list.get(i).put("emp_status", "已通过");
				//list.remove(i);
				//i--;
				continue;
			}
			else{
				list.remove(i);
				i--;
				continue;
			}
			
		}
		session.setAttribute("admin_audit", list);
		response.sendRedirect("page/find_job.jsp");
	}

}
