<?php

include 'db.php';

$query = "INSERT INTO bookmark (content) values (:content)";
$stmt = $db->prepare($query);
$bm = json_decode(file_get_contents("bm.txt"), true);

foreach ($bm as $value) {
	$stmt->execute(array(':content' => $value['content']));
}