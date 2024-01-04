<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理录入成绩</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
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
        .form-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .form-container input[type='text'] {
            margin-right: 10px;
            padding: 5px;
            width: 60%;
        }
        .form-container input[type='submit'] {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-container input[type='submit']:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h2>运动员成绩录入管理</h2>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sports_registration?useUnicode=true&characterEncoding=UTF-8", "root", "root");
        stmt = conn.createStatement();
        String sql = "SELECT * FROM athletes";
        rs = stmt.executeQuery(sql);

        out.println("<table>");
        out.println("<tr><th>姓名</th><th>学号</th><th>运动项目</th><th>成绩</th><th>操作</th></tr>");

        while(rs.next()){
            out.println("<tr>");
            out.println("<td>" + rs.getString("name") + "</td>");
            out.println("<td>" + rs.getString("studentId") + "</td>");
            out.println("<td>" + rs.getString("sport") + "</td>");
            out.println("<td>");
            out.println("<form class='form-container' action='UpdateScoreServlet' method='post'>");
            out.println("<input type='hidden' name='studentId' value='" + rs.getString("studentId") + "'>");
            out.println("<input type='text' name='score' value='" + rs.getString("score") + "'>");
            out.println("<input type='submit' value='确认添加成绩'>");
            out.println("</form>");
            out.println("</td>");
            out.println("</tr>");
        }
        out.println("</table>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {};
        try { if (stmt != null) stmt.close(); } catch (Exception e) {};
        try { if (conn != null) conn.close(); } catch (Exception e) {};
    }
%>
</body>
</html>
