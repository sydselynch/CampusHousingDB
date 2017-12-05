<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Resident Look-Up</title>
</head>

<h1 align="center">Resident Look-Up</h1>
<h3 align="center"><a href="home.php">Return Home</a></h3>

<body bgcolor="white">

<?php
if (isset($_POST['first']) && isset($_POST['last'])){
  $firstName = $_POST['first'];
  $lastName = $_POST['last'];


  $query = 'SELECT CONCAT(first_name, " ", last_name) AS name, hall.hall_name, hall.hall_code, room_number, complex_name
            FROM assignment
            JOIN resident USING(resident_id)
            JOIN room USING(room_id)
            JOIN hall USING(hall_code)
            JOIN complex USING(complex_id)
            WHERE first_name = (?) AND last_name = (?)
            LIMIT 1';

  $sql = $conn->prepare($query);
  $sql->bind_param("ss", $firstName, $lastName);

  $result = $sql->execute()
  or die(mysqli_error($conn));

  $sql->bind_result($resident, $hallName, $hallCode, $room, $complex);
?>
<table style="width:100%;">
  <thead>
    <tr>
      <th>Name</th>
      <th>Hall Name</th>
      <th>Hall Code</th>
      <th>Room</th>
      <th>Complex</th>
    </tr>
  </thead>
  <tbody>
<?php
while($row = $sql->fetch()){
  ?>
  <tr>
    <td align="center"><?php echo $resident; ?></td>
    <td align="center"><?php echo $hallName; ?></td>
    <td align="center"><?php echo $hallCode; ?></td>
    <td align="center"><?php echo $room; ?></td>
    <td align="center"><?php echo $complex; ?></td>
  </tr>

  <!-- #printf("%s %s %s %s %s\n", $resident, $hallName, $hallCode, $room, $complex); -->
</tbody>
</table>

<?php
#end if!!!
  }
  $sql->close();
  mysqli_free_result($result);
  mysqli_close($conn);

}
?>

<form action="lookup.php" method="POST">

<input type="text" name="first">
<input type="text" nane="last"> <br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>

</body>
</html>