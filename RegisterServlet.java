import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
//        String url = "jdbc:mysql://localhost:3306/sports_registration?useUnicode=true&characterEncoding=UTF-8";

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sports_registration?useUnicode=true&characterEncoding=UTF-8", "root", "root");
            String sql = "INSERT INTO users (username, password, name, studentId) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password); // 注意：实际生产中应使用加密密码
            preparedStatement.setString(3, name);
            preparedStatement.setString(4, studentId);

            int i = preparedStatement.executeUpdate();
            if(i > 0) {
                out.println("注册成功！");
                response.sendRedirect("index.jsp");
            }

            preparedStatement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
