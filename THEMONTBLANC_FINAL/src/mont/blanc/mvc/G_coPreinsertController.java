package mont.blanc.mvc;


import mont.blanc.common.DBbean;
import mont.blanc.common.DBSQL;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class G_coPreinsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_coPreinsertController() { super();  }

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
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("NowUser");
		
		String data1=request.getParameter("num");
		String data2=request.getParameter("cowriter");
		String data3=request.getParameter("cmt");
		System.out.println(data1);
		System.out.println(data2);
		System.out.println(data3);
		
		
		if(id==null||id==""){			
			out.println("<script type='text/javascript'>");
			out.println("alert('글쓰기 권한이 없습니다. 로그인후 이용하세요.')");
			out.println("location.href='./G_guestDetail.do?num="+data1+"&write="+1+"'"); 
			out.println("</script>");
		}else{
			RequestDispatcher dis=request.getRequestDispatcher("G_guestCoInsert.do");
			dis.forward(request, response);
		}

		
			
			
	}//user END
}//class END
