<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Validate Login</title>
</head>
<body>
<%
    String username = request.getParameter("userName");
    String password = request.getParameter("password");
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        java.sql.Connection con = java.sql.DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/servlet", "root", "Mathan@2005"
        );
        java.sql.PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM USERDETAILS WHERE username=? AND password=?"
        );
        ps.setString(1, username);
        ps.setString(2, password);
        
        java.sql.ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            session.setAttribute("username", username);
            response.sendRedirect("home.jsp");
        } else {
            out.println("<h2>Invalid Username or Password</h2>");
            out.println("<a href='login.jsp'>Try Again</a>");
        }
        
        rs.close();
        ps.close();
        con.close();
    } catch (Exception ex) {
        out.println("<h3>Error: " + ex.getMessage() + "</h3>");
    }
%>
</body>
</html>
