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

public class revCalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public revCalController() {
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
	
	int year = 1981 ;
	int month = 10 ;
	int day = 24 ;
	int lastDay = 30 ;
	int week = 1 ;
	String getYear ;
	String getMonth ;
	String getDay ;

try{
	getYear = request.getParameter("setYear") ;
	getMonth = request.getParameter("setMonth") ;
	getDay = request.getParameter("setDay") ;
	
	Calendar cal = Calendar.getInstance() ;
	if(getYear==null || getMonth==null || getDay==null ) {}
	else {cal.set(Integer.parseInt(getYear), Integer.parseInt(getMonth), Integer.parseInt(getDay) );}  //else
	
	year = cal.get(Calendar.YEAR) ;
	month = cal.get(Calendar.MONTH) ;
	day = cal.get(Calendar.DAY_OF_MONTH) ;
	lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH) ;
	
	cal.set(year, month, 1) ;
	week = cal.get(cal.DAY_OF_WEEK) ;
	
	DBSQL adsql = new DBSQL() ;
	String dateStart = year+"/"+(month+1)+"/1" ;
	String dateEnd = year+"/"+(month+1)+"/"+lastDay ;
	List roomAll = new ArrayList() ;
	List revAll = new ArrayList() ;
	
	roomAll = adsql.roomAll();
	revAll = adsql.revAll(dateStart, dateEnd);
	
	request.setAttribute("setYear", year) ;
	request.setAttribute("setMonth", month) ;
	request.setAttribute("setDay", day) ;
	request.setAttribute("setLastDay", lastDay) ;
	request.setAttribute("setWeek", week) ;
	request.setAttribute("roomAll", roomAll) ;
	request.setAttribute("revAll", revAll) ;
	System.out.println(year+month);
	RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=reservation_Cal") ;
	dis.forward(request, response) ;
	
}catch(Exception ex){System.out.println("contriller : "+ex.toString());}		


	}//user
	
}//class
