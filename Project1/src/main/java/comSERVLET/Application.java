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

@WebServlet("/Application")
public class Application extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		usersVO vo = (usersVO)session.getAttribute("vo");)
		String user_email = request.getParameter(vo.getUser_email());
		String app_content = request.getParameter("content");
		int pick_design = Integer.parseInt(request.getParameter("design")); 
		
		usersDAO dao = new usersDAO();
		int cnt = dao.app(user_email, app_content, pick_design);
		
		PrintWriter out = response.getWriter();
		if(cnt>0) {
			out.print("<script>");
			out.print("alert('���������� ��û�� �Ǿ����ϴ�');");
			out.print("location.href = 'publish/book_made.jsp'");
			out.print("</script>");
		}else {
			out.print("<script>");
			out.print("alert('��û�� �����߽��ϴ�. ������ Ȯ�����ּ���');");
			out.print("location.href = 'publish/book_made.jsp'");
			out.print("</script>");
		}
	}

}
