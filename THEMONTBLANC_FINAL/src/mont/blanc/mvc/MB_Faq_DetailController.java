package mont.blanc.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import java.io.*;
import mont.blanc.common.DBSQL;
import mont.blanc.common.DBbean;

public class MB_Faq_DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(request, response)호출");
	} //end
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(request, response)호출");
	} //end

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		try{
			int data= Integer.parseInt(request.getParameter("num"));
			DBSQL dbSql = new DBSQL();
			DBbean bean = dbSql.faqdbDetail(data);
			
			request.setAttribute("detail",bean);//requestDetail.jsp 문서 연결시켜야죠
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=requestDetail");
	    	dis.forward(request, response);
	
		}catch(Exception ex){ }
	} //end
} //class END










