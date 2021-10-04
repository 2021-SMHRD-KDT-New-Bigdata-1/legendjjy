package comSERVLET;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comDAO.usersDAO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      request.setCharacterEncoding("euc-kr");
      response.setCharacterEncoding("euc-kr");
      String user_email = request.getParameter("email");
      String user_pw = request.getParameter("pass");
      String user_nick = request.getParameter("nickname");
      String admin_yn = "";
      if(user_email.equals("admin@admin.com")&&user_nick.equals("admin")) {
         admin_yn = "y";
      }else {
         admin_yn = "n";
      }
      
      usersDAO dao = new usersDAO();
      
      int cnt = dao.join(user_email, user_pw, user_nick, admin_yn);
      
      PrintWriter out = response.getWriter();
      if(cnt>0) {
           out.print("<script>");
           out.print("alert('성공적으로 가입되었습니다.');");
           out.print("location.href = 'public/Login_v2/login.jsp'");
           out.print("</script>");
      }else {
           out.print("<script>");
           out.print("alert('내용을 다시 확인해 주세요.');");
           out.print("location.href = 'public/Login_v2/join.jsp'");
           out.print("</script>");
      }
   }

}
