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
if (isset($_POST['id_in']) && isset($_POST['first_in']) && isset($_POST['last_in'])
    && isset($_POST['group']) && isset($_POST['mailbox']) && isset($_POST['complex'])
    && isset($_POST['hall']) && isset($_POST['room'])) {
      $id = $_POST['id_in'];
      $first = $_POST['first_in'];
      $last = $_POST['last_in'];
      $group = $_POST['group'];
      $mailbox = $_POST['mailbox'];
      $complex = $_POST['$complex'];
      $hall = $_POST['$hall'];
      $room = $_POST['$room'];

      echo "set";

      $query = "INSERT INTO resident (student_id, first_name, last_name, group_code, gender, mailbox_num)
                VALUES (?, ?, ?, ?, ?, ?)";

      $sql = $conn->prepare($query);
      $sql->bind_param("issssi", (int)$id, $first, $last, $group, $gender, (int)$mailbox);

      $result = $sql->execute()
      or die(mysqli_error($conn));

      echo "success";

    }
#INSERT INTO resident (student_id, first_name, last_name, group_code, gender, mailbox_num)
#VALUES (951000015, 'Charlie', 'Placho', 'RES', 'M', 15093)



?>





<p>
Check-In a Resident (ID, First, Last, GroupCode, Gender, Mailbox)
<p>
<form action="cico.php" method="POST" style="text-align: center;">

<input type="text" name="id_in" placeholder="ID">
<input type="text" name="first_in" placeholder="First Name">
<input type="text" name="last_in" placeholder="Last Name">
<input type="text" name="group" placeholder="Group Code">
<input type="text" name="mailbox" placeholder="Mailbox">
<br>
<p>
Assign to an open room (listed below)
<p>
<input type="text" name="complex" placeholder="Complex Name">
<input type="text" name="hall" placeholder="Hall Name">
<input type="text" name="room" placeholder="Room">
<br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>

<p>
Check-Out a Resident (Name or ID)
<form action="cico.php" method="POST" style="text-align: center;">

<input type="text" name="id_out" placeholder="ID">
<input type="text" name="first_out" placeholder="First Name">
<input type="text" name="last" placeholder="Last Name">
<br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>



<hr>
<h4 align="center">Rooms without a person assigned</h4>

<?php

$query = 'SELECT hall.hall_name, hall.hall_code, room_number, complex_name
          FROM room
          JOIN hall USING(hall_code)
          JOIN complex USING(complex_id)
          WHERE room_id NOT IN
          (
          SELECT room_id
          FROM assignment
          WHERE assignment.end_date IS NULL
          )';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($hallName, $hallCode, $room, $complex);

?>
<table style="width:100%;">
  <thead>
    <tr>
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
    <td align="center"><?php echo $hallName; ?></td>
    <td align="center"><?php echo $hallCode; ?></td>
    <td align="center"><?php echo $room; ?></td>
    <td align="center"><?php echo $complex; ?></td>
  </tr>

  <!-- #printf("%s %s %s %s %s\n", $resident, $hallName, $hallCode, $room, $complex); -->
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
