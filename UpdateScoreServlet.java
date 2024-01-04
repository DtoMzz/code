// UpdateScoreServlet.java
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class UpdateScoreServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String studentId = request.getParameter("studentId");
        String score = request.getParameter("score");

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sports_registration?useUnicode=true&characterEncoding=UTF-8", "root", "root");

            String sql = "UPDATE athletes SET score = ? WHERE studentId = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setDouble(1, Double.parseDouble(score));
            pstmt.setString(2, studentId);

            int result = pstmt.executeUpdate();
            if (result > 0) {

                response.getWriter().println("Success!");


            } else {
                response.getWriter().println("成绩更新失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭连接
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {};
            try { if (conn != null) conn.close(); } catch (Exception e) {};
        }
    }
}
