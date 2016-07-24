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


public class G_EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_EditController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			int data=Integer.parseInt(request.getParameter("num"));
			String data1=request.getParameter("title");
			String data2=request.getParameter("contents");
			String data4=request.getParameter("pwd");
			
			DBSQL dbsql=new DBSQL();
			DBbean bean=new DBbean();
			
			bean.setNum(data);
			bean.setTitle(data1);
			bean.setContents(data2);
			
			
			int ok=dbsql.G_dbEdit(bean);
			if(ok>0){ System.out.println("수정 성공"); }
			DBbean aa=dbsql.G_boardDetail(request.getParameter("num"));
			request.setAttribute("detail", aa);
			
			RequestDispatcher dis=request.getRequestDispatcher("./G_guestDetail.do");
			dis.forward(request, response);
					
		}catch(Exception ex){  System.out.println("수정페이지 실패"+ex.toString());  }  
	}//user END
}//class END
