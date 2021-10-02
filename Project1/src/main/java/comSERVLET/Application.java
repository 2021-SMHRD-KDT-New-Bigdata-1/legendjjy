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

<<<<<<< HEAD
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		usersVO vo = (usersVO)session.getAttribute("vo");
		String user_email = request.getParameter("email");
		String app_require = request.getParameter("require");
		int pick_design = Integer.parseInt(request.getParameter("choose")); 
		
		if(!user_email.equals(vo.getUser_email())) {
			out.print("<script>");
			out.print("alert('½ÅÃ»ÇÑ ÀÌ¸ŞÀÏ°ú ·Î±×ÀÎÇÑ ÀÌ¸ŞÀÏÀÌ ÀÏÄ¡ÇÏÁö ¾Ê½À´Ï´Ù');");
			out.print("location.href = 'publish/book_made.jsp'");
			out.print("</script>");
		}
		
		usersDAO dao = new usersDAO();
		int cnt = dao.app(user_email, app_require, pick_design);
		
		if(cnt>0) {
			out.print("<script>");
			out.print("alert('¼º°øÀûÀ¸·Î ½ÅÃ»ÀÌ µÇ¾ú½À´Ï´Ù');");
			out.print("location.href = 'publish/book_made.jsp'");
			out.print("</script>");
		}else {
			out.print("<script>");
			out.print("alert('½ÅÃ»¿¡ ½ÇÆĞÇß½À´Ï´Ù. ³»¿ëÀ» È®ÀÎÇØÁÖ¼¼¿ä');");
			out.print("location.href = 'publish/book_made.jsp'");
			out.print("</script>");
		}
	}
=======
      HttpSession session = request.getSession();
      PrintWriter out = response.getWriter();
      usersVO vo = (usersVO)session.getAttribute("vo");
      String user_email = request.getParameter("email");
      String app_require = request.getParameter("require");
      int pick_design = Integer.parseInt(request.getParameter("design")); 
      
      if(user_email.equals(vo.getUser_email())) {
         out.print("<script>");
         out.print("alert('ì‹ ì²­í•œ ì´ë©”ì¼ê³¼ ë¡œê·¸ì¸í•œ ì´ë©”ì¼ì´ ì¼ì¹˜í•˜ì§€ ì•ŠìŠµë‹ˆë‹¤');");
         out.print("location.href = 'publish/book_made.jsp'");
         out.print("</script>");
      }
      
      usersDAO dao = new usersDAO();
      int cnt = dao.app(user_email, app_require, pick_design);
      
      if(cnt>0) {
         out.print("<script>");
         out.print("alert('ì„±ê³µì ìœ¼ë¡œ ì‹ ì²­ì´ ë˜ì—ˆìŠµë‹ˆë‹¤');");
         out.print("location.href = 'publish/book_made.jsp'");
         out.print("</script>");
      }else {
         out.print("<script>");
         out.print("alert('ì‹ ì²­ì— ì‹¤íŒ¨í–ˆìŠµë‹ˆë‹¤. ë‚´ìš©ì„ í™•ì¸í•´ì£¼ì„¸ìš”');");
         out.print("location.href = 'publish/book_made.jsp'");
         out.print("</script>");
      }
   }
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/legendjjy.git

}
