<?php

include('dbconnection.php'); // Enclose the file name in quotes
$con = dbconnection();

if (isset($_POST["name"])) {
    $name = $_POST["name"];
} else {
    return;
}
if (isset($_POST["date"])) {
    $date = $_POST["date"];
} else {
    return;
}
if (isset($_POST["leavehome"])) {
    $leavehome = $_POST["leavehome"];
} else {
    return;
}
if (isset($_POST["arrivalschool"])) {
    $arrivalschool = $_POST["arrivalschool"];
} else {
    return;
}
if (isset($_POST["dispachscool"])) {
    $dispachscool = $_POST["dispachscool"];
} else {
    return;
}

if (isset($_POST["inhome"])) {
    $inhome = $_POST["inhome"];
} else {
    return;
}

if (isset($_POST["inattendance"])) {
    $inattendance = $_POST["inattendance"];
} else {
    return;
}

if (isset($_POST["outattendance"])) {
    $outattendance = $_POST["outattendance"];
} else {
    return;
}

$query = "INSERT INTO `shedul`(`name`, `date`, `leavehome`, `arrivalschool`, `dispachscool`, `inhome`, `inattendance`, `outattendance` ) 
          VALUES ('$name','$date','$leavehome','$arrivalschool', '$dispachscool','$inhome','$inattendance','$outattendance')";

$exe = mysqli_query($con, $query);

$arr = [];
if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
}

print(json_encode($arr));

?>
