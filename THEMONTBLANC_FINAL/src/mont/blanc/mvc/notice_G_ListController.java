package mont.blanc.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mont.blanc.common.*;

import javax.servlet.*;

import java.io.*;
import java.util.List;

public class notice_G_ListController extends HttpServlet {
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
				
				System.out.println(ob);
				
				int total = dbsql.notice_dbCount();
				request.setAttribute("total",total);

				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=notice/m_notice&list=G_notice");
				dis.forward(request, response);
			}catch(Exception ex){ System.out.println("notice_G_ListController ERROR: "+ex.toString());}
	}//user()
}
