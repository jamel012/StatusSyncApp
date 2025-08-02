<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "run_db";

$status = isset($_GET['status']) ? intval($_GET['status']) : 0;

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "UPDATE device_status SET status = $status WHERE id = 1";
if ($conn->query($sql) === TRUE) {
    echo json_encode(["message" => "Status updated to $status"]);
} else {
    echo json_encode(["error" => "Update failed"]);
}

$conn->close();
?>
