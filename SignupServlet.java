import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class SignupServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String sport = request.getParameter("sport");
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");

        try {
            // 数据库连接信息
            String url = "jdbc:mysql://localhost:3306/sports_registration?useUnicode=true&characterEncoding=UTF-8";

            String user = "root";
            String password = "root";

            // 连接数据库
            Connection conn = DriverManager.getConnection(url, user, password);

            // 插入数据
            String sql = "INSERT INTO athletes (name, studentId, sport) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, studentId);
            preparedStatement.setString(3, sport);

            int i = preparedStatement.executeUpdate();
            if(i > 0) {
                out.println("报名成功！");
            }

            // 关闭连接
            preparedStatement.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
