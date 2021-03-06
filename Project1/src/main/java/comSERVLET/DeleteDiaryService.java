package comSERVLET;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comDAO.diaryDAO;

@WebServlet("/DeleteDiaryService")
public class DeleteDiaryService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));
		
		diaryDAO dao = new diaryDAO();
		
		int cnt = dao.delete_diary(diary_seq);
		
		PrintWriter out = response.getWriter();
		if(cnt>0) {
			out.print("<script>");
			out.print("history.go(-2);");
			out.print("location.reload();");
			out.print("</script>");
		}
		
	}

}
