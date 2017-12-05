<?php
include('connection.txt')

#connect to the housing database
#$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
#or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Campus Housing System</title>
</head>

<body bgcolor="gray">

<h1 align="center">Campus Housing System</h1>


<table style="width:100%;">
  <tr>
    <th>Administrative Tools</th>
    <th>Equipment Check-out</th>
    <th>Key Checkout</th>
    <th>Mail and Packages</th>
  </tr>
  <tr>
    <td align="left">Roster</td>
    <td align="left">Loan</td>
    <!-- <a href="..."> -->
  </tr>
  <tr>
    <td align="left">Look-Up</td>
    <td align="left">Return</td>
    <td align="left">Loan</td>

  </tr>
  <tr>
    <td align="left">Check-In and Check-Out</td>
    <td align="center">Return</td>
  </tr>
  <tr>
    <td></td>
    <td align="center">Log</td>
    <td align="center">Deliver</td>
  </tr>
</table>
