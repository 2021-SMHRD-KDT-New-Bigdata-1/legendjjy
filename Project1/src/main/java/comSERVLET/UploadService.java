package comSERVLET;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

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
		response.setCharacterEncoding("EUC-KR");
		ServletContext context = getServletContext();
		String path = context.getRealPath("upload");
		int sizeLimit = 10 * 1024 * 1024;
		String encType = "EUC-KR";
		
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String hastag = multi.getParameter("writer");
		String comment_yn = multi.getParameter("comment_yn");
		if(comment_yn==null) {
			comment_yn = "n";
		}
		String public_yn = multi.getParameter("public_yn");
		if(public_yn==null) {
			public_yn = "n";
		}
		String imgName = multi.getFilesystemName("file");
		if(imgName==null) {
			imgName = multi.getFilesystemName("image");
			System.out.println(imgName);
		}
		
		long time = System.currentTimeMillis();
		String ori= multi.getOriginalFileName("file");
		if(ori==null) {
			ori = multi.getOriginalFileName("image");
			System.out.println(ori);
		}
		HttpSession session = request.getSession();
		usersVO user_vo = (usersVO)session.getAttribute("vo");
		
		String filename = time+"."+user_vo.getUser_email();
		File savedFile = multi.getFile("file");
		if(savedFile==null) {
			savedFile = multi.getFile("image");
		}
		savedFile.renameTo(new File(path+"/"+filename+".png"));
		
		
		diaryVO diary_vo = new diaryVO(title, content, imgName, hastag, public_yn, comment_yn);
		
		diaryDAO dao = new diaryDAO();
		
		int cnt = dao.upload_diary(diary_vo, user_vo);
		
		PrintWriter out = response.getWriter();
		if(cnt>0) {
			out.print("<script>");
			out.print("alert('일기가 등록되었습니다.');");
			out.print("location.href = 'public/index.jsp'");
			out.print("</script>");
		}else {
			out.print("<script>");
			out.print("alert('일기 등록에 실패했습니다.');");
			out.print("location.href = 'public/index.jsp'");
			out.print("</script>");
		}
		
	}

}
