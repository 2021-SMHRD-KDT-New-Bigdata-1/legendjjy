package comSERVLET;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import comDAO.diaryDAO;
import comVO.diaryVO;
import comVO.usersVO;

@WebServlet("/UploadService")
public class UploadService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		ServletContext context = getServletContext();
		String path = context.getRealPath("upload");
		int sizeLimit = 10 * 1024 * 1024;
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String hastag = multi.getParameter("hastag");
		String comment_yn = multi.getParameter("comment_yn");
		String public_yn = multi.getParameter("public_yn");
		String imgURL = multi.getFilesystemName("file");
		
		diaryVO vo = new diaryVO(title, content, imgURL, hastag, public_yn, comment_yn);
		
		HttpSession session = request.getSession();
		usersVO user_vo = (usersVO)session.getAttribute("vo");
		
		diaryDAO dao = new diaryDAO();
		
		int cnt = dao.upload_diary(vo, user_vo);
		
		
		
	}

}
