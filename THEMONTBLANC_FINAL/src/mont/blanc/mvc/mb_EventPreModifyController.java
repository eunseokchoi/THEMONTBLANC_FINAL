package mont.blanc.mvc;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.*;

import java.io.*;
import java.util.List;

import javax.servlet.http.*;

import mont.blanc.common.DBSQL;
import mont.blanc.common.DBbean;


public class mb_EventPreModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GenericServlet config;
	
	public void init(ServletConfig config) throws ServletException {
        super.init(config);
   }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	//	System.out.println("doGet(request, response)ȣ��");
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);	
		//	System.out.println("doPost(request, response)ȣ��");
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try{
			DBbean bean = new DBbean();
			DBSQL dbsql = new DBSQL();
			
			String num = request.getParameter("num");
			bean = dbsql.dbPreModifyE(num);
			
			request.setAttribute("pre", bean);

			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=eventPreModify");	
			dis.forward(request, response);

			
		}catch(Exception ex){ System.out.println(ex); }
	}//end

}//class END
