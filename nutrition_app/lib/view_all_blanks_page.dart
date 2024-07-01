import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/view_single_blank_page.dart';
import 'package:nutrition_app/home_page.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/blank_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

class ViewAllBlanksPage extends StatefulWidget {
  ViewAllBlanksPage({required this.parentObject, required this.thisUser, super.key});
  dynamic parentObject;
  User thisUser;
  


  @override
  _ViewAllBlanksPageState createState() => _ViewAllBlanksPageState();
}

class _ViewAllBlanksPageState extends State<ViewAllBlanksPage> {

  List<Blank> blanks = [];

  Future<void> setUp() async
  {
    widget.parentObject.readFromDatabase();
    blanks = widget.parentObject.blanks;
  }

  @override
  initState() {
    debugPrint("[ViewAllBlanksPage] Start");
    setUp().then((value){
      debugPrint("[ViewAllBlanksPage-> initState()] blank update COMPLETE");
        setState(() 
        {
        }
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      thisUser: widget.thisUser,
      home: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(HomePage(thisUser: widget.thisUser,))),);},
      pageName: "Blanks",
      body: [
        (blanks.length > 0) ? Column(children: [...blanks.map((blank) => ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(ViewSingleBlankPage(thisBlank: blank, nextPage: ViewAllBlanksPage(thisUser: widget.thisUser, parentObject: widget.parentObject), thisUser: widget.thisUser))),);}, child: Text(blank.required_var01.toString())))]) : TextButton(onPressed: (){}, child: Text("Loading...")),
      ],
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),);
  }
}