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

public class JoinController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();
		DBSQL dbsql;
		DBbean bean;
		SendMailController smc;
	
		String id= request.getParameter("userid");
		String pw= request.getParameter("pw1");
		String gender= request.getParameter("gender");
		
		String ename1= request.getParameter("ename1");
		String ename2= request.getParameter("ename2");
		String ename = ename1+" "+ename2;
		
		String kname1= request.getParameter("kname1");
		String kname2= request.getParameter("kname2");
		String kname = kname2+" "+kname1; 
		
		String postcode= request.getParameter("postcode");
		String addr1= request.getParameter("addr1");
		String addr2= request.getParameter("addr2");
		String addr = addr1 + addr2;
		
		String email= request.getParameter("email");
	
		String birthday=request.getParameter("birthday");
		
		String tel= request.getParameter("tel");
		
		
		try{
			dbsql = new DBSQL();
			bean = new DBbean();
			smc = new SendMailController();
			
			bean.setId(id);
			bean.setPw(pw);
			bean.setGender(gender);
			bean.setEngname(ename);
			bean.setKorname(kname);
			bean.setAddr(addr);
			bean.setEmail(email);
			bean.setBirthday(birthday);
			bean.setTel(tel);
		 
			int result = dbsql.dbJoinMember(bean);
		 
			if(result>0){
				System.out.println("가입성공~!");
				smc.sendMail(bean);
				session.setAttribute("NowUser", id);
				response.sendRedirect("welcome.jsp");
			}else{
				System.out.println("가입 실패~!");
				response.sendRedirect("join-step2.jsp");
			}
		}catch(Exception ex){
			System.out.println("목록보기실패"+ex.toString());
		}  
	}
}