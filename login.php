<?php
// Assuming you have a database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kidcare";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
// Retrieve data from POST request
$name = $_POST['name'];
$password = $_POST['password'];

// Check if the credentials are in the parent table
$sql = "SELECT * FROM parent WHERE name = '$name' AND password = '$password'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $response['isParent'] = true;
    $response['isChild'] = false;
    $response['message'] = "Welcome, Parent!";
} else {
    // Check if the credentials are in the children table
    $sql = "SELECT * FROM children WHERE name = '$name' AND password = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $response['isParent'] = false;
        $response['isChild'] = true;
        $response['message'] = "Welcome, Child!";
    } else {
        $response['isParent'] = false;
        $response['isChild'] = false;
        $response['message'] = "Invalid login credentials";
    }
}

echo json_encode($response);
}
$conn->close();
?>
