<!DOCTYPE html>

<html>
<head>
<title>Disconnect the Dots</title>
<link rel="stylesheet" type="text/css" href="../geldbuch.css"/>
<link rel="shortcut icon" href="../images/purplemushroom.ico"/>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script type = "text/javascript" src = "../geldbuch.js"></script>

</head>

<body>
<div id='sourceForm'>
<form action="insertSource.php" method="post">
Account: <input type="text" id="inAccountName" value=""></input>
Institution: <input type="text" id="inInstitutionName" value=""></input>
<input type="submit" value="Connect"/>
</form>
</div>

<div id="tableDiv">
<?php
//form connection to database
	$user = "root";
	$password = "clownfish";
$database = mysql_connect("localhost", $user, $password);
//if connection cannot be made
if(!$database){
	//exit and display that the connection wasn't made
	exit("Connection cannot be made to MySQL.");
}
//
//select database
	$database_name = "geld";
$er = mysql_select_db($database_name);
//if the database is not selected
if(!$er){
	//exit and display the selection wasn't made
	exit("Could not select database.");
}

print "<div id='accountSelectDiv'>";

//send along SQL select statement,
$selectStatement = "SELECT account.id, account.name FROM account ORDER BY name;";
//echo "<br/>" . $selectStatement;
$result = mysql_query($selectStatement);
//echo "<p>".$result."</p>";
if (!$result) {
   print "Error - query cannot be processed: ";
   $error = mysql_error();
   print "$error";
   exit;
}
//Process the result.
//
/*for($i = 0; $i < count($row); $i++){
	echo $row[$i];
}*/
$num_rows = mysql_num_rows($result);
print "<TABLE align=center><TR><TH>Account</TH></TR>";
for ($i = 0; $i < $num_rows; $i++) {
   $row = mysql_fetch_row($result);
   print "
   <TR>
   <TD class='accountSelect' id='account$row[0]'>$row[1]</TD>
   </TR>";
   print "\n";
}
print "</TABLE>";
print "</div>";

//center table is the sources between accounts and places
print "<div id='sourceDiv'>";

//send along SQL select statement,
$selectStatement = "select account.name, institution.name from account, institution where account.id = (select account_id from source) AND institution.id = (select institution_id from source);";
//echo "<br/>" . $selectStatement;
$result = mysql_query($selectStatement);
//echo "<p>".$result."</p>";
if (!$result) {
   print "Error - query cannot be processed: ";
   $error = mysql_error();
   print "$error";
   exit;
}
//Process the result.
//
/*for($i = 0; $i < count($row); $i++){
	echo $row[$i];
}*/
$num_rows = mysql_num_rows($result);
print "<TABLE align=center><TR><TH>Account</TH><TH>Place</TH></TR>";
for ($i = 0; $i < $num_rows; $i++) {
   $row = mysql_fetch_row($result);
   print "
   <TR>
   <TD>$row[0]</TD>
   <TD>$row[1]</TD>
   </TR>";
   print "\n";
}
print "</TABLE>";
print "</div>";

print "<div id='institutionSelectDiv'>";

//send along SQL select statement,
$selectStatement = "SELECT institution.id, institution.name FROM institution ORDER BY name;";
//echo "<br/>" . $selectStatement;
$result = mysql_query($selectStatement);
//echo "<p>".$result."</p>";
if (!$result) {
   print "Error - query cannot be processed: ";
   $error = mysql_error();
   print "$error";
   exit;
}
//Process the result.
//
/*for($i = 0; $i < count($row); $i++){
	echo $row[$i];
}*/
$num_rows = mysql_num_rows($result);
print "<TABLE align=center><TR><TH>Place</TH></TR>";
for ($i = 0; $i < $num_rows; $i++) {
   $row = mysql_fetch_row($result);
   print "<TR>
   <TD class='institutionSelect' id='account$row[0]'>$row[1]</TD>
   </TR>";
   print "\n";
}
print "</TABLE>";
print "</div>";
mysql_close($database);
?>
</div>


</body>
</html>