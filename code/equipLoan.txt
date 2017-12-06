<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Equipment Check-Out</title>
</head>

<h1 align="center">Equipment Check-Out</h1>
<h3 align="center"><a href="home.php">Return Home</a></h3>

<body bgcolor="white">


<?php

if (isset($_POST['id']) && isset($_POST['item'])) {
  $id = $_POST['id'];
  $item = $_POST['item'];

  $query = 'INSERT INTO equipment_borrow (item, student_id, out_date)
            VALUES (?, ?, now())';
  $sql = $conn->prepare($query);
  $sql->bind_param("si", $item, $id);
  $result = $sql->execute()
  or die(mysqli_error($conn));

  echo $item." has been checked out to $id";



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

$query = 'SELECT item, student_id, CONCAT(first_name, " ", last_name) AS name, out_date
          FROM equipment_borrow
          JOIN resident USING (student_id)
          WHERE in_date IS NULL
          ORDER BY out_date DESC';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($item, $id, $name, $out_date);

?>

<table style="width:100%;">
  <thead>
    <tr>
      <th>Item</th>
      <th>Student ID</th>
      <th>Name</th>
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
    <td align="center"><?php echo $name; ?></td>
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
