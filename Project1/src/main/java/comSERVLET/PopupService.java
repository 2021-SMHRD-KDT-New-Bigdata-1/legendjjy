package comSERVLET;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comDAO.diaryDAO;
import comVO.entireDiaryVO;

@WebServlet("/PopupService")
public class PopupService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("EUC-KR");
		int diary_seq = Integer.getInteger(request.getParameter("diary_seq"));
		
		diaryDAO dao = new diaryDAO();
		ArrayList<entireDiaryVO> select_diary_info = dao.select_diary(diary_seq);
		
		PrintWriter out = response.getWriter();
		out.print(select_diary_info);
	}

}
