package mont.blanc.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;//json �������� ����Ʈ

import mont.blanc.common.DBSQL;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login.json(LoginController Start)");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		DBSQL dbsql;
		HttpSession session = request.getSession();

		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");

		PrintWriter out = response.getWriter();
		try {
			dbsql = new DBSQL();
			int result = dbsql.dbLogin(id, pw);
			if (result == 1) {
				Gson gson = new Gson();
				session.setAttribute("NowUser", id);
				session.setMaxInactiveInterval(60 * 60 * 2);
				System.out.println(id+" �α��μ��� ���� ����");
				String temp = gson.toJson(result);
				out.write(temp);
				out.flush();
				out.close();

			} else if (result == 2) {
				Gson gson = new Gson();
				session.setAttribute("NowUser", id);
				System.out.println(id+" ������ �α��� ����");
				String temp = gson.toJson(result);
				out.write(temp);
				out.flush();
				out.close();
			} else {
				System.out.println("�α��ν���");
				Gson gson = new Gson();
				String temp = gson.toJson(result);
				out.write(temp);
				out.flush();
				out.close();
			}
		} catch (Exception ex) {
			System.out.println("��Ϻ������" + ex.toString());
		}
	}
}