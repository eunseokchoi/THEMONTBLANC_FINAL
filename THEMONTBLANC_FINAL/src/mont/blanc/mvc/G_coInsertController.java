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


public class G_coInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_coInsertController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("coInsertController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("coInsertController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String data1=request.getParameter("num");
			String data2=request.getParameter("cowriter");
			String data3=request.getParameter("cmt");
			System.out.println(data1);
			System.out.println(data2);
			System.out.println(data3);
			
			DBSQL dbsql=new DBSQL();
			DBbean bean=new DBbean();			
						
			bean.setNum(Integer.parseInt(data1));
			bean.setCowriter(data2);		
			bean.setCmt(data3);
			
			int ok=dbsql.coInsert(bean, data1);
			//request.setAttribute("coinsert", bean1);
			
			if(ok>0){
				request.setAttribute("num", data1);
				RequestDispatcher dis=request.getRequestDispatcher("./G_guestDetail.do");
				dis.forward(request, response);
			}//if END
			
		}catch(Exception ex){  System.out.println("글 등록실패");  }  
	}//user END
}//class END
