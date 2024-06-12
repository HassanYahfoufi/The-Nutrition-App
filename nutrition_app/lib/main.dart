import 'package:flutter/material.dart';
import 'package:nutrition_app/home_page.dart';
import 'package:nutrition_app/settings_page.dart';



Future<void> setUpDatabase() async
{
  debugPrint("[main.dart-> setUpDatabase()] Start");
  debugPrint("[main.dart-> setUpDatabase()] setting up database...");
  debugPrint("[main.dart-> setUpDatabase()] UNDER CONSTRUCTION (this hasn't been developed yet)");
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


void main() {
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
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/settingspage' : (context) => const SettingsPage(),
      }
    );
  }
}

