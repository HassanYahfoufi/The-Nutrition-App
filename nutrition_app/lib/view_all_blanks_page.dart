import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/view_blank_page.dart';
import 'package:nutrition_app/home_page.dart';

//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:nutrition_app/blank_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx

class ViewAllBlanksPage extends StatefulWidget {
  ViewAllBlanksPage({required this.parentObject, required this.thisUser, super.key});
  dynamic parentObject;
  User thisUser;
  


  @override
  _ViewAllBlanksPageState createState() => _ViewAllBlanksPageState();
}

class _ViewAllBlanksPageState extends State<ViewAllBlanksPage> {

  List<Blank> blanks = [];

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> setUp() async
  {
    //Comment these 2 lines section out if Blank With Spaces aren't loading
    widget.parentObject.readFromDatabase();
    blanks = widget.parentObject.blanks;

    /*  //Uncomment this section if Blank With Spaces aren't loading
    debugPrint("[ViewAllBlanksPage-> setUp()] getting all Blank With Spaces... ");
    List<Map<String, dynamic>> blankTable = await databaseHelper.getEntireTable_asMap(tableName: "BlankTable");
    debugPrint("[ViewAllBlanksPage-> setUp()] retrieved ${blankTable.length} Blank With Spaces... ");
    String required_var01;
    debugPrint("[ViewAllBlanksPage-> setUp()] printing all Blank With Spaces... ---------------------------------------------------------------------------------");
    for(Map<String, dynamic> blank_map in blankTable)
    {
      required_var01 = blank_map["required_var_underscore01"];
      debugPrint("[ViewAllBlanksPage-> setUp()]\t $required_var01");
    }
    blanks = blankTable.map((blank_map)=> Blank.fromMap(blank_map)).toList();

     */ //Uncomment this section if Blank With Spaces aren't loading
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
        (blanks.length > 0) ? Column(children: [...blanks.map((blank) => ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(ViewBlankPage(thisBlank: blank, nextPage: ViewAllBlanksPage(thisUser: widget.thisUser, parentObject: widget.parentObject), thisUser: widget.thisUser))),);}, child: Text(blank.required_var01.toString())))]) : TextButton(onPressed: (){}, child: Text("Loading...")),
      ],
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),);
  }
}