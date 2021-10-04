package comSERVLET;

import java.io.IOException;
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
		
		HttpSession session = request.getSession();
		usersVO vo = (usersVO)session.getAttribute("vo");
		diaryDAO dao = new diaryDAO();
		entireDiaryVO diary_info = dao.select_diary(diary_seq);
		
		if(vo.getUser_email()==null) {
			dao.hits_up(diary_seq);
		}else if(!diary_info.getUser_email().equals(vo.getUser_email())) {
			dao.hits_up(diary_seq);
		}
	}

}
