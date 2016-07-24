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


public class mb_EventModifyController extends HttpServlet {
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
			
			String eUpPath = getServletContext().getRealPath("/event/files");
			MultipartRequest mr = new MultipartRequest(request, eUpPath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			
			int ok = dbsql.dbModifyE(mr);
			if(ok > 0){
				RequestDispatcher dis = request.getRequestDispatcher("mb_event.do?pageType=now&type=admin");	
				dis.forward(request, response);
			}
			
		}catch(Exception ex){ System.out.println(ex); }
	}//end

}//class END
