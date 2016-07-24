package mont.blanc.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import mont.blanc.common.DBSQL;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response); 
	} //end

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/xml;charset=UTF-8");
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
			String id = (String)session.getAttribute("NowUser"); 
			System.out.println(id);
			DBSQL dbsql = new DBSQL();
			String id2=request.getParameter("id");
			if(id.trim().equals("admin")){			
				System.out.println(id2+"회원삭제 완료");
					dbsql.dbDelete(id2);
			}else{
					System.out.println(id2+"회원탈퇴 완료");
					dbsql.dbDelete(id);
					session.invalidate();
				}
			
			
			request.setAttribute("result", 2);
			request.getRequestDispatcher("./index.jsp").forward(request, response);
			} catch (Exception ex) {ex.toString();}
		
	}
}
