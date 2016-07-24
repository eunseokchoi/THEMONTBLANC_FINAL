package mont.blanc.mvc;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mont.blanc.common.DBbean;
import mont.blanc.common.DBSQL;

public class MB_Faq_ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MB_Faq_ListController() {
    	super() ;
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		
	}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();			
		try{
			DBSQL dbSql = new DBSQL() ;
			
			String skey=request.getParameter("keyfield");
			String sval=request.getParameter("keyword");		
			String pnum=request.getParameter("pageNUM");

			int limit=5;
			if(pnum==null){ pnum="1";}
			if( skey==null ){ skey="qno"; sval="";}
			int pageNUM = Integer.parseInt(pnum);
			int start = (pageNUM-1)*limit+1;
			int end = pageNUM*limit;
			int totalAll = dbSql.faqdbTotal();
			int total = dbSql.faqdbTotal(skey, sval);
			int pageCount;
			if(total%limit==0){	pageCount = total/limit;}	
			else{pageCount = (total/limit) + 1;}
			int temp = (pageNUM - 1) % limit;		
			int startPage = pageNUM - temp;	
			String returnPage="&keyfield="+skey+"&keyword="+sval;
			
			List<DBbean> ob = dbSql.faqdbSelect(start, end, skey, sval);
			request.setAttribute("list", ob);
			request.setAttribute("totalAll", totalAll);
			request.setAttribute("total", total);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("startPage", startPage);
			request.setAttribute("skey", skey);
			request.setAttribute("sval", sval);
			request.setAttribute("pageNUM", pageNUM );
			request.setAttribute("returnPage", returnPage );
			
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=request") ;
			dis.forward(request,response) ;
		}catch(Exception ex){System.out.println(ex.toString());}
	}//end
}//class
