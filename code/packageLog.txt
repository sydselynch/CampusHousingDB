<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Package Log</title>
</head>

<h1 align="center">Package Log</h1>
<h3 align="center"><a href="home.php">Return Home</a></h3>

<body bgcolor="white">

<?php
if (isset($_POST['name']) && isset($_POST['id']) && isset($_POST['tracking'])) {
  $name = $_POST['name'];
  $id = $_POST['id'];
  $tracking = $_POST['tracking'];

  $query = 'INSERT INTO package (package_recipient, student_id, in_date, tracking_number)
            VALUES (?, ?, now(), ?)';

  $sql = $conn->prepare($query);
  $sql->bind_param("sis", $name, $id, $tracking);
  $result = $sql->execute()
  or die(mysqli_error($conn));
  $sql->close();

  echo "Package has been logged for $name with student ID $id and tracking number $tracking\n";

}


?>



<p>
Log a package (Recipient, Student ID, Tracking Number) <br>
Example (Jerry Larry, 951000000, 1Z5391ABC)
<p>
<form action="packageLog.php" method="POST" style="text-align: center;">

<input type="text" name="name" placeholder="Name">
<input type="number" name="id" placeholder="ID">
<input type="text" name="tracking" placeholder="Tracking">
<br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>


<hr>
<h4 align="center">Package List</h4>

<?php

$query = 'SELECT package_recipient, student_id, in_date, tracking_number
          FROM package
          WHERE out_date IS NULL';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($recipient, $id, $in, $tracking);

?>

<table style="width:100%;">
  <thead>
    <tr>
      <th>Recipient</th>
      <th>Student ID</th>
      <th>In Date</th>
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
