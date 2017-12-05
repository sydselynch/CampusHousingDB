<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Resident Roster</title>
</head>

<h1 align="center">Current Housing Roster</h1>

<body bgcolor="white">


<?php

$query = 'SELECT CONCAT(first_name, " ", last_name) AS name, hall.hall_name, hall.hall_code, room_number, complex_code
          FROM assignment
          JOIN resident USING(resident_id)
          JOIN room USING(room_id)
          JOIN hall USING(hall_code)
          JOIN complex USING(complex_id)
          ORDER BY hall_code, room_number';

$sql = $conn->prepare($query);
$result = $sql->execute()
or die(mysqli_error($conn));

$sql->bind_result($resident, $hallName, $hallCode, $room, $complex);

print "<pre>";
while($row = $sql->fetch()){
  printf("%s %s %s %s %s\n", $resident, $hallName, $hallCode, $room, $complex);
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
