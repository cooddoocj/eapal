<?php

include 'db.php';

// ghi du lieu
if (isset($_POST['submit'])) {
	extract($_POST);
	// s khong rong
	if (!empty($s)) {
		$flag = isset($flag) ? $flag : 'g';
		$query = "INSERT INTO regex (s, r, flag) values (:s, :r, :flag)";
		$stmt = $db->prepare($query);
		$stmt->execute(array(
			':s' => $s,
			':r' => $r,
			':flag' => $flag
		));
	}
	header('Location: regex.php');
}

$regexs = $db->query("SELECT * FROM regex ORDER BY id ASC")->fetchAll(PDO::FETCH_ASSOC);

// xoa id
if (isset($_GET['xoa_id'])) { 
	$query = "DELETE FROM regex WHERE id = :id";
	$stmt = $db->prepare($query);
	$stmt->execute(array(':id' => $_GET['xoa_id']));
	header('Location: regex.php');
	exit;
}

// rỗng trang
if(isset($_GET['xoa_all'])){ 
	$stmt = $db->query('TRUNCATE TABLE regex') ;
	header('Location: regex.php');
	exit;
}

?>
<title>Regex</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
	a { text-decoration: none; }
	input[type=submit], textarea {
		display: block;
		margin: 5px 0;
	}
</style>
<form method="post">
	<textarea name="s" style="width: 100%;"></textarea>
	<textarea name="r" style="width: 100%;"></textarea>
	<input type="radio" name="flag" value="u"> <b>/u</b>
	<input type="radio" name="flag" value="i"> <b>/i</b>
	<input type="radio" name="flag" value="is"> <b>#is</b>
	<input type="radio" name="flag" value="iu"> <b>/iu</b>
	<input type="radio" name="flag" value="td"> <b>/tđ</b>
	<input type="submit" name="submit" value="Replace">
</form>
<p><a href="?xoa_all" onclick = "if (! confirm('Xoá?')) { return false; }">Xoá code</a></p>
<hr>
<div style="white-space: nowrap;overflow: auto;">
<?php
foreach ($regexs as $key => $value) {
	//echo "[$key] " . $value['search'] . " => " . $value['replace'] . "<hr>";
	$s = str_replace(' ', '▂', $value['s']);
	$r = str_replace(' ', '▂', $value['r']);
	$id = $value['id'];

	if ($value['flag'] == 'u') {
		$flag = '/u';
	} elseif ($value['flag'] == 'i') {
		$flag = '/i';
	} elseif ($value['flag'] == 'is') {
		$flag = '#is';
	} elseif ($value['flag'] == 'iu') {
		$flag = '/iu';
	} elseif ($value['flag'] == 'td') {
		$flag = '/td';
	} else {
		$flag = '/g';
	}
	?>
	<pre>[<b><?php echo sprintf("%02d", $id) ?></b>] <span style="background-color: yellow"><?php echo htmlspecialchars($s) ?> <font color="red"><?php echo $flag ?></font> <?php echo (($r != null) ? htmlspecialchars($r) : '<font color="gray"><i>null</i></font>') ?></span> [<a href="?site=<?php echo $the_site['name'] ?>&xoa_id=<?php echo $id ?>" onclick = "if (! confirm('Xoá?')) { return false; }">xóa</a> | <a href="edit.php?id=<?php echo $id ?>" onclick = "if (! confirm('Xoá?')) { return false; }">sửa</a>]</pre>
	<?php
}
?>
</div>