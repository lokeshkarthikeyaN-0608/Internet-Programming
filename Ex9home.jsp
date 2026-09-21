<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        body { font-family: Arial; background-color: lightgreen; text-align: center; padding-top: 100px; }
        .box { width: 400px; margin: auto; background-color: white; padding: 30px; border-radius: 10px; }
    </style>
</head>
<body>
    <div class="box">
        <h2>Welcome <%= session.getAttribute("username") %></h2>
        <p>Login Successfully Completed.</p>
        <a href="display.jsp">View Registration Details</a>
    </div>
</body>
</html>
