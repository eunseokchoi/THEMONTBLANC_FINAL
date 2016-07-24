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

public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();

			String data1 = request.getParameter("userid");
			DBSQL dbsql = new DBSQL();
			Gson gson = new Gson();
			result = dbsql.dbSearch(data1);
			String temp = gson.toJson(result);
			out.write(temp);
			out.flush();
			out.close();

		} catch (Exception ex) {
			ex.toString();
		}
	}
}