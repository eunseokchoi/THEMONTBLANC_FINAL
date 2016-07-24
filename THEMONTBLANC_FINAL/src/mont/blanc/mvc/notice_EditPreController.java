package mont.blanc.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mont.blanc.common.DBbean;
import mont.blanc.common.DBSQL;

import javax.servlet.*;

import java.io.*;

import javax.servlet.http.*;

public class notice_EditPreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//doGet
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//doPost
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			int data = Integer.parseInt(request.getParameter("num"));
			DBSQL dbsql = new DBSQL();
		
			DBbean bean = dbsql.notice_dbDetail(data);
			
			request.setAttribute("edit", bean);
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=noticeEdit");
			dis.forward(request, response);
		}catch(Exception ex){out.println("���� ���� :" + ex.toString());}
	}//user
}//class