import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
//import 'package:nutrition_app/statusUpdate_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!


/*
StatusUpdate

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###
*/

class CreateStatusUpdatePage_v2 extends StatefulWidget {
  CreateStatusUpdatePage_v2({required this.nextPage, required this.thisUser, super.key});
  final Widget nextPage;
  User thisUser;

  @override
  State<CreateStatusUpdatePage_v2> createState() => _CreateStatusUpdatePage_v2State();
}

class _CreateStatusUpdatePage_v2State extends State<CreateStatusUpdatePage_v2> {
  Map<String,Map<String, dynamic>> variablesInfo = Map<String,Map<String, dynamic>>();

  late StatusUpdate newStatusUpdate;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("[CreateStatusUpdatePage_v2v2-> submit()] Start");

    String underscoreName;
    Map<String, dynamic> statusUpdateMap = Map<String, dynamic>();
    debugPrint("[CreateStatusUpdatePage_v2v2-> submit()] creating map...");

    debugPrint("[CreateStatusUpdatePage_v2v2-> submit()] processing user id...");
    statusUpdateMap[databaseHelper.colUserID] = widget.thisUser.id;

    for (var entry in variablesInfo.entries) 
    {
      debugPrint("[CreateStatusUpdatePage_v2v2-> submit()]\tprocessing ${entry.key} info...");
      debugPrint("[CreateStatusUpdatePage_v2v2-> submit()]\t\texcecuting: underscoreName = entry.value[\"name_with_underscore\"];...");
      underscoreName = entry.value["name_with_underscore"];
      
      debugPrint("[CreateStatusUpdatePage_v2v2-> submit()]\t\t checking data type of ${entry.key}");
      debugPrint("[CreateStatusUpdatePage_v2v2-> submit()]\t\t${entry.key}'s data type: ${entry.value["DataType"]}");
      if(entry.value["DataType"] == String)
      {
        debugPrint("[CreateStatusUpdatePage_v2v2-> submit()]\t\t${entry.key} is a String");
        statusUpdateMap[underscoreName] = entry.value["TextEditingController"].text;
      }
      else
      {
        debugPrint("[CreateStatusUpdatePage_v2v2-> submit()]\t\t${entry.key} is not a String");
        if(entry.value["DataType"] == int)
        {
          statusUpdateMap[underscoreName] = int.parse(entry.value["TextEditingController"].text);
        }
        else if(entry.value["DataType"] == double)
        {
          statusUpdateMap[underscoreName] = double.parse(entry.value["TextEditingController"].text);
        }
        else
        {
          statusUpdateMap[underscoreName] = entry.value["TextEditingController"].text;
        }
        
      }
    }
    
    debugPrint("[CreateStatusUpdatePage_v2v2-> submit()] creating the new status update...");
    newStatusUpdate = StatusUpdate.fromMap(statusUpdateMap);
    

    debugPrint("[CreateStatusUpdatePage_v2v2-> submit()] Validating...");
    if (await newStatusUpdate.countMatching() >= 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Creation failure!"),
                  content:
                      Text("The StatusUpdate already exists"),
                ));
        debugPrint(
            "[CreateStatusUpdatePage_v2v2-> submit()]sign up fail! StatusUpdate already exists!!!!!!!!!!!!!!!!!!!!");
      });
    } else //if you are here then the combination of alues for the required parameters hasn't been used yet
    {
      debugPrint("[CreateStatusUpdatePage_v2v2-> submit()] the combo of values for the required parameters hasn't been used yet");
      

      int insertResult = await newStatusUpdate.create();

      if (insertResult != 0) {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
        });
      } else {
        setState(() {
          debugPrint("[CreateStatusUpdatePage_v2v2-> submit()] Sign up failed!");
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Sign in failed!"),
                    content: Text("Insert operation failed!"),
                  ));
          debugPrint("[CreateStatusUpdatePage_v2v2-> submit()] Sign up failed!");
        });
      }
    }
  }
  
  Widget currentPage({required variablesInfo})
  { 
    return Center(
          child: Column(children: [
            const SizedBox(height: 60),
            const Text(
              'StatusUpdate',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            ...variablesInfo.entries.map((variableInfo) => Column(children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: variableInfo.value["TextEditingController"]/*variablesInfo["userID"]!["TextEditingController"]*/,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: variableInfo.value["NameWithSpace"]/*"User ID"*/),
                ),
              ),
            ])),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                submit();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                    child: Text('Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ))),
              ),
            ),
          ]),
        );}


  @override
  initState() {
    debugPrint("[CreateStatusUpdatePage_v2] Start");

    debugPrint("[CreateStatusUpdatePag e_v2] Processing title info...");
    variablesInfo["title"] = <String, dynamic>{};
    variablesInfo["title"]!["TextEditingController"] = TextEditingController();
    variablesInfo["title"]!["DataType"] = String;
    variablesInfo["title"]!["name_with_underscore"] = "title";
    variablesInfo["title"]!["NameWithSpace"] = "Title";

    debugPrint("[CreateStatusUpdatePage_v2_v2] Processing timestamp info...");
    variablesInfo["timestamp"] = <String, dynamic>{};
    variablesInfo["timestamp"]!["TextEditingController"] = TextEditingController();
    variablesInfo["timestamp"]!["DataType"] = DateTime;
    variablesInfo["timestamp"]!["name_with_underscore"] = "timestamp";
    variablesInfo["timestamp"]!["NameWithSpace"] = "Timestamp";

    debugPrint("[CreateStatusUpdatePage_v2_v2] Processing dateCreated info...");
    variablesInfo["dateCreated"] = <String, dynamic>{};
    variablesInfo["dateCreated"]!["TextEditingController"] = TextEditingController();
    variablesInfo["dateCreated"]!["DataType"] = DateTime;
    variablesInfo["dateCreated"]!["name_with_underscore"] = "date_created";
    variablesInfo["dateCreated"]!["NameWithSpace"] = "Date Created";
    

    debugPrint("[CreateStatusUpdatePage_v2_v2] Processing dateModified info...");
    variablesInfo["dateModified"] = <String, dynamic>{};
    variablesInfo["dateModified"]!["TextEditingController"] = TextEditingController();
    variablesInfo["dateModified"]!["DataType"] = DateTime;
    variablesInfo["dateModified"]!["name_with_underscore"] = "date_modified";
    variablesInfo["dateModified"]!["NameWithSpace"] = "Date Modified";
    

    debugPrint("[CreateStatusUpdatePage_v2_v2] Processing note info...");
    variablesInfo["note"] = <String, dynamic>{};
    variablesInfo["note"]!["TextEditingController"] = TextEditingController();
    variablesInfo["note"]!["DataType"] = String;
    variablesInfo["note"]!["name_with_underscore"] = "note";
    variablesInfo["note"]!["NameWithSpace"] = "Note";
    

    debugPrint("[CreateStatusUpdatePage_v2_v2] Processing weight info...");
    variablesInfo["weight"] = <String, dynamic>{};
    variablesInfo["weight"]!["TextEditingController"] = TextEditingController();
    variablesInfo["weight"]!["DataType"] = double;
    variablesInfo["weight"]!["name_with_underscore"] = "weight";
    variablesInfo["weight"]!["NameWithSpace"] = "Weight";

  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "CreateStatusUpdatePage_v2v2", body: [currentPage(variablesInfo: variablesInfo)], thisUser: widget.thisUser,);
  }
}
