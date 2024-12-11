<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$sname = "localhost";
$uname = "root";
$password = "";
$db_name = "mvch";

$conn = mysqli_connect($sname, $uname, $password, $db_name);

if (!$conn) {
    die("Connection Failed: " . mysqli_connect_error());
} else {
    echo "Connected Successfully!";
}
?>
