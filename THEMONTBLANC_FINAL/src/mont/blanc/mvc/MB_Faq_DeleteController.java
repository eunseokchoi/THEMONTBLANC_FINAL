package mont.blanc.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import mont.blanc.common.DBSQL;

public class MB_Faq_DeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		try{
			out.println("<h1>DeleteController.java</h1>");
			
			int data= Integer.parseInt(request.getParameter("num"));
			DBSQL dbSql = new DBSQL();	
			dbSql.faqdbDelete(data);
			response.sendRedirect("./request.do");	
		}catch(Exception ex){ out.println("삭제 실패"+ex.toString());}
	} //end
} //class END