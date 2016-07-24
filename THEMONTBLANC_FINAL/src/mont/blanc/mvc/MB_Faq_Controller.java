package mont.blanc.mvc;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mont.blanc.common.DBbean;
import mont.blanc.common.DBSQL;

public class MB_Faq_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MB_Faq_Controller() {
    	super() ;
    }//con

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		
	}//doPost

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			//int data= Integer.parseInt(request.getParameter("qno"));
			String data1= request.getParameter("fselect");
			String data2= request.getParameter("ftitle");
			String data3= request.getParameter("fname");
			String data4= request.getParameter("ftel");
			String data5= request.getParameter("femail");
			String data6= request.getParameter("fcontents");
			
			DBSQL dbSql = new DBSQL() ;	
			DBbean bean = new DBbean();

			//bean.setQno(data);	
			bean.setQselect(data1);	
			bean.setQtitle(data2);	
			bean.setQname(data3);
			bean.setQtel(data4);
			bean.setQemail(data5);
			bean.setQcontents(data6);
			
			int ok = dbSql.faqdbInsert(bean);
			
			if(ok>0){System.out.println("ok");
				response.sendRedirect("./index.jsp?page=guest/m_guest&list=G_requestInsert");
			}
			else {System.out.println("no");}
		}catch(Exception ex){System.out.println(ex.toString()+"einsert");}
	}//end
}//class