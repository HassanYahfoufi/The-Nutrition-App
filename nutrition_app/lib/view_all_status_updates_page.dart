import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/view_status_update_page.dart';
import 'package:nutrition_app/create_status_update_page.dart';
import 'package:nutrition_app/home_page.dart';


//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:nutrition_app/status_update_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx

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

    debugPrint("[ViewAllStatusUpdatesPage-> setUp()] getting all status updates... ");
    List<Map<String, dynamic>> statusUpdateTable = await databaseHelper.getEntireTable_asMap(tableName: "StatusUpdateTable");
    String title;
    debugPrint("[ViewAllStatusUpdatesPage-> setUp()] printing all status updates... xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    for(Map<String, dynamic> statusUpdate_map in statusUpdateTable)
    {
      title = statusUpdate_map["title"];
      debugPrint("[ViewAllStatusUpdatesPage-> setUp()]\t $title");
    }
    List<StatusUpdate> tempStatusUpdates = statusUpdateTable.map((statusUpdate_map)=> StatusUpdate.fromMap(statusUpdate_map)).toList();

    widget.parentObject.readFromDatabase();
    statusUpdates = widget.parentObject.statusUpdates;

    //This is temporary code please refactor this to make the program more robust --------------------------
    if(tempStatusUpdates.length > statusUpdates.length)
    {
      debugPrint("[ViewAllStatusUpdatesPage-> setUp()] ERROR updating collecting status updates via user failedxxxxxxxxxxxxxxx!!!!");
      statusUpdates = tempStatusUpdates;
    }
    //------------------------------------------------------------------------------------------------------

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
    return ViewAllPageWidget(
      thisUser: widget.thisUser,
      createPage: CreateStatusUpdatePage(nextPage: ViewAllStatusUpdatesPage(parentObject: widget.parentObject, thisUser: widget.thisUser), thisUser: widget.thisUser),
      home: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(HomePage(thisUser: widget.thisUser,))),);},
      pageName: "StatusUpdates",
      body: [
        (statusUpdates.length > 0) ? Column(children: [...statusUpdates.map((statusUpdate) => Column(children:[const SizedBox(height: 10) , ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(ViewSingleStatusUpdatePage(thisStatusUpdate: statusUpdate, thisUser: widget.thisUser))),);}, child: Text(statusUpdate.title))]))]) : TextButton(onPressed: (){}, child: Text("Loading...")),
      ],
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),);
  }
}