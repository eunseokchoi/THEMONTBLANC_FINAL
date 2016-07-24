package mont.blanc.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mont.blanc.common.*;

public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sql3;
	private String returnPage;
       
    public ListController() { super();  }

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
		System.out.println("mont.blanc.ListController.java (member.do) Started");
		try{
			String pnum=request.getParameter("pageNUM");
			String skey=request.getParameter("keyfield");
			String sval=request.getParameter("keyword");
			if(sval==null||skey==null){
				sql3="";
				returnPage="";
			}else{
				sql3="where "+skey+" like '%"+sval+"%'";
				returnPage="&keyfield="+skey+"&keyword="+sval;
			}
			System.out.println(sql3);
			DBSQL dbsql=new DBSQL();
			int bb=dbsql.dbCount(sql3);
			
			List ob=dbsql.dbSelect(pnum, sql3);
						
			request.setAttribute("member", ob);
			request.setAttribute("total", bb);
			request.setAttribute("returnPage", returnPage);
			
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=member");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());  }  
	}//user END
}//class END
