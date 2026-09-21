<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Details</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: lightblue; margin: 0; padding: 0; }
        h2 { text-align: center; margin-top: 40px; color: #333; }
        table { width: 80%; margin: 40px auto; border-collapse: collapse; background-color: white; }
        th { background-color: #333; color: white; padding: 12px; }
        td { padding: 12px; text-align: center; border: 1px solid #999; }
        tr:nth-child(even) { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>Registration Details</h2>
    <table>
        <tr>
            <th>User Name</th>
            <th>Password</th>
            <th>Email</th>
            <th>Products</th>
        </tr>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        java.sql.Connection con = java.sql.DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/servlet", "root", "Mathan@2005"
        );
        java.sql.Statement stmt = con.createStatement();
        java.sql.ResultSet rs = stmt.executeQuery("SELECT * FROM USERDETAILS");
        
        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("password") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("products") %></td>
        </tr>
<%
        }
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception ex) {
        out.println("<h3>Error: " + ex.getMessage() + "</h3>");
    }
%>
    </table>
</body>
</html>
