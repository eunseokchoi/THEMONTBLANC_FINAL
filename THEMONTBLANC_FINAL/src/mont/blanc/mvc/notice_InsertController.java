package mont.blanc.mvc;

import java.io.IOException;
import java.io.PrintWriter;

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

public class notice_InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	public void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
				String data2 = request.getParameter("title");
				String data3 = request.getParameter("contents");
				
				String data4 = request.getParameter("name");
				
				DBSQL dbsql = new DBSQL();
				DBbean bean = new DBbean();	// bean ������ ���� ����
				
				System.out.println(data2+data3+data4);
				bean.setTitle(data2);
				bean.setContents(data3);
				bean.setName(data4);
			
				
				int ok = dbsql.notice_dbInsert(bean);
					if(ok > 0){
						response.sendRedirect("./notice.do");
					}
			}catch(Exception ex){ ex.toString();}
	}//user()
}
