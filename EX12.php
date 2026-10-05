<?php

$xml = simplexml_load_file("books.xml");

if ($xml === false) {
    die("Error reading books.xml");
}

$totalBooks = count($xml->book);

$totalPrice = 0;

foreach ($xml->book as $book) {
    $totalPrice = $totalPrice + (float)$book->price;
}

?>

<!DOCTYPE html>
<html>

<head>
    <title>Book Details</title>
</head>

<body>

<h1>Book Details</h1>

<p>
    <b>Total Books:</b>
    <?php echo $totalBooks; ?>
</p>

<p>
    <b>Total Price:</b>
    <?php echo $totalPrice; ?> ₹
</p>

<table border="1" cellpadding="10">

<tr>
    <th>ID</th>
    <th>Book Name</th>
    <th>Price</th>
</tr>

<?php

foreach ($xml->book as $book) {

    echo "<tr>";

    echo "<td>" . $book->id . "</td>";

    echo "<td>" . $book->name . "</td>";

    echo "<td>" . $book->price . " ₹</td>";

    echo "</tr>";
}

?>

</table>

</body>
</html>
