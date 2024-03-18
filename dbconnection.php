<?php

function dbconnection(){
    $con=mysqli_connect("localhost","root","","kidcare");
    return $con;
}



?>