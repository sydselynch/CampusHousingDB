<?php

include('connection.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Assignment 4</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
<?php
$manufacturer = $_POST['manufacturer'];
 
$query = "SELECT description, COALESCE(SUM(total_price), 0) AS total FROM stock AS s LEFT JOIN items AS i USING(stock_num, manu_code) JOIN manufact USING(manu_code) LEFT JOIN orders USING(order_num) WHERE manu_name = {$manufacturer} GROUP BY description";

$sql = $conn->prepare("SELECT description, COALESCE(SUM(total_price), 0) AS total FROM stock AS s LEFT JOIN items AS i USING(stock_num, manu_code) JOIN manufact USING(manu_code) LEFT JOIN orders USING(order_num) WHERE manu_name = (?) GROUP BY description");
$sql->bind_param("s", $manufacturer);

?>

<p>
The query:
<p>
<?php
print $query;
?>

<hr>
<p>
Result of query:
<p>

<?php
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($desc, $total);

print "<pre>";
while($row = $sql->fetch())
  {
    printf("%s %s\n", $desc, $total);
  }
print "</pre>";

$sql->close();

mysqli_free_result($result);

mysqli_close($conn);

?>

<p>
<hr>
 	 
 
</body>
</html>
