package mont.blanc.mvc;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import java.io.*;
import java.util.List;

import javax.servlet.http.*;

import mont.blanc.common.DBSQL;
import mont.blanc.common.DBbean;


public class mb_EventController extends HttpServlet {
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
		try{
			PrintWriter out = response.getWriter();
			
			DBSQL dbsql = new DBSQL();
			
			String pnum = request.getParameter("pageNum");
			String Dnum = request.getParameter("num");
			String pageType = request.getParameter("pageType") ;
			String type = request.getParameter("type");
			
			
			List pt = null ;
			
			int pagesize = 3, limit = 3, pagecount = 0, total = 0;
			int start = 0, end = 0, temp = 0;
			int startpage = 1, endpage = 3;
			
			if(pnum==null || pnum==""){
				pnum="1";
			}
			int pageNum = Integer.parseInt(pnum);

			temp =  (pageNum - 1) % pagesize; 
			startpage = pageNum - temp ; 
			endpage = startpage + (pagesize - 1);
						
			start = (pageNum - 1) * limit + 1 ;
			end = pageNum * limit ;
			
			if (Dnum == null || Dnum == "") {
				Dnum = "0";
			} else {
				int num = Integer.parseInt(Dnum);
				List detail = dbsql.dbDetailEAll(num);
				request.setAttribute("detail", detail);
			}
			request.setAttribute("Dnum", Dnum);
				
			if (pageType == null) {
				pageType = "now";
			}
			if(pageType.equals("now")){
				total = dbsql.dbSelectAllENow();
				pt = dbsql.dbSelectENow(start, end);
			}else if(pageType.equals("past")){
				total = dbsql.dbSelectAllEPast();
				pt = dbsql.dbSelectEPast(start, end);
			}
			
			if(total % limit == 0){
				pagecount = ( total / limit );
			}else{
				pagecount = ( total / limit ) + 1;
			}

			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			request.setAttribute("pageType", pageType);
			request.setAttribute("list", pt);
			request.setAttribute("type", type);
			request.setAttribute("total", total);
			request.setAttribute("pageNum", pageNum);
			
			if(type.equals("admin")){
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=event");
				dis.forward(request, response);
			}else{
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=event/m_event&list=event");
				dis.forward(request, response);
			}
			
			
		}catch(Exception ex){ System.out.println(ex); }
	}//end

}//class END
