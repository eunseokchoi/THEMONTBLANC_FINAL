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


public class G_AdminDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_AdminDeleteController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DeleteController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DeleteController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String data1=request.getParameter("num");
			
			DBSQL dbsql=new DBSQL();
			DBbean bean=new DBbean();
			
			dbsql.G_dbDelete(data1);
				
			response.sendRedirect("./G_Adminguest.do");
					
		}catch(Exception ex){  System.out.println("수정페이지 실패"+ex.toString());  }  
	}//user END
}//class END
