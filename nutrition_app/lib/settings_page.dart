import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      home: () {}, 
      pageName: "Settings", 
      body: [Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              const Padding(
                padding:  EdgeInsets.all(80.0),
                child: Text(" Prefered Measuring System"), 

              ),
            ],
          ),]
    );
    /*return Scaffold(
      appBar: 
      AppBar(title: Text('Settings'),
      backgroundColor: Colors.green,
      ),
    body: Row(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        const Padding(
          padding:  EdgeInsets.all(80.0),
          child: Text(" Prefered Measuring System"), 

        ),
      ],


    ),  
      
    );*/
    
  }
}