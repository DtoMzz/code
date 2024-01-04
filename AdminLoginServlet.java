// AdminLoginServlet.java
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class AdminLoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(username.equals("lyx") && password.equals("lyx")) {
            response.sendRedirect("manage_scores.jsp"); // 登录成功，跳转到成绩管理页面
        } else {
            response.getWriter().println("登录失败！"); // 登录失败
        }
    }
}
