package comSERVLET;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comDAO.usersDAO;

@WebServlet("/DeleteApplication")
public class DeleteApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  request.setCharacterEncoding("UTF-8");
	      response.setCharacterEncoding("EUC-KR");
		  PrintWriter out = response.getWriter() ; 
		  int app_seq =  Integer.parseInt(request.getParameter("app_seq"));
		  
	      usersDAO dao = new usersDAO();
	      int cnt = dao.delete_Applist(app_seq);
	      
	      if(cnt>0) {
	    	  out.print("<script>");
	    	  out.print("alert('Ȯ?οϷ?.')");
	    	  out.print("location.href='history.back()");
	    	  out.print("</script>");
	      };
	      
	
	}

}
