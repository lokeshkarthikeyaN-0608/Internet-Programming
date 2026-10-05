<?php

$email = $_POST["email"];
$password = $_POST["password"];
$card = $_POST["card"];
$phone = $_POST["phone"];

$errors = array();

/* Email validation */

if (!preg_match(
    "/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/",
    $email
)) {

    $errors[] = "Invalid email address";
}


/* Password validation */

if (!preg_match(
    "/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{8,}$/",
    $password
)) {

    $errors[] =
        "Password must contain at least 8 characters, uppercase, lowercase, number and special character";
}


/* Credit card validation */

if (!preg_match(
    "/^[0-9]{13,19}$/",
    $card
)) {

    $errors[] = "Invalid credit card number";
}


/* Phone validation */

if (!preg_match(
    "/^\+?[0-9]{10,15}$/",
    $phone
)) {

    $errors[] = "Invalid phone number";
}


/* Display result */

if (count($errors) > 0) {

    echo "<h2>Registration Failed</h2>";

    foreach ($errors as $error) {

        echo $error . "<br>";
    }

    echo "<br>";

    echo "<a href='register.html'>Go Back</a>";

} else {

    echo "<h2>Registration Successful</h2>";

    echo "Email: "
        . htmlspecialchars($email)
        . "<br>";

    echo "Phone: "
        . htmlspecialchars($phone)
        . "<br>";

    echo "All fields are valid.";
}

?>
