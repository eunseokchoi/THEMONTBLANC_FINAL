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


public class G_AdminListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sql3;
	private String returnPage;
       
    public G_AdminListController() { super();  }

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
		
		try{
			String pnum=request.getParameter("pageNUM");
					
			if(pnum==null||pnum.equals("null")){ pnum="1";}
			
			DBSQL dbsql=new DBSQL();
			int bb=dbsql.G_total();
			List ob=dbsql.G_boardSelect(pnum);
						
			request.setAttribute("hotel", ob);
			request.setAttribute("total", bb);
			
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=guest");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());  }  
	}//user END
}//class END
