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

@WebServlet("/EditService")
public class EditService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("EUC-KR");
      HttpSession session = request.getSession();
      usersVO vo = (usersVO)session.getAttribute("vo");
      usersDAO dao = new usersDAO();
      
      String edit = request.getParameter("edit");
      
      PrintWriter out = response.getWriter();
      if(edit.equals("pass")) {
         String pass1 = request.getParameter("pass1");
         String pass2 = request.getParameter("pass2");
         String user_email = vo.getUser_email();

         if(pass1.equals(pass2)) {
            int cnt = dao.editPass(pass2, user_email);
              out.print("<script>");
              out.print("alert('��й�ȣ�� ����Ǿ����ϴ�.');");
              out.print("location.href = 'public/Login_v2/edit.html'");
              out.print("</script>");
         }else {
            response.sendRedirect("public/Login_v2/edit.html");
            session.setAttribute("errPassMsg", "��й�ȣ�� ��ġ�����ʽ��ϴ�.");
         }
      }else if(edit.equals("nick")) {
         String user_nick = request.getParameter("nickname");
         String user_email = vo.getUser_email();
         
         if(user_nick.equals(vo.getUser_nick())) {
            response.sendRedirect("public/Login_v2/editNick.jsp");
            session.setAttribute("errNickMsg", "���� �г��Ӱ� �����ϴ�.");
         }else {
            vo.setUser_nick(user_nick);
              out.print("<script>");
              out.print("alert('�г����� ����Ǿ����ϴ�.');");
              out.print("location.href = 'public/Login_v2/edit.html'");
              out.print("</script>");
         }
      }
   }

}
