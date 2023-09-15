<?php

error_reporting(E_ALL);
ini_set('display_errors', 'on');
header("Access-Control-Allow-Origin: *");

$host = "127.0.0.1";
$database = "bionix_test";
$username = "root";
$password = "bionix123";

$connection = new mysqli($host, $username, $password, $database);

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

$token = $_POST['token'];

$query = "SELECT userId, userAgent, ipAddress FROM tokens WHERE token = ?";
$stmt = $connection->prepare($query);
$stmt->bind_param("s", $token);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows === 1) {
    $stmt->bind_result($user_id, $userAgent, $ipAddress);
    $stmt->fetch();

    $requestUserAgent = $_SERVER['HTTP_USER_AGENT'];
    $requestIpAddress = $_SERVER['REMOTE_ADDR'];

    if ($userAgent === $requestUserAgent && $ipAddress === $requestIpAddress) {
        $parameter = $_POST['parameter'];

        $validParameters = ["Temp", "Hum", "Pr", "Aqi"];
        if (in_array($parameter, $validParameters)) {
            $query = "SELECT AVG(value) FROM farm$parameter WHERE user_id = ? ORDER BY timestamp DESC LIMIT 50";
            $stmt = $connection->prepare($query);
            $stmt->bind_param("d", $user_id);
            $stmt->execute();
            $stmt->bind_result($averageValue);
            $stmt->fetch();
            if ($averageValue == "") {
                echo ("Nan");
            }
            echo "$averageValue";
        } else {
            echo "Invalid parameter value.";
        }
    } else {
        echo "Invalid user agent or IP address.";
    }
} else {
    echo "Invalid token.";
}

$connection->close();
?>