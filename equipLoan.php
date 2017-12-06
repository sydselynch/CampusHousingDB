<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Check-In and Check-Out</title>
</head>

<h1 align="center">Check-In and Check-Out</h1>
<h3 align="center"><a href="home.php">Return Home</a></h3>

<body bgcolor="white">


<?php

if (isset($_POST['id']) && isset($_POST['item'])) {
  $id = $_POST['id'];
  $item = $_POST['item'];

  


}


?>


<p>
Check-Out Equipment <br>
Example (Basketball, 951000000)
<p>
<form action="equipLoan.php" method="POST" style="text-align: center;">

<input type="text" name="item" placeholder="Item">
<input type="number" name="id" placeholder="ID">
<br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>


<hr>
<h4 align="center">Equipment Checked Out</h4>

<?php

$query = 'SELECT item, student_id, out_date
          FROM equipment_borrow
          WHERE in_date IS NULL';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($item, $id, $out_date);

?>

<table style="width:100%;">
  <thead>
    <tr>
      <th>Item</th>
      <th>Student ID</th>
      <th>Out Date</th>
    </tr>
  </thead>
  <tbody>
<?php
while($row = $sql->fetch()){
  ?>
  <tr>
    <td align="center"><?php echo $item; ?></td>
    <td align="center"><?php echo $id; ?></td>
    <td align="center"><?php echo $out_date; ?></td>
  </tr>

<?php } ?>
</tbody>
</table>

<?php

$sql->close();
mysqli_free_result($result);
mysqli_close($conn);

?>

<p>
<hr>


</body>
</html>
