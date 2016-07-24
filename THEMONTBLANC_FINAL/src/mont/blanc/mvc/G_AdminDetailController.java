package mont.blanc.mvc ;


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


public class G_AdminDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_AdminDetailController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String data=request.getParameter("num");
			String pageNUM=request.getParameter("pageNUM"); 
			String reco=request.getParameter("reco");

			DBSQL dbsql=new DBSQL();
			DBbean aa=dbsql.G_boardDetail(data, reco);

			DBSQL dbsql2=new DBSQL();
			List bb=dbsql2.coSelect(data);	
						
			request.setAttribute("detail", aa);
			request.setAttribute("colist", bb);
			
			request.setAttribute("detail_pageNUM", pageNUM);
			
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=guestDetail");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());  }  
	}//user END
}//class END
