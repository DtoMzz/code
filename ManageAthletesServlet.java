import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class ManageAthletesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应内容类型
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        Statement stmt = null;
        try {
            // 加载驱动类
//            Class.forName("com.mysql.cj.jdbc.Driver");

            // 建立数据库连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sports_registration?useUnicode=true&characterEncoding=UTF-8", "root", "root");

            // 创建 Statement 对象
            stmt = conn.createStatement();

            // 执行查询
            String sql = "SELECT * FROM athletes";
            ResultSet rs = stmt.executeQuery(sql);

            // 处理结果集
            while (rs.next()) {
                // 获取字段数据
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String studentId = rs.getString("studentId");
                String sport = rs.getString("sport");
                int score = rs.getInt("score");

                // 输出数据
                out.println("ID: " + id + ", 姓名: " + name + ", 学号: " + studentId + ", 运动项目: " + sport + ", 成绩: " + score + "<br>");
            }

            // 关闭结果集
            rs.close();
        } catch (SQLException se) {
            // 处理 JDBC 错误
            se.printStackTrace();
        } catch (Exception e) {
            // 处理 Class.forName 错误
            e.printStackTrace();
        } finally {
            // 关闭资源
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
