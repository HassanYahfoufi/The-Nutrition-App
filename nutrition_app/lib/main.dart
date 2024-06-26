import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nutrition_app/home_page.dart';
import 'package:nutrition_app/register_page.dart';
import 'package:nutrition_app/settings_page.dart';
import 'package:nutrition_app/login_page.dart';
import 'package:nutrition_app/add_food_item.dart';
import 'package:nutrition_app/view_food_items.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/models.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:fl_chart/fl_chart.dart';

Future<void> setUpDatabase() async {
  debugPrint("[main.dart-> setUpDatabase()] Start");

  debugPrint("[main.dart-> setUpDatabase()] setting up database...");
  DatabaseHelper databaseHelper = DatabaseHelper();
  debugPrint("[main.dart-> setUpDatabase()] setting up User table ...");
  databaseHelper.table["UserTable"] =
      TableInfo(name: "UserTable", type: "user_table_v1");
  databaseHelper.table["UserTable"]!.addColumn(
      "id", "INTEGER PRIMARY KEY AUTOINCREMENT"); //replace id with account_id
  databaseHelper.table["UserTable"]!.addColumn("username", "TEXT");
  databaseHelper.table["UserTable"]!.addColumn("password", "TEXT");
  databaseHelper.table["UserTable"]!.addColumn("name", "TEXT");
  databaseHelper.table["UserTable"]!.addColumn("dob", "DATETIME");
  databaseHelper.table["UserTable"]!.addColumn("sex", "INT");
  databaseHelper.table["UserTable"]!.addColumn("height", "DOUBLE");
  databaseHelper.table["UserTable"]!.addColumn("weight", "DOUBLE");

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

      home: const LoginPage(),

      routes: {
        '/settingspage' : (context) => const SettingsPage(),
        '/homepage' : (context) => HomePage(),
        '/registerpage' : (context) => const RegisterPage(),
        '/loginpage' : (context) => const LoginPage(),
        '/viewfooditems' : (context) => const ViewFoodItems(),
        '/addnewfooditems' : (context) => const AddNewFoodItem(),
      }
    );

  }
}
