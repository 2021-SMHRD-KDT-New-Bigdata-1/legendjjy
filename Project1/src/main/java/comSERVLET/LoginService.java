package comSERVLET;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comDAO.usersDAO;
import comVO.usersVO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_email = request.getParameter("email");
		String user_pw = request.getParameter("pass");
		
		usersDAO dao = new usersDAO();
		
		usersVO vo = dao.login(user_email, user_pw);
		
		
		HttpSession session = request.getSession();
		if(vo!=null) {
			session.setAttribute("vo", vo);
			response.sendRedirect("public/index.html");
		}else {
			response.sendRedirect("public/Login/login.jsp");
			session.setAttribute("errMsg", "로그인정보가 틀렸습니다");
		}
	}

}
