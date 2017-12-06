<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Key Check-In</title>
</head>

<h1 align="center">Key Check-In</h1>
<h3 align="center"><a href="home.php">Return Home</a></h3>

<body bgcolor="white">


<?php

if (isset($_POST['id'])) {
  $id = $_POST['id'];

  $query = 'UPDATE key_borrow
            SET in_date = now()
            WHERE student_id = (?) AND in_date IS NULL';
  $sql = $conn->prepare($query);
  $sql->bind_param("i", $id);
  $result = $sql->execute()
  or die(mysqli_error($conn));

  echo "The key loaned to $id has been returned";
}
?>


<p>
Check-In Keys (Student ID) <br>
Example (951000000)
<p>
<form action="keyReturn.php" method="POST" style="text-align: center;">

<input type="number" name="id" placeholder="ID">
<br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>


<hr>
<h4 align="center">Key Checkout Log</h4>

<?php

$query = 'SELECT student_id, room_key_code, out_date, in_date
          FROM key_borrow
          ORDER BY in_date';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($id, $key, $out_date, $in_date);

?>

<table style="width:100%;">
  <thead>
    <tr>
      <th>Student ID</th>
      <th>Key</th>
      <th>Out Date</th>
      <th>In Date</th>
    </tr>
  </thead>
  <tbody>
<?php
while($row = $sql->fetch()){
  ?>
  <tr>
    <td align="center"><?php echo $id; ?></td>
    <td align="center"><?php echo $key; ?></td>
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
