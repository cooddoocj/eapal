<?php

include 'db.php';

if (isset($_POST['submit'])) {
    
    extract($_POST);

    $loc = isset($loc) ? 'yes' : 'no';
    $nl2p = isset($nl2p) ? 'yes' : 'no';

    if (empty($url) || empty($start) || empty($end)) {
    	$error = 'Trống!';
    }
    elseif ($start >= $end) {
    	$error = 'start phải bé hơn end';
    }
    elseif (!preg_match('/truyencv\.com\/[a-z0-9-]+\//', $url)) {
    	$error = 'Chỉ hỗ trợ truyencv.com/*/';
    }
    $sets = array(
        'url'                  => $url,
        'start'              => $start,
        'end'       => $end,
        'loc'          => $loc,
        'nl2p'    => $nl2p,
        'remove'        => $remove
    );

    if (!isset($error)) {
        foreach ($sets as $key => $value) {

        	update($key, $value);

        }

        //$error = 'Thành công';

		for ($i = $start; $i <= $end; $i++) { 
			$urls[] = $url . 'chuong-' . $i . '/';
		}

		$content = multi_curl($urls);
		preg_match_all('#<title>(.*?)</title>#is', $content, $tit);

		echo '<p><a style="background-color: yellow" href="get.php?link=' . $url . '&s=' . $start . '&e=' . $end . '">
			get.php?link=' . $url . '&s=' . $start . '&e=' . $end . '
		</a></p>';
		echo '<div style="white-space: nowrap;overflow: auto;">';
		foreach ($tit[1] as $key => $value) {
			$value = preg_replace('/.*?-\s*(.*)/', '$1', $value);
			echo "<pre><a href='bookmark.php?title={$value}'>$key</a> => <a href='getTCV.php?link={$urls[$key]}'>$value</a></pre>\n";
		}
		echo '</div>';


    }


}

//$options = $db->query("SELECT * FROM options")->fetchAll(PDO::FETCH_OBJ);


function update($name, $value)
{
	GLOBAL $db;
	$query = "UPDATE config SET value = :value WHERE name = :name";
	$stmt = $db->prepare($query);
	$stmt->execute(array(
		':name' => $name,
		':value' => $value
	));
}

function option($name)
{
    GLOBAL $db;
    $query = "SELECT value FROM config WHERE name = :name";
    $stmt = $db->prepare($query);
    $stmt->execute(array(':name' => $name));
    $ops = $stmt->fetch(PDO::FETCH_OBJ)->value;
    return $ops;
}

?>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>getTCV</title>
<style>
	a { text-decoration: none; }
	input[name=url],
	input[type=submit],
	input[type=number],
	textarea {
		display: block;
		margin: 10px 0;
	}
	input[name=url],
	input[type=submit],
	textarea {
		width: 100%;
	}
	input[type=number] {
		display: block;
		margin: 10px 0;
	}
	input[type=radio] {
		display: inline-block;
		padding-right: 10px;
	}
</style>
<?php

if (isset($error)) {
    echo "<p>$error</p>";
}


?>

<form method="post">
	<input type="text" name="url" onfocus="this.value=''" value="<?php echo option('url') ?>">
	<input type="number" name="start" onfocus="this.value=''" value="<?php echo option('start') ?>">
	<input type="number" name="end" onfocus="this.value=''" value="<?php echo option('end') ?>">
	<input type="checkbox" name="loc" <?php if (option('loc') == 'yes') { echo 'checked="checked"'; } ?>> lọc
	<input type="checkbox" name="nl2p" <?php if (option('nl2p') == 'yes') { echo 'checked="checked"'; } ?>> nl2p
	<textarea name="remove" style="width: 100%;"><?php echo option('remove') ?></textarea>
	<input type="submit" name="submit" value="Option">
</form>
<hr>
<p><a href="regex.php">Regex</a> - <a href="notes.php">Notes</a> - <a href="bookmark.php">Bookmark</a></p>