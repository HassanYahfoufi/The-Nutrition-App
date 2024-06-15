import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';





class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int currentIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
       title: Text('Nutrition App',),
       backgroundColor:Colors.green,
       actions: <Widget>[
       IconButton(
       icon: Icon(Icons.settings),
       onPressed : (){
         Navigator.pushNamed(context, '/settingspage');
       },
       ),
  ],
      ),
    bottomNavigationBar: bottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
    ),
    body: Center(child: Text("Work in progress"))
    );


  }
}
