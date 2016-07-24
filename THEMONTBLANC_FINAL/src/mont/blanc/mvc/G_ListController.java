package mont.blanc.mvc;

import mont.blanc.common.DBSQL;
import mont.blanc.common.DBbean;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class G_ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sql3;
	private String returnPage;
       
    public G_ListController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ListController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ListController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		String pnum="", category_type="", type2="", keyword="", returnpage="";
		int cc=0, dd=0;
		
		try{
			pnum=request.getParameter("pageNUM");
			category_type=request.getParameter("category_type");
			type2=request.getParameter("type2");
			keyword=request.getParameter("keyword");
			
			
			if(pnum==null||pnum.equals("null")){ pnum="1";}
			if(type2==null||type2==""||type2.equals("null")){ type2 = "all" ; }
			if(category_type ==null ||category_type==""||category_type.equals("null")){category_type = "all" ; }
			if(keyword ==null ||keyword==""||keyword.equals("null")){keyword = "" ; }
			
			
			returnpage="&category_type="+category_type+"&type2="+type2+"&keyword="+keyword;
			
			
			System.out.println("list컨트롤러 returnpage = "+returnpage);
			
			DBSQL dbsql=new DBSQL();
			
			int total=dbsql.G_total();
			int sub=dbsql.G_subtotal(category_type, type2, keyword);
			List ob=dbsql.G_boardSelect(pnum,type2,keyword,category_type);	
			System.out.println("listcontroller.java  total = "+total + "   sub = "+sub  );
			
			request.setAttribute("hotel", ob);
			request.setAttribute("total", total);
			request.setAttribute("sub", sub);
			request.setAttribute("returnpage", returnpage);
			
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=guest/m_guest&list=G_guest");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());  }  
	}
}