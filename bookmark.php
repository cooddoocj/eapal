<?php

include 'db.php';

if (isset($_GET['title'])){

  $title = $_GET['title'];

  if($title ==''){
    $error = 'error';
  }else{
    $query = "INSERT INTO bookmark (content) VALUES (:content)";
    $stmt = $db->prepare($query) ;
    $stmt->execute(array(':content' => $title));
    header('Location: bookmark.php');
  }

  exit('0kie');

}


// xóa trang
if(isset($_GET['xoa_id'])){ 
  $query = "DELETE FROM bookmark WHERE id = :id";
  $stmt = $db->prepare($query) ;
  $stmt->execute(array(':id' => $_GET['xoa_id']));

  header('Location: bookmark.php');
  exit;
} 

// rỗng trang
if(isset($_GET['rong'])){ 

  $stmt = $db->query('TRUNCATE TABLE bookmark') ;

  header('Location: bookmark.php');
  exit;
} 

// in nội dung
$query = "SELECT * FROM bookmark ORDER BY id DESC";
$stmt = $db->prepare($query);
$stmt->execute();
$bms = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>
<title>Bookmark</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
  a {text-decoration: none;}
</style>
<!-- xoa id -->
<script language="JavaScript" type="text/javascript">
  function xoa_id(id, title)
    {
      if (confirm("Bạn có muốn xóa id '" + title + "'"))
    {
      window.location.href = '?xoa_id=' + id;
    }
  }
</script>

<form action="bookmark.php" method="get">
  <textarea name="title" style="width:98%;"></textarea>
  <input type="submit" value="Viết" />
</form>

<?php
// kiểm tra lỗi
if(isset($error)){
  echo "<p>$error</p>";
}
?>

<?php

foreach ($bms as $bm) {
  ?>
  <p><font color="red"><strong><a href="javascript:xoa_id('<?php echo $bm['id'] ?>','<?php echo $bm['content'] ?>')"><?php echo $bm['id'] ?></a>.</strong></font> <?php echo nl2br(htmlspecialchars($bm['content'])) ?></p><hr>

  <?php
}
