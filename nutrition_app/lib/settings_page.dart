import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/edit_user_page.dart';
import 'package:nutrition_app/classes.dart';


class SettingsPage extends StatefulWidget {
  SettingsPage({required this.thisUser, super.key});
  User thisUser;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      thisUser: widget.thisUser,
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
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserPage(thisUser: widget.thisUser)),);}, 
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