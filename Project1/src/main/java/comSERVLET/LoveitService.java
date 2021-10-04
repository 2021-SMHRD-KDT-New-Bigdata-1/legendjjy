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

@WebServlet("/LoveitService")
public class LoveitService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int loveit_seq = Integer.parseInt(request.getParameter("loveit_seq"));
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		usersVO vo = (usersVO)session.getAttribute("vo");
		usersDAO dao = new usersDAO();
		
		int cnt = 
		
		if(cnt>0) {
			out.print("y");
		}else {
			out.print("n");
		}
		
	}
	
	
	
	
	}


