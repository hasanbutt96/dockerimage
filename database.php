<?php
$server = 'mysql';
$username = 'root';
$password = 'secret';
$database = 'auth';
#$db_host = 3306;
try{
	echo "inside try";
	$conn = new PDO("mysql:host=$server;dbname=$database;dbhost", $username, $password);
} catch(PDOException $e){
	echo "inside catch";
	die( "Connection failed: " . $e->getMessage());
}