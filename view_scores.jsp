
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看成绩</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        table {
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<h2>运动员成绩</h2>
<%
    // 数据库连接
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sports_registration?useUnicode=true&characterEncoding=UTF-8", "root", "root");
        stmt = conn.createStatement();
        String sql = "SELECT * FROM athletes";
        rs = stmt.executeQuery(sql);

        out.println("<table>");
        // 添加了score列标题
        out.println("<tr><th>姓名</th><th>学号</th><th>运动项目</th><th>成绩</th></tr>");

        while(rs.next()){
            out.println("<tr>");
            out.println("<td>" + rs.getString("name") + "</td>");
            out.println("<td>" + rs.getString("studentId") + "</td>");
            out.println("<td>" + rs.getString("sport") + "</td>");
            // 输出score列的数据
            out.println("<td>" + rs.getDouble("score") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 关闭连接
        try { if (rs != null) rs.close(); } catch (Exception e) {};
        try { if (stmt != null) stmt.close(); } catch (Exception e) {};
        try { if (conn != null) conn.close(); } catch (Exception e) {};
    }
%>
</body>
</html>
