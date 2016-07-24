package mont.blanc.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mont.blanc.common.*;

public class revStep1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public revStep1Controller() {
        super();      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("revStep1Controller Start");
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try{
			String checkIn = request.getParameter("from") ;			
			String checkOut = request.getParameter("to") ;
			String ok ;
			int revPop = Integer.parseInt(request.getParameter("nights") ) ;
			int revCap = Integer.parseInt(request.getParameter("Guests") ) ;
			
			System.out.println("checkIn="+checkIn+", checkOut="+checkOut+", Day="+revPop+", capacity="+revCap);
			
			DBSQL revSql = new DBSQL(); 

			List revOkRoom = revSql.revOk(checkIn, checkOut);	
			List okType = revSql.okType(revOkRoom);
													
			if(okType==null){		
				ok = "noData";
				request.setAttribute("checkIn", checkIn) ;
				request.setAttribute("checkOut", checkOut) ;
				request.setAttribute("revPop", revPop) ;
				request.setAttribute("revCap", revCap) ;
				request.setAttribute("ok", ok) ;
				
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=reservation/m_reservation&list=reservation_Step1") ;
				dis.forward(request,response) ;
			}
			
			ok = "ok";
			List all= new ArrayList() ;
			for(int i=0 ; i<okType.size() ; i++){
				String type = (String)okType.get(i) ;
				DBbean bean =revSql.revOkAll(type, revOkRoom);
				all.add(bean) ;
			}
			
			request.setAttribute("revOkRoom", revOkRoom);
			request.setAttribute("revOkType", all);
			request.setAttribute("checkIn", checkIn);
			request.setAttribute("checkOut", checkOut);
			request.setAttribute("revPop", revPop);
			request.setAttribute("revCap", revCap);
			request.setAttribute("ok", ok);
			request.setAttribute("checkflag", request.getParameter("checkflag"));
			
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=reservation/m_reservation&list=reservation_Step1") ;
			dis.forward(request,response);
			
			}catch(Exception ex){System.out.println("revStep1Controller"+ex.toString());}				
	}
}