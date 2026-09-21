<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body { font-family: Arial; background-color: lightblue; }
        .container { width: 400px; margin: 80px auto; background-color: white; padding: 25px; border-radius: 10px; }
        h2 { text-align: center; }
        input { width: 100%; padding: 10px; margin: 8px 0; box-sizing: border-box; }
        input[type="submit"] { background-color: blue; color: white; border: none; }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Login</h2>
        <form action="validate.jsp" method="post">
            User Name: <input type="text" name="userName" required>
            Password: <input type="password" name="password" required>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
