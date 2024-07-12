import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nutrition_app/create_blank_page.dart';
import 'package:nutrition_app/home_page.dart';
import 'package:nutrition_app/register_page.dart';
import 'package:nutrition_app/settings_page.dart';
import 'package:nutrition_app/login_page.dart';
import 'package:nutrition_app/view_food_items.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/models.dart';
import 'package:nutrition_app/create_new_food_items.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:fl_chart/fl_chart.dart';


Future<void> setUpDatabase() async {
  debugPrint("[main.dart-> setUpDatabase()] Start");

  debugPrint("[main.dart-> setUpDatabase()] setting up database...");
  DatabaseHelper databaseHelper = DatabaseHelper();
  debugPrint("[main.dart-> setUpDatabase()] setting up User table ...");
  databaseHelper.table["UserTable"] = TableInfo(name: "UserTable", type: "user_table_v1");
  databaseHelper.table["UserTable"]!.addColumn("id", "INTEGER PRIMARY KEY AUTOINCREMENT"); //replace id with account_id
  databaseHelper.table["UserTable"]!.addColumn("username", "TEXT");
  databaseHelper.table["UserTable"]!.addColumn("password", "TEXT");
  databaseHelper.table["UserTable"]!.addColumn("name", "TEXT");
  databaseHelper.table["UserTable"]!.addColumn("dob", "DATETIME");
  databaseHelper.table["UserTable"]!.addColumn("sex", "INT");
  databaseHelper.table["UserTable"]!.addColumn("height", "DOUBLE");
  databaseHelper.table["UserTable"]!.addColumn("weight", "DOUBLE");

  debugPrint("[main.dart-> setUpDatabase()] setting up StatusUpdate table ...");
  databaseHelper.table["StatusUpdateTable"] = TableInfo(name: "StatusUpdateTable", type: "statusUpdate_table_v1");
  databaseHelper.table["StatusUpdateTable"]!.addColumn("id", "INTEGER PRIMARY KEY AUTOINCREMENT"); //replace id with account_id
  databaseHelper.table["StatusUpdateTable"]!.addColumn("user_id", "INTEGER");
  databaseHelper.table["StatusUpdateTable"]!.addColumn("title", "TEXT");
  databaseHelper.table["StatusUpdateTable"]!.addColumn("timestamp", "TEXT");
  databaseHelper.table["StatusUpdateTable"]!.addColumn("date_created", "TEXT");
  databaseHelper.table["StatusUpdateTable"]!.addColumn("date_modified", "TEXT");
  databaseHelper.table["StatusUpdateTable"]!.addColumn("note", "TEXT");
  databaseHelper.table["StatusUpdateTable"]!.addColumn("weight", "REAL");

  debugPrint("[main.dart-> setUpDatabase()] setting up ConsumedFood table ...");
  databaseHelper.table["ConsumedFoodTable"] = TableInfo(name: "ConsumedFoodTable", type: "consumedFood_table_v2");
  databaseHelper.table["ConsumedFoodTable"]!.addColumn("id", "INTEGER PRIMARY KEY AUTOINCREMENT"); //replace id with account_id
  databaseHelper.table["ConsumedFoodTable"]!.addColumn("user_id", "INTEGER");
  databaseHelper.table["ConsumedFoodTable"]!.addColumn("food_item_id", "INTEGER");
  databaseHelper.table["ConsumedFoodTable"]!.addColumn("amount", "REAL");
  databaseHelper.table["ConsumedFoodTable"]!.addColumn("timestamp", "TEXT");
  databaseHelper.table["ConsumedFoodTable"]!.addColumn("date_created", "TEXT");
  databaseHelper.table["ConsumedFoodTable"]!.addColumn("date_modified", "TEXT");
  databaseHelper.table["ConsumedFoodTable"]!.addColumn("note", "TEXT");

  debugPrint("[main.dart-> setUpDatabase()] setting up FoodItem table ...");
  databaseHelper.table["FoodItemTable"] = TableInfo(name: "FoodItemTable", type: "foodItem_table_v1");
  databaseHelper.table["FoodItemTable"]!.addColumn("id", "INTEGER PRIMARY KEY AUTOINCREMENT"); //replace id with account_id
  databaseHelper.table["FoodItemTable"]!.addColumn("name", "TEXT");
  databaseHelper.table["FoodItemTable"]!.addColumn("serving_size", "INTEGER");
  databaseHelper.table["FoodItemTable"]!.addColumn("note", "TEXT");

  debugPrint("[main.dart-> setUpDatabase()] setting up NutrientInfo table ...");
  databaseHelper.table["NutrientInfoTable"] = TableInfo(name: "NutrientInfoTable", type: "nutrientInfo_table_v1_3");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("id", "INTEGER PRIMARY KEY AUTOINCREMENT"); //replace id with account_id
  databaseHelper.table["NutrientInfoTable"]!.addColumn("user_id", "INTEGER");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("nutrient_id", "INTEGER");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("name", "TEXT");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("recomended_dietary_allowance", "REAL");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("unit_of_measurement_for_recomended_dietary_allowance", "INTEGER");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("description", "TEXT");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("adequate_intake", "REAL");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("unit_of_measurement_for_adequate_intake", "INTEGER");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("estimated_average_requirement", "REAL");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("unit_of_measurement_for_estimated_average_requirement", "INTEGER");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("tolerable_upper_intake_level", "REAL");
  databaseHelper.table["NutrientInfoTable"]!.addColumn("unit_of_measurement_for_tolerable_upper_intake_level", "INTEGER");


  debugPrint("[main.dart-> setUpDatabase()] setting up FoodItemNutrient table ...");
  databaseHelper.table["FoodItemNutrientTable"] = TableInfo(name: "FoodItemNutrientTable", type: "foodItemNutrient_table_v2");
  databaseHelper.table["FoodItemNutrientTable"]!.addColumn("id", "INTEGER PRIMARY KEY AUTOINCREMENT"); //replace id with account_id
  databaseHelper.table["FoodItemNutrientTable"]!.addColumn("food_item_id", "INTEGER");
  databaseHelper.table["FoodItemNutrientTable"]!.addColumn("nutrient_info_id", "INTEGER");
  databaseHelper.table["FoodItemNutrientTable"]!.addColumn("amount", "REAL");
  

  databaseHelper.printTableVarKeys();
  debugPrint("[main.dart-> setUpDatabase()] Set up complete.");

  debugPrint("[main.dart-> setUpDatabase()] End");
}

/*
void main() async{
  await setUpDatabase();
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(child: Homepage()), 
        ),
      ),
    ),
  );
}
*/

Future<void> main() async {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;

  await setUpDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LoginPage(),
        routes: {
          '/registerpage': (context) => RegisterPage(),
          '/loginpage': (context) => LoginPage(),
          
        });
  }
}
