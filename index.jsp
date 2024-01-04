<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>运动会报名系统</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column; /* 使用列布局 */
      align-items: center;
      height: 100vh;
      background-color: #f2f2f2;
    }
    .header {
      text-align: center;
      width: 100%; /* 宽度为100% */
      padding: 20px 0;
      background-color: #f2f2f2;
    }
    h1 {
      margin: 0;
      color: #333;
    }
    .content {
      flex-grow: 1; /* 占据剩余空间 */
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column; /* 内容也使用列布局 */
    }
    a {
      display: block;
      margin: 10px;
      padding: 10px 20px;
      text-decoration: none;
      background-color: white;
      color: black;
      border: 2px solid #4CAF50;
      border-radius: 5px;
      transition: background-color 0.3s, color 0.3s;
    }
    a:hover {
      background-color: #4CAF50;
      color: white;
    }
  </style>
</head>
<body>
<div class="header">
  <h1>欢迎来到运动会报名系统</h1>
</div>
<div class="content">
  <a href="login.jsp">运动员登录</a><br>
  <a href="register.jsp">运动员注册</a><br>
  <a href="admin_login.jsp">管理员成绩录入</a><br>
  <a href="view_scores.jsp">查看成绩</a><br>
</div>
</body>
</html>
