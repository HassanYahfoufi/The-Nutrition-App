import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/update_status_update_page.dart';


class ViewSingleStatusUpdatePage extends StatefulWidget {
  const ViewSingleStatusUpdatePage({required this.thisStatusUpdate, required this.thisUser, super.key});
  final StatusUpdate thisStatusUpdate;
  final User thisUser;

  @override
  State<ViewSingleStatusUpdatePage> createState() => _ViewSingleStatusUpdatePageState();
}

class _ViewSingleStatusUpdatePageState extends State<ViewSingleStatusUpdatePage> {

  DatabaseHelper databaseHelper = DatabaseHelper();

  
  Widget currentPage()
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
              child: Text(widget.thisStatusUpdate.userID.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisStatusUpdate.title),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisStatusUpdate.timestamp.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisStatusUpdate.dateCreated.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisStatusUpdate.dateModified.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisStatusUpdate.note!),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisStatusUpdate.weight.toString()),
            ),
          ]),
        );}


  @override
  initState() {
    debugPrint("[ViewSingleStatusUpdatePage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "View Singular Status Update Page", body: [currentPage()], thisUser: widget.thisUser, editPage: UpdateStatusUpdatePage(nextPage: ViewSingleStatusUpdatePage(thisStatusUpdate: widget.thisStatusUpdate, thisUser: widget.thisUser,), thisStatusUpdate: widget.thisStatusUpdate, thisUser: widget.thisUser,));
    
  }
}
