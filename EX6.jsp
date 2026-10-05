<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="de.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Booked Tickets</title>
</head>

<body>

<h2>All Booked Tickets</h2>

<table border="1" cellpadding="10">

<tr>
    <th>ID</th>
    <th>Passenger Name</th>
    <th>Age</th>
    <th>Source</th>
    <th>Destination</th>
    <th>Train Name</th>
    <th>Journey Date</th>
</tr>

<%

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {

    con = DBConnection.getConnection();

    String sql =
        "SELECT * FROM tickets ORDER BY id";

    ps = con.prepareStatement(sql);

    rs = ps.executeQuery();

    while (rs.next()) {

%>

<tr>

    <td>
        <%= rs.getInt("id") %>
    </td>

    <td>
        <%= rs.getString("passenger_name") %>
    </td>

    <td>
        <%= rs.getInt("age") %>
    </td>

    <td>
        <%= rs.getString("source") %>
    </td>

    <td>
        <%= rs.getString("destination") %>
    </td>

    <td>
        <%= rs.getString("train_name") %>
    </td>

    <td>
        <%= rs.getDate("journey_date") %>
    </td>

</tr>

<%

    }

} catch (Exception e) {

%>

<tr>

    <td colspan="7">
        Database Error:
        <%= e.getMessage() %>
    </td>

</tr>

<%

    e.printStackTrace();

} finally {

    try {

        if (rs != null) {
            rs.close();
        }

        if (ps != null) {
            ps.close();
        }

        if (con != null) {
            con.close();
        }

    } catch (Exception e) {

        e.printStackTrace();
    }
}

%>

</table>

<br><br>

<a href="index.html">Book Another Ticket</a>

</body>
</html>
