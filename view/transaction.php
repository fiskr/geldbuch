<!DOCTYPE html>

<html>
<head>
<title>Transactions</title>
<link rel="stylesheet" type="text/css" href="../geldbuch.css"/>
<link rel="shortcut icon" href="../images/mushroom2.ico"/>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script type = "text/javascript" src = "geldbuch.js"></script>

</head>

<body>

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
//
//send along SQL select statement,
$selectStatement = "SELECT * FROM transaction;";
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
print "<TABLE align=center><TR><TH>ID</TH><TH>Date</TH><TH>Account</TH><TH>Description</TH><TH>Amount</TH>";
for ($i = 0; $i < $num_rows; $i++) {
   $row = mysql_fetch_row($result);
   print "<TR><TD class='transaction_id' id='transaction$row[0]'>$row[0]</TD>
   <TD class='transaction_date'>$row[1]</TD>
   <TD class='transaction_account_id'>$row[2]</TD>
   <TD class='transaction_description'>$row[3]</TD>
   <TD class='transaction_amount'>$row[4]</TD>";
   print "\n";
}
print "</TABLE>";

mysql_close($database);
?>
</div>



</body>
</html>