<?php
$host = 'localhost';
$db = 'run_db';
$user = 'root';
$pass = '';
$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT status FROM device_status WHERE id = 1"; // تأكد من وجود WHERE
$result = $conn->query($sql);

if ($result && $row = $result->fetch_assoc()) {
    echo json_encode(['status' => $row['status']]);
} else {
    echo json_encode(['status' => '0']);
}

$conn->close();
?>
