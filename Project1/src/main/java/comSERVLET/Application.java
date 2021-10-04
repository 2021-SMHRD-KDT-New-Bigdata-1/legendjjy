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

      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("EUC-KR");
      HttpSession session = request.getSession();
      PrintWriter out = response.getWriter();
      usersVO vo = (usersVO)session.getAttribute("vo");
      String user_email = request.getParameter("email");
      String app_require = request.getParameter("require");
      int pick_design = Integer.parseInt(request.getParameter("choose")); 
      
      if(!user_email.equals(vo.getUser_email())) {
         out.print("<script>");
         out.print("alert('신청 이메일이 로그인 이메일과 일치하지 않습니다.');");
         out.print("location.href = 'publish/book_made.jsp'");
         out.print("</script>");
      }
      
      usersDAO dao = new usersDAO();
      int cnt = dao.app(user_email, app_require, pick_design);
      
      if(cnt>0) {
         out.print("<script>");
         out.print("alert('신청이완료되었습니다.');");
         out.print("location.href = 'publish/book_made.jsp'");
         out.print("</script>");
      }else {
         out.print("<script>");
         out.print("alert('다시 신청해주세요.');");
         out.print("location.href = 'publish/book_made.jsp'");
         out.print("</script>");
      }
   }

}