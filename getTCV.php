<?php

include 'db.php';
include 'simple_html_dom.php';

$config = $db->query("SELECT value FROM config")->fetchAll(PDO::FETCH_ASSOC);
$loc = $config[3]['value'];
$nl2p = $config[4]['value'];
$remove = $config[5]['value'];

$html = file_get_html($_GET['link']);

$tieude = $html->find('h2.title', 0)->plaintext;

$raw = $html->find('div#js-truyencv-content', 0);
$noidung = remove($raw, $remove);
$noidung = str_replace("<p>&nbsp;</p>", "", $noidung);

// nl2p
if ($nl2p == 'yes') {
	$noidung = strip_tags($noidung, '<br><p>');
	$noidung = preg_replace('/((<br\s*\/?>|<\/?p>)\s*)+/', "\n", $noidung);
	$noidung = nl2p($noidung);
}

// loc
if ($loc == 'yes') {
	$noidung = loc($noidung);
}

$regexs = $db->query("SELECT s, r, flag FROM regex ORDER BY id ASC")->fetchAll(PDO::FETCH_ASSOC);

foreach ($regexs as $regex) {
	if ($regex['flag'] == 'g') {
		$noidung = preg_replace('/' . $regex['s'] . '/', $regex['r'], $noidung);
	} elseif ($regex['flag'] == 'u') {
		$noidung = preg_replace('/' . $regex['s'] . '/u', $regex['r'], $noidung);
	} elseif ($regex['flag'] == 'i') {
		$noidung = preg_replace('/' . $regex['s'] . '/i', $regex['r'], $noidung);
	} elseif ($regex['flag'] == 'is') {
		$noidung = preg_replace('#' . $regex['s'] . '#is', $regex['r'], $noidung);
	} elseif ($regex['flag'] == 'iu') {
		$noidung = preg_replace('/' . $regex['s'] . '/iu', $regex['r'], $noidung);
	} elseif ($regex['flag'] == 'td') {
		$tieude = preg_replace('/' . $regex['s'] . '/', $regex['r'], $tieude);
	}
}

echo "$tieude<br>➥<br>➥<br><br>$noidung<br>⊙⊙";

function remove($nguon, $xoa) {
	foreach ($nguon->find($xoa) as $node) {
		$node->outertext = '';
	}
	return $nguon->innertext;
}
