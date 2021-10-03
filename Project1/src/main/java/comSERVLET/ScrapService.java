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
import comVO.usersVO;

@WebServlet("/ScrapService")
public class ScrapService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int post_seq = Integer.parseInt(request.getParameter("post_seq"));
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		usersVO vo = (usersVO)session.getAttribute("vo");
		usersDAO dao = new usersDAO();
		
		int cnt = dao.add_scrap(post_seq, vo.getUser_email());
		
		if(cnt>0) {
			out.print("y");
		}else {
			out.print("n");
		}
		
	}

}
