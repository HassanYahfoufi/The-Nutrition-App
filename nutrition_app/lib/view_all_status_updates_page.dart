import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/view_status_update_page.dart';
import 'package:nutrition_app/home_page.dart';


//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/status_update_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

class ViewAllStatusUpdatesPage extends StatefulWidget {
  ViewAllStatusUpdatesPage({required this.parentObject, required this.thisUser, super.key});
  dynamic parentObject;
  User thisUser;
  


  @override
  _ViewAllStatusUpdatesPageState createState() => _ViewAllStatusUpdatesPageState();
}

class _ViewAllStatusUpdatesPageState extends State<ViewAllStatusUpdatesPage> {

  List<StatusUpdate> statusUpdates = [];
  
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> setUp() async
  {
    debugPrint("[ViewAllStatusUpdatesPage-> setUp()] Start");

    debugPrint("[ViewAllStatusUpdatesPage-> setUp()] getting all status updates... !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    List<Map<String, dynamic>> statusUpdateTable = await databaseHelper.getEntireTable_asMap(tableName: "StatusUpdateTable");
    String title;
    for(Map<String, dynamic> statusUpdate_map in statusUpdateTable)
    {
      title = statusUpdate_map["title"];
      debugPrint("[ViewAllStatusUpdatesPage-> setUp()]\t $title");
    }

    widget.parentObject.readFromDatabase();
    statusUpdates = widget.parentObject.statusUpdates;

    debugPrint("[ViewAllStatusUpdatesPage-> setUp()] End");
  }

  @override
  initState() {
    debugPrint("[ViewAllStatusUpdatesPage] Start");
    setUp().then((value){
      debugPrint("[ViewAllStatusUpdatesPage-> initState()] statusUpdate update COMPLETE");
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
      pageName: "StatusUpdates",
      body: [
        (statusUpdates.length > 0) ? Column(children: [...statusUpdates.map((statusUpdate) => ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(ViewSingleStatusUpdatePage(thisStatusUpdate: statusUpdate, nextPage: ViewAllStatusUpdatesPage(thisUser: widget.thisUser, parentObject: widget.parentObject), thisUser: widget.thisUser))),);}, child: Text(statusUpdate.title)))]) : TextButton(onPressed: (){}, child: Text("Loading...")),
      ],
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),);
  }
}