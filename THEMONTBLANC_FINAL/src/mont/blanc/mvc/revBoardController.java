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

public class revBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public revBoardController() {
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
	
	List revBoard = new ArrayList() ;
	
	String order = request.getParameter("order") ; 
	String sort = request.getParameter("sort") ;
	
	if(order==null || sort==null){
		order = "revDate" ;
		sort = "desc" ;
	}
	DBSQL dbsql = new DBSQL() ;
	try{
		revBoard = dbsql.revBoard(sort, order) ;		
	}catch(Exception ex){System.out.println("admin_reservationBoardController : "+ex.toString());}		

	request.setAttribute("revBoard", revBoard) ;
	
	RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=reservation_Board") ;
	dis.forward(request, response) ;
	
	}//user
	
}//class
