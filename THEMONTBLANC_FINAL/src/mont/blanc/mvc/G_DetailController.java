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


public class G_DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_DetailController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String data=request.getParameter("num");
			String pageNUM=request.getParameter("pageNUM"); 
			String reco=request.getParameter("reco"); 
			String writeflag = request.getParameter("write"); //detail에서 글쓰기 한 경우.(로그인 여부 권한)
			System.out.println("detailcontroller.java   num="+data+"   reco ="+reco+"write= "+writeflag);
			System.out.println("list에서 넘어온 pageNUM="+pageNUM);	
			
			DBSQL dbsql=new DBSQL();
			DBbean aa=dbsql.G_boardDetail(data, reco, writeflag);
			System.out.println("category값:"+aa.getCategory());
			
			DBSQL dbsql2=new DBSQL();
			List bb=dbsql2.coSelect(data);	  //댓글 가져오기 리스트 
			System.out.println(bb.size()); 
			request.setAttribute("detail", aa);  //게시글 디테일
			request.setAttribute("colist", bb);  //댓글
			
			request.setAttribute("detail_pageNUM", pageNUM);
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=guest/m_guest&list=G_guestDetail");
			dis.forward(request, response);
			
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());  }  
	}//user END
}//class END
