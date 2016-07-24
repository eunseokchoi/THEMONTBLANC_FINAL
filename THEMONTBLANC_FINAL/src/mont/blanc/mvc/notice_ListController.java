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
import java.util.List;

import javax.servlet.http.*;

public class notice_ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
			try{
				DBSQL dbsql = new DBSQL();
				String pnum = request.getParameter("pageNUM");				
				
				List ob = dbsql.notice_dbSelect(pnum);
				request.setAttribute("list", ob);
				
				int total = dbsql.notice_dbCount();
				request.setAttribute("total",total);

				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=notice");
				dis.forward(request, response);
			}catch(Exception ex){ System.out.println("����: "+ex.toString());}
	}//user()
}
