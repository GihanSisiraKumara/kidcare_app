<?php

include('dbconnection.php'); // Enclose the file name in quotes
$con = dbconnection();

if (isset($_POST["name"])) {
    $name = $_POST["name"];
} else {
    return;
}

if (isset($_POST["phone"])) {
    $phone = $_POST["phone"];
} else {
    return;
}

if (isset($_POST["password"])) {
    $password = $_POST["password"];
} else {
    return;
}

if (isset($_POST["address"])) {
    $address = $_POST["address"];
} else {
    return;
}

if (isset($_POST["table_name"])) {
    $tableName = $_POST["table_name"];
} else {
    return;
}

$query = "INSERT INTO $tableName(`name`, `phone`, `password`, `address`) 
          VALUES ('$name','$phone','$password','$address')";

$exe = mysqli_query($con, $query);

$arr = [];
if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
}

print(json_encode($arr));

?>
