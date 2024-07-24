import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:nutrition_app/blank_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx


/*
Blank

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###

nonDB_var##
Non Database Var With Space ###
*/

class ViewSingleBlankPage extends StatefulWidget {
  ViewSingleBlankPage({required this.nextPage, required this.thisBlank, required this.thisUser, super.key});
  final Widget nextPage;
  Blank thisBlank;
  User thisUser;

  @override
  State<ViewSingleBlankPage> createState() => _ViewSingleBlankPageState();
}

class _ViewSingleBlankPageState extends State<ViewSingleBlankPage> {

  late Blank newBlank;

  DatabaseHelper databaseHelper = DatabaseHelper();

  
  Widget currentPage()
  { 
    return Center(
          child: Column(children: [
            const SizedBox(height: 60),
            const Text(
              'Blank',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.required_var01.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.required_var02.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.required_conversion_var01.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.required_conversion_var02.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.optional_var01.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.optional_var02.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.optional_var03.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.optional_var04.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.optional_conversion_var01.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.optional_conversion_var02.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.optional_conversion_var03.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.optional_conversion_var04.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.nonDB_var01.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisBlank.nonDB_var02.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
          ]),
        );}


  @override
  initState() {
    debugPrint("[ViewSingleBlankPage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "View Singular Blank With Space Page", body: [currentPage()], thisUser: widget.thisUser,);
    
  }
}
