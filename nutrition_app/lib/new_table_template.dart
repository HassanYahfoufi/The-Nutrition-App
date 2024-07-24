import 'package:flutter/material.dart';
import 'package:nutrition_app/models.dart'; 
import 'package:nutrition_app/database_helper.dart'; 

main()
{
  DatabaseHelper databaseHelper = DatabaseHelper();
  //TEXT  INTEGER   REAL

 
  debugPrint("[main.dart-> setUpDatabase()] setting up Blank table ...");
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  databaseHelper.table["BlankTable"] = TableInfo(name: "BlankTable", type: "blank_table_v1");
  databaseHelper.table["BlankTable"]!.addColumn("id", "INTEGER PRIMARY KEY AUTOINCREMENT"); //replace id with account_id
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  databaseHelper.table["BlankTable"]!.addColumn("required_var_underscore01", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("required_var_underscore02", "BLOB");
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  databaseHelper.table["BlankTable"]!.addColumn("required_conversion_var_underscore01", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("required_conversion_var_underscore02", "BLOB");
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  databaseHelper.table["BlankTable"]!.addColumn("optional_var_underscore01", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_var_underscore02", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_var_underscore03", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_var_underscore04", "BLOB");
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  databaseHelper.table["BlankTable"]!.addColumn("optional_conversion_var_underscore01", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_conversion_var_underscore02", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_conversion_var_underscore03", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_conversion_var_underscore04", "BLOB");
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx

}

/*
Blank
blank

required_var_underscore01

optional_var_underscore01
 */