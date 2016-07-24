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
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.bind.v2.runtime.Location;

import mont.blanc.common.DBSQL;
import mont.blanc.common.DBbean;

public class InfoController extends HttpServlet {	
	private static final long serialVersionUID = 1L;
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();
		DBSQL dbsql = new DBSQL();
		DBbean bean =new DBbean();	
		String NowUser = (String)session.getAttribute("NowUser");
		
		String infouser = request.getParameter("id");
		try {
			if (NowUser.trim().equals("admin")) {
				bean = dbsql.dbInfoMember(infouser);
			} else {
				bean = dbsql.dbInfoMember(NowUser);
			}
		} catch (Exception ex) {
		}

		request.setAttribute("id",bean.getId());
		request.setAttribute("pw",bean.getPw());
		request.setAttribute("gender",bean.getGender());
		request.setAttribute("engname",bean.getEngname());
		request.setAttribute("korname",bean.getKorname());
		request.setAttribute("birthday",bean.getBirthday());
		request.setAttribute("addr",bean.getAddr());
		request.setAttribute("tel",bean.getTel());
		request.setAttribute("email",bean.getEmail());
		
		request.getRequestDispatcher("/login/mb_info.jsp").forward(request, response);;
	}
}