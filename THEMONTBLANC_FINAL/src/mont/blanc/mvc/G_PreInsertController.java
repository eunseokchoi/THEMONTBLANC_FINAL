package mont.blanc.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class G_PreInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PreInsertController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PreInsertController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("NowUser");
		String data1 = request.getParameter("num");
		System.out.println(data1);
		if(id == null || id==""){
			out.println("<script type='text/javascript'>");
			out.println("alert('글쓰기 권한이 없습니다. 로그인후 이용하세요.')");
			if(data1 != null){
				out.println("location.href='./G_guestDetail.do?num="+data1+"&write="+1+"'"); 
				out.println("</script>");
			}
			out.println("location.href='./G_guest.do'");
			out.println("</script>");
		}else{
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=guest/m_guest&list=G_guestInsert");
			dis.forward(request, response);
		}		
	}
}