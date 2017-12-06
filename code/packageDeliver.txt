<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Package Delivery</title>
</head>

<h1 align="center">Package Delivery</h1>
<h3 align="center"><a href="home.php">Return Home</a></h3>

<body bgcolor="white">

<?php
if (isset($_POST['id']) && isset($_POST['tracking'])) {
  $id = $_POST['id'];
  $tracking = $_POST['tracking'];

  $query = 'UPDATE package
            SET out_date = now()
            WHERE student_id = (?) AND tracking_number = (?) AND out_date IS NULL';
  $sql = $conn->prepare($query);
  $sql->bind_param("is", $id, $tracking);
  $result = $sql->execute()
  or die(mysqli_error($conn));

  echo "The package with tracking $tracking has been delivered to recipient with id $id.\n";
}

?>

<p>
Deliver a package (Student ID, tracking) <br>
Example (951000000, 1Z5391ABC)
<p>
<form action="packageDeliver.php" method="POST" style="text-align: center;">

<input type="number" name="id" placeholder="ID">
<input type="text" name="tracking" placeholder="Tracking">
<br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>



<hr>
<h4 align="center">Package Log</h4>

<?php

$query = 'SELECT package_recipient, student_id, in_date, out_date, tracking_number
          FROM package
          ORDER BY out_date';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($recipient, $id, $in, $out, $tracking);

?>

<table style="width:100%;">
  <thead>
    <tr>
      <th>Recipient</th>
      <th>Student ID</th>
      <th>In Date</th>
      <th>Out Date</th>
      <th>Tracking Number</th>
    </tr>
  </thead>
  <tbody>
<?php
while($row = $sql->fetch()){
  ?>
  <tr>
    <td align="center"><?php echo $recipient; ?></td>
    <td align="center"><?php echo $id; ?></td>
    <td align="center"><?php echo $in; ?></td>
    <td align="center"><?php echo $out; ?></td>
    <td align="center"><?php echo $tracking; ?></td>
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
