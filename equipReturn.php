<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Equipment Check-In</title>
</head>

<h1 align="center">Equipment Check-In</h1>
<h3 align="center"><a href="home.php">Return Home</a></h3>

<body bgcolor="white">


<?php

if (isset($_POST['id']) && isset($_POST['item'])) {
  $id = $_POST['id'];
  $item = $_POST['item'];

  $query = 'UPDATE equipment_borrow
            SET in_date = now()
            WHERE item = (?) AND student_id = (?) AND in_date IS NULL';
  $sql = $conn->prepare($query);
  $sql->bind_param("si", $item, $id);
  $result = $sql->execute()
  or die(mysqli_error($conn));

  echo $item." has been returned";

}
?>


<p>
Check-In Equipment <br>
Example (Basketball, 951000000)
<p>
<form action="equipReturn.php" method="POST" style="text-align: center;">

<input type="text" name="item" placeholder="Item">
<input type="number" name="id" placeholder="ID">
<br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>


<hr>
<h4 align="center">Equipment Checked Out</h4>

<?php

$query = 'SELECT item, student_id, CONCAT(first_name, " ", last_name) AS name, out_date, in_date
          FROM equipment_borrow
          JOIN resident USING (student_id)';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($item, $id, $name, $out_date, $in_date);

?>

<table style="width:100%;">
  <thead>
    <tr>
      <th>Item</th>
      <th>Student ID</th>
      <th>Name</th>
      <th>Out Date</th>
      <th>In Date</th>
    </tr>
  </thead>
  <tbody>
<?php
while($row = $sql->fetch()){
  ?>
  <tr>
    <td align="center"><?php echo $item; ?></td>
    <td align="center"><?php echo $id; ?></td>
    <td align="center"><?php echo $name; ?></td>
    <td align="center"><?php echo $out_date; ?></td>
    <td align="center"><?php echo $in_date; ?></td>
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
