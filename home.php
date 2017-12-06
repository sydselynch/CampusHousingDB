<?php
include('connection.php');
#connect to the housing database
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Campus Housing System</title>
</head>
<hr>
<body bgcolor="white">


<h1 align="center">Campus Housing System</h1>


<table style="width:100%;">
  <tr>
    <th>Administrative Tools</th>
    <th>Equipment Check-out</th>
    <th>Key Check-out</th>
    <th>Mail and Packages</th>
  </tr>
  <tr>
    <td align="center"><a href="roster.php">Roster</a></td>
    <td align="center"><a href="equipLoan.php">Loan</a></td>
    <td align="center"><a href="keyLoan.php">Loan</a></td>
    <td align="center"><a href="packageLog.php">Log</a></td>
  </tr>
  <tr>
    <td align="center"><a href="lookup.php">Look-Up</a></td>
    <td align="center"><a href="equipReturn.php">Return</a></td>
    <td align="center"><a href="keyReturn.php">Return</a></td>
    <td align="center"><a href="packageDeliver.php">Deliver</a></td>
  </tr>
  <tr>
    <td align="center"><a href="cico.php">Check-In and Check-Out</a></td>
  </tr>
</table>

<hr>
<p>
  Links to all code, connection information, and the mysqldump of the datebase:
<p>
<a href="code/home.txt">Home</a><br>
<a href="code/roster.txt">Roster</a><br>
<a href="code/lookup.txt">Look-Up</a><br>
<a href="code/cico.txt">Check-In and Check-Out</a><br>
<a href="code/equipLoan.txt">Equipment Loan</a><br>
<a href="code/equipReturn.txt">Equipment Return</a><br>
<a href="code/keyLoan.txt">Key Loan</a><br>
<a href="code/keyReturn.txt">Key Return</a><br>
<a href="code/packageLog.txt">Package Log</a><br>
<a href="code/packageDeliver.txt">Package Deliver</a><br>

<br>
<a href="dump/">MySQL Dump of the Housing Database</a><br>
