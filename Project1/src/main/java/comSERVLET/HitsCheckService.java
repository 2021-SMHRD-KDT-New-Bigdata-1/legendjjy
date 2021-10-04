package comSERVLET;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comDAO.diaryDAO;
import comVO.entireDiaryVO;
import comVO.usersVO;

@WebServlet("/HitsCheckService")
public class HitsCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int diary_seq = Integer.parseInt(request.getParameter("post_seq"));
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		usersVO vo = (usersVO)session.getAttribute("vo");
		diaryDAO dao = new diaryDAO();
		entireDiaryVO diary_info = dao.select_diary(diary_seq);
		
		int cnt = 0;
		if(vo.getUser_email()==null) {
			cnt = dao.hits_up(diary_seq);
		}else if(!diary_info.getUser_email().equals(vo.getUser_email())) {
			cnt = dao.hits_up(diary_seq);
		}
		
		if(cnt>0) {
			out.print(1);
		}else {
			out.print(0);
		}
	}

}
