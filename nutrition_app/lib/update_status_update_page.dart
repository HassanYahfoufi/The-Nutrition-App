import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/status_update_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!




class UpdateStatusUpdatePage extends StatefulWidget {
  UpdateStatusUpdatePage({required this.nextPage, required this.thisStatusUpdate, required this.thisUser, super.key});
  final Widget nextPage;
  StatusUpdate thisStatusUpdate;
  User thisUser;

  @override
  State<UpdateStatusUpdatePage> createState() => _UpdateStatusUpdatePageState();
}

class _UpdateStatusUpdatePageState extends State<UpdateStatusUpdatePage> {
  TextEditingController userIDController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController timestampController = TextEditingController();
  TextEditingController dateCreatedController = TextEditingController();
  TextEditingController dateModifiedController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController weightController = TextEditingController();


  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("\[UpdateStatusUpdatePage-> submit()] Start");

    debugPrint("\[UpdateStatusUpdatePage-> submit()] processing ...");
    if(userIDController.text.isNotEmpty)
    {
      widget.thisStatusUpdate.userID = int.parse(userIDController.text);
    }
    debugPrint("\[UpdateStatusUpdatePage-> submit()] processing ...");
    if(titleController.text.isNotEmpty)
    {
      widget.thisStatusUpdate.title = titleController.text;
    }
    debugPrint("\[UpdateStatusUpdatePage-> submit()] processing ...");
    if(timestampController.text.isNotEmpty)
    {
      widget.thisStatusUpdate.timestamp = DateTime.parse(timestampController.text);
    }
    debugPrint("\[UpdateStatusUpdatePage-> submit()] processing ...");
    if(dateCreatedController.text.isNotEmpty)
    {
      widget.thisStatusUpdate.dateCreated = DateTime.parse(dateCreatedController.text);
    }
    debugPrint("\[UpdateStatusUpdatePage-> submit()] processing ...");
    if(dateModifiedController.text.isNotEmpty)
    {
      widget.thisStatusUpdate.dateModified = DateTime.parse(dateModifiedController.text);
    }
    debugPrint("\[UpdateStatusUpdatePage-> submit()] processing ...");
    if(noteController.text.isNotEmpty)
    {
      widget.thisStatusUpdate.note = noteController.text;
    }
    debugPrint("\[UpdateStatusUpdatePage-> submit()] processing ...");
    if(weightController.text.isNotEmpty)
    {
      widget.thisStatusUpdate.weight = double.parse(weightController.text);
    }
    



    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //newStatusUpdate = StatusUpdate(/*!!!!!*/UserID: tempUserID, Title: tempTitle/*!!!!!*//*!!!!!*/, Timestamp: tempTimestamp, DateCreated: tempDateCreated/*!!!!!*//*!!!!!*/, Note: tempNote, Weight: tempWeight, Optional_Var03: tempOptional_Var03, Optional_Var04: tempOptional_Var04/*!!!!!*//*!!!!!*/, Optional_Conversion_Var01: tempOptional_Conversion_Var01, Optional_Conversion_Var02: tempOptional_Conversion_Var02, Optional_Conversion_Var03: tempOptional_Conversion_Var03, Optional_Conversion_Var04: tempOptional_Conversion_Var04/*!!!!!*/);
    //widget.thisStatusUpdate
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

    debugPrint("\[UpdateStatusUpdatePage-> submit()] Updating...");
    int updateResult = await widget.thisStatusUpdate.update();

    if (updateResult != 0) {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
      });
    } else {
      setState(() {
        debugPrint("\[UpdateStatusUpdatePage-> submit()] Update failed!");
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Update failed!"),
                  content: Text("Update operation failed!"),
                ));
        debugPrint("\[UpdateStatusUpdatePage-> submit()] Update failed!");
      });
    }


    
  }
  
  
  Widget currentPage({required userIDController, required titleController, required timestampController, required dateCreatedController, required dateModifiedController, required noteController, required weightController})
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: userIDController,
                //onSubmitted: (text){},
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "User ID"),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Title"),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: timestampController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Timestamp"),
                    
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: dateCreatedController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Date Created"),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: dateModifiedController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Date Modified"),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: noteController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Note"),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: weightController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Weight"),
              ),
            ),
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
    debugPrint("[UpdateStatusUpdatePage] Start");
  }

  @override
  Widget build(BuildContext context) {
    
    return PageWidget(pageName: "Update Status Update Page", body: [currentPage(userIDController: userIDController, titleController: titleController, timestampController: timestampController, dateCreatedController: dateCreatedController, dateModifiedController: dateModifiedController, noteController: noteController, weightController: weightController)], thisUser: widget.thisUser,);
    
  }
}
