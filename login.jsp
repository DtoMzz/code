<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>运动员登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            margin-bottom: 10px;
            display: block;
            color: #666;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<form action="LoginServlet" method="post">
    <h2>运动员登录</h2>
    <label for="username">用户名:</label>
    <input type="text" id="username" name="username"><br><br>

    <label for="password">密码:</label>
    <input type="password" id="password" name="password"><br><br>

    <input type="submit" value="登录">
</form>
</body>
</html>
