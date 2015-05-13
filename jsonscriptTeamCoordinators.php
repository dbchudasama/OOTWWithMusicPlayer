<?php
 
  	/***************************************************************
		Description: 	NHSFTeamCoordinators data in JSON.
		Developer:	Divyesh B Chudasama
	***************************************************************/
	
	$host = "localhost"; //Database host server
	$db = "nhsfevents"; //Database name
	$user = "dbchudasama"; //Database user
	$pass = "porbander27"; //Password
	
	$connection = mysql_connect($host, $user, $pass);
	
	//Check to see if we can connect to the server
	if(!$connection)
	{
		die("Database server connection failed.");	
	}
	else
	{
		//Attempt to select the database
		$dbconnect = mysql_select_db($db, $connection);
		
		//Check to see if we could select the database
		if(!$dbconnect)
		{
			die("Unable to connect to the specified database!");
		}
		else
		{
			$query = "SELECT * FROM NHSFTeamCoordinators";
			$resultset = mysql_query($query, $connection);
			
			$records = array();
			
			//Loop through all the records and add them to the array
			while($r = mysql_fetch_assoc($resultset))
			{
				$records[] = $r;		
			}
			
			//Output the data as JSON
			echo json_encode($records);
		}
		
		
	}
	
 
?>
