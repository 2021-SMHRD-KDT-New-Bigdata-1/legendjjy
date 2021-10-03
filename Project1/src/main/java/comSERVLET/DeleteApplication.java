package comSERVLET;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comDAO.usersDAO;
import comVO.appVO;
import comVO.usersVO;

@WebServlet("/DeleteApplication")
public class DeleteApplication extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  request.setCharacterEncoding("UTF-8");
	      response.setCharacterEncoding("EUC-KR");
		  PrintWriter out = response.getWriter() ; 
		  int app_seq =  Integer.parseInt(request.getParameter("app_seq"));
		  
	      usersDAO dao = new usersDAO();
	      int cnt = dao.delete_Applist(app_seq);
	      
	      if(cnt>0) {
	    	  out.print("<script>");
	    	  out.print("alert('확인됐습니까?');");
	    	  out.print("location.href='public/publish_admin/follow.jsp'");
	    	  out.print("</script>");
	      };
	      
	
	}

}
