package comSERVLET;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comDAO.usersDAO;

@WebServlet("/CheckNickService")
public class CheckNickService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String input_nick = request.getParameter("input_nick");
		response.setCharacterEncoding("UTF-8");
		
		usersDAO dao = new usersDAO();
		
		int cnt = dao.check_nick(input_nick);
		
		PrintWriter out = response.getWriter();
		if(cnt>0) {
			out.print("사용가능한 닉네임입니다.");
		}else {
			out.print("이미 사용중인 닉네임입니다.");
		}
	}

}
