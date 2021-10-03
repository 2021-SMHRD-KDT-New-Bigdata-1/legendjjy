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

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));

		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();

		diaryDAO dao = new diaryDAO();
		int cnt = dao.delete_diary(diary_seq);

		if (cnt > 0) {
			out.print("<script>");
			out.print("alert('삭제되었습니다.')");
			out.print("location.href='history.back()'");
			out.print("</script>");
		}
	}
}
