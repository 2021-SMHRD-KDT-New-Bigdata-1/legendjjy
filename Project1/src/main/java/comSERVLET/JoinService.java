package comSERVLET;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comDAO.usersDAO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_email = request.getParameter("email");
		String user_pw = request.getParameter("pass");
		String user_nick = request.getParameter("nickname");
		String admin_yn = "";
		if(user_email.equals("admin@admin.com")&&user_nick.equals("admin")) {
			admin_yn = "y";
		}else {
			admin_yn = "n";
		}
		
		usersDAO dao = new usersDAO();
		
		int cnt = dao.join(user_email, user_pw, user_nick, admin_yn);
		
		if(cnt>0) {
			response.sendRedirect("public/Login/login.jsp");
		}else {
			response.sendRedirect("public/Login/join.jsp");
		}
	}

}
