import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/status_update_class_template.dart';
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

class CreateStatusUpdatePage extends StatefulWidget {
  CreateStatusUpdatePage({required this.nextPage, required this.thisUser, super.key});
  final Widget nextPage;
  User thisUser;

  @override
  State<CreateStatusUpdatePage> createState() => _CreateStatusUpdatePageState();
}

class _CreateStatusUpdatePageState extends State<CreateStatusUpdatePage> {
  
  TextEditingController userIDController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController timestampController = TextEditingController();
  TextEditingController dateCreatedController = TextEditingController();
  TextEditingController dateModifiedController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  
  late StatusUpdate newStatusUpdate;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("[Create Status Update Page-> submit()] Start");

    late int tempUserID = widget.thisUser.id!;
    late String tempTitle = titleController.text;
    late DateTime tempTimestamp = DateTime.parse(timestampController.text);
    late DateTime tempDateCreated = DateTime.parse(dateCreatedController.text);
    late DateTime tempDateModified = DateTime.parse(dateModifiedController.text);
    String? tempNote = noteController.text;
    double? tempWeight = double.parse(weightController.text);
    
    



    
    newStatusUpdate = StatusUpdate(UserID: tempUserID, Title: tempTitle, Timestamp: tempTimestamp, DateCreated: tempDateCreated, DateModified: tempDateModified, Note: tempNote, Weight: tempWeight);
    

    debugPrint("[Create Status Update Page-> submit()] Validating...");
    /*if (await newStatusUpdate.countMatching() >= 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Creation failure!"),
                  content:
                      Text("The StatusUpdate already exists"),
                ));
        debugPrint(
            "[Create Status Update Page-> submit()]sign up fail! StatusUpdate already exists!!!!!!!!!!!!!!!!!!!!");
      });
    } else //if you are here then the combination of alues for the required parameters hasn't been used yet
    {*/
      debugPrint("[Create Status Update Page-> submit()] the combo of values for the required parameters hasn't been used yet");
      

      int insertResult = await newStatusUpdate.create();

      if (insertResult != 0) {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
        });
      } else {
        setState(() {
          debugPrint("[Create Status Update Page-> submit()] Sign up failed!");
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Sign in failed!"),
                    content: Text("Insert operation failed!"),
                  ));
          debugPrint("[Create Status Update Page-> submit()] Sign up failed!");
        });
      }
    //}
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
                    hintText: "Optional Var With Space #01"),
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
                    hintText: "Optional Var With Space #02"),
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
    debugPrint("[CreateStatusUpdatePage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "Create Status Update Page", body: [currentPage(userIDController: userIDController, titleController: titleController, timestampController: timestampController, dateCreatedController: dateCreatedController, dateModifiedController: dateModifiedController, noteController: noteController, weightController: weightController)], thisUser: widget.thisUser,);
  }
}
