<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Key Check-Out</title>
</head>

<h1 align="center">Key Check-Out</h1>
<h3 align="center"><a href="home.php">Return Home</a></h3>

<body bgcolor="white">


<?php

if (isset($_POST['id'])) {
  $id = $_POST['id'];

  $query = 'SELECT room_key_code
            FROM resident
            JOIN assignment USING(resident_id)
            JOIN room USING(room_id)
            WHERE student_id = (?)';

  $sql = $conn->prepare($query);
  $sql->bind_param("i", $id);
  $result = $sql->execute()
  or die(mysqli_error($conn));
  $sql->bind_result($key);
  $sql->fetch();
  $key_code = $key;
  $sql->close();

  $query = 'INSERT INTO key_borrow (room_key_code, out_date, student_id)
            VALUES ((?), now(), (?))';

  $sql->bind_param("ii", $key, $id);
  $result = $sql->execute()
  or die(mysqli_error($conn));

  echo "$key has been loaned to $id\n";
}


?>


<p>
Check-Out Key <br>
Example (951000000)
<p>
<form action="keyLoan.php" method="POST" style="text-align: center;">

<input type="number" name="id" placeholder="ID">
<br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>

<hr>
<h4 align="center">Keys Currently Out</h4>

<?php

$query = 'SELECT student_id, room_key_code, out_date
          FROM key_borrow
          WHERE in_date IS NULL';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($id, $code, $out);

?>

<table style="width:100%;">
  <thead>
    <tr>
      <th>Student ID</th>
      <th>Key Code</th>
      <th>Out Date</th>
    </tr>
  </thead>
  <tbody>
<?php
while($row = $sql->fetch()){
  ?>
  <tr>
    <td align="center"><?php echo $id; ?></td>
    <td align="center"><?php echo $code; ?></td>
    <td align="center"><?php echo $out; ?></td>
  </tr>

<?php } ?>
</tbody>
</table>
<hr>
<h4 align="center">Resident Rooms and Keys</h4>

<?php

$query = 'SELECT student_id, CONCAT(first_name, " ", last_name) AS name, room_number, hall_code, room_key_code
          FROM resident
          JOIN assignment USING(resident_id)
          JOIN room USING(room_id)
          JOIN hall USING(hall_code)';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($id, $name, $room, $hall, $key);

?>

<table style="width:100%;">
  <thead>
    <tr>
      <th>Student ID</th>
      <th>Name</th>
      <th>Room</th>
      <th>Hall</th>
      <th>Key Code</th>
    </tr>
  </thead>
  <tbody>
<?php
while($row = $sql->fetch()){
  ?>
  <tr>
    <td align="center"><?php echo $id; ?></td>
    <td align="center"><?php echo $name; ?></td>
    <td align="center"><?php echo $room; ?></td>
    <td align="center"><?php echo $hall; ?></td>
    <td align="center"><?php echo $key; ?></td>
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
