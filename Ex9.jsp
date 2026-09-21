<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: skyblue; }
        .container { width: 400px; margin: 70px auto; background: white; padding: 25px; border-radius: 10px; }
        h2 { text-align: center; }
        input, select { width: 100%; padding: 10px; margin: 8px 0; box-sizing: border-box; }
        input[type="submit"] { background-color: green; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Registration</h2>
        <form action="register.jsp" method="post">
            User Name: <input type="text" name="userName" required>
            Password: <input type="password" name="password" required>
            Email: <input type="email" name="email" required>
            Products: 
            <select name="Products">
                <option>Sugar</option>
                <option>Milk</option>
                <option>Rice</option>
                <option>Salt</option>
            </select>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
