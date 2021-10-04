package comSERVLET;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comDAO.usersDAO;

@WebServlet("/DeleteFollow")
public class DeleteFollow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  request.setCharacterEncoding("EUC-KR");
	      response.setCharacterEncoding("EUC-KR");
		  PrintWriter out = response.getWriter() ; 
		  int follow_seq =  Integer.parseInt(request.getParameter("follow_seq"));
		  
	      usersDAO dao = new usersDAO();
	      int cnt = dao.delete_follow(follow_seq);
	      
	      if(cnt>0) {
	    	  out.print("<script>");
	    	  out.print("alert('삭제되었습니다.');");
	    	  out.print("location.href='public/follow/follow.jsp';");
	    	  out.print("</script>");
	      };
	      
	
	}

}
