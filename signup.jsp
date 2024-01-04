<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>运动会报名</title>
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
        select, input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
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
<form action="SignupServlet" method="post">
    <h2>运动会报名表</h2>
    <label for="sport">选择运动项目:</label>
    <select name="sport" id="sport">
        <option value="100米">100米</option>
        <option value="200米">200米</option>
        <option value="400米">400米</option>
        <option value="羽毛球">羽毛球</option>
        <option value="110米栏">110米栏</option>
        <option value="足球">足球</option>
        <option value="篮球">篮球</option>
        <option value="游泳">游泳</option>
        <option value="滑冰">滑冰</option>
    </select><br><br>

    <label for="name">姓名:</label>
    <input type="text" id="name" name="name"><br><br>

    <label for="studentId">学号:</label>
    <input type="text" id="studentId" name="studentId"><br><br>

    <input type="submit" value="报名">
</form>
</body>
</html>
