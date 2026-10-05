<?php

// Connect to MySQL

$conn = mysqli_connect(
    "localhost",
    "root",
    "test@123",
    "shoppingdb"
);


// Check connection

if (!$conn) {

    die(
        "Connection failed: "
        . mysqli_connect_error()
    );
}


// Insert order when form is submitted

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $name = $_POST["name"];

    $email = $_POST["email"];

    $phone = $_POST["phone"];

    $product = $_POST["product"];

    $quantity = $_POST["quantity"];


    $sql =
        "INSERT INTO orders "
        . "(name, email, phone, product, quantity) "
        . "VALUES "
        . "('$name', '$email', '$phone', '$product', '$quantity')";


    if (mysqli_query($conn, $sql)) {

        echo "<h3>Order placed successfully!</h3>";

    } else {

        echo "Error: "
            . mysqli_error($conn);
    }
}

?>

<!DOCTYPE html>
<html>

<head>
    <title>Online Shopping Form</title>
</head>

<body>

<h2>Online Shopping Form</h2>

<form action="index.php" method="post">

    Name:
    <input type="text" name="name" required>
    <br><br>

    Email:
    <input type="email" name="email" required>
    <br><br>

    Phone:
    <input type="tel" name="phone" required>
    <br><br>

    Select Product:

    <select name="product" required>

        <option value="">
            -- Select Product --
        </option>

        <option value="Laptop">
            Laptop
        </option>

        <option value="Mobile Phone">
            Mobile Phone
        </option>

        <option value="Headphones">
            Headphones
        </option>

        <option value="Keyboard">
            Keyboard
        </option>

        <option value="Mouse">
            Mouse
        </option>

    </select>

    <br><br>

    Quantity:

    <input
        type="number"
        name="quantity"
        min="1"
        value="1"
        required
    >

    <br><br>

    <input
        type="submit"
        value="Place Order"
    >

    <input
        type="reset"
        value="Clear"
    >

</form>

<br><br>

<h2>All Order Details</h2>

<table border="1" cellpadding="10">

<tr>

    <th>ID</th>

    <th>Name</th>

    <th>Email</th>

    <th>Phone</th>

    <th>Product</th>

    <th>Quantity</th>

</tr>

<?php

// Retrieve all orders

$sql = "SELECT * FROM orders";

$result = mysqli_query(
    $conn,
    $sql
);


if (mysqli_num_rows($result) > 0) {

    while (
        $row = mysqli_fetch_assoc($result)
    ) {

        echo "<tr>";

        echo "<td>"
            . $row["id"]
            . "</td>";

        echo "<td>"
            . $row["name"]
            . "</td>";

        echo "<td>"
            . $row["email"]
            . "</td>";

        echo "<td>"
            . $row["phone"]
            . "</td>";

        echo "<td>"
            . $row["product"]
            . "</td>";

        echo "<td>"
            . $row["quantity"]
            . "</td>";

        echo "</tr>";
    }

} else {

    echo "<tr>";

    echo "<td colspan='6'>"
        . "No orders found"
        . "</td>";

    echo "</tr>";
}


mysqli_close($conn);

?>

</table>

<br>

<a href="index.php">
    Place Another Order
</a>

</body>
</html>
