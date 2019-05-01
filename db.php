<?php

$host = 'ec2-54-225-129-101.compute-1.amazonaws.com';
$dbname = 'dbu32ump51i16k';
$username = 'hronsnruwxdwem';
$password = 'c0ae91a6933f2a9ba6b72b494e9e3a7e2c1568d054e884be79a5cac3c8af19d7';
$port = '5432';

$db = new PDO("pgsql:host=$host;dbname=$dbname" . ";options='-c client_encoding=utf8'", $username, $password);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

include 'functions.php';

?>
