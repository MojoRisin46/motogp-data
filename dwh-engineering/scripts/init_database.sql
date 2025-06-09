/*

=====================================================================
Create 3 databases inside MySQL for the 3 layers
=====================================================================

Script Purpose:
	This script will attempt to create 3 new databases, one for each layer (since MySQL doesn't support Schemas), if they don't already exist
	
WARNINGS:
	 If the databases already exist, you will receive an error message and the script will fail

*/

CREATE DATABASE motogp_bronze;
CREATE DATABASE motogp_silver;
CREATE DATABASE motogp_gold;


