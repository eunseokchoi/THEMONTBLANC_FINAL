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

public class ModifyController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("mont.blanc.mvc/ModifyController Start");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();		
		HttpSession session = request.getSession();
		DBSQL dbsql = new DBSQL();
		DBbean bean = new DBbean();	
		bean.setId(request.getParameter("id"));
		bean.setPw(request.getParameter("pw"));
		bean.setGender(request.getParameter("gender"));
		bean.setEngname(request.getParameter("engname"));
		bean.setKorname(request.getParameter("korname"));
		bean.setBirthday(request.getParameter("birthday"));
		bean.setEmail(request.getParameter("email"));
		bean.setAddr(request.getParameter("addr"));
		bean.setTel(request.getParameter("tel"));
	
		int result = dbsql.dbUpdate(bean);
		
		request.setAttribute("result",result);
		request.setAttribute("id",bean.getId());
		request.setAttribute("pw",bean.getPw());
		request.setAttribute("gender",bean.getGender());
		request.setAttribute("engname",bean.getEngname());
		request.setAttribute("korname",bean.getKorname());
		request.setAttribute("birthday",bean.getBirthday());
		request.setAttribute("addr",bean.getAddr());
		request.setAttribute("tel",bean.getTel());
		request.setAttribute("email",bean.getEmail());
		request.getRequestDispatcher("login/mb_info.jsp").forward(request, response);		
	}
}