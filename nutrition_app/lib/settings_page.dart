import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/edit_user_page.dart';

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
      body: [
        Column(children: [
          Row(
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
        ]),
        TextButton(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserPage()),);}, 
          child: Text("Edit User Information")
        ),
      ]
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