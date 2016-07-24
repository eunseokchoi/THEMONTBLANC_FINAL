package mont.blanc.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mont.blanc.common.*;

public class revDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public revDeleteController() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response) ;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response) ;
	}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;	
		response.setContentType("text/html;charset=UTF-8") ;
		PrintWriter out = response.getWriter() ;
		
		DBSQL deletesql = new DBSQL();
		int ok = 0 ;
		try{
			int revID = Integer.parseInt(request.getParameter("revID")) ;		 
			ok = deletesql.revDelete(revID) ;
		}catch(Exception ex){System.out.println("admin_reservationBoardController : "+ex.toString());}		
	
		if(ok==0) {System.out.println("삭제 실패");}
		else {System.out.println("삭제 성공");}
		
		RequestDispatcher dis = request.getRequestDispatcher("./revBoard.do");
		dis.forward(request,response);
	}
}