<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<%
    String n = request.getParameter("userName");
    String p = request.getParameter("password");
    String e = request.getParameter("email");
    String c = request.getParameter("Products");
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        java.sql.Connection con = java.sql.DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/servlet", "root", "Mathan@2005"
        );
        java.sql.PreparedStatement ps = con.prepareStatement(
            "INSERT INTO USERDETAILS(username, password, email, Products) VALUES(?,?,?,?)"
        );
        ps.setString(1, n);
        ps.setString(2, p);
        ps.setString(3, e);
        ps.setString(4, c);
        
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("login.jsp");
        }
        
        ps.close();
        con.close();
    } catch (Exception ex) {
        out.println("<h3>Error: " + ex.getMessage() + "</h3>");
    }
%>
</body>
</html>
