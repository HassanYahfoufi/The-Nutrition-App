import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/food_item_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!


/*
FoodItem

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###

nonDB_var##
Non Database Var With Space ###
*/

class ViewFoodItemPage extends StatefulWidget {
  ViewFoodItemPage({required this.nextPage, required this.thisFoodItem, required this.thisUser, super.key});
  final Widget nextPage;
  FoodItem thisFoodItem;
  User thisUser;

  @override
  State<ViewFoodItemPage> createState() => _ViewFoodItemPageState();
}

class _ViewFoodItemPageState extends State<ViewFoodItemPage> {

  late FoodItem newFoodItem;

  DatabaseHelper databaseHelper = DatabaseHelper();

  
  Widget currentPage()
  { 
    return Center(
          child: Column(children: [
            const SizedBox(height: 60),
            const Text(
              'FoodItem',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisFoodItem.name.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisFoodItem.servingSize.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisFoodItem.note.toString()),
            ),
          ]),
        );}


  @override
  initState() {
    debugPrint("[ViewFoodItemPage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "View Singular Food Item Page", body: [currentPage()], thisUser: widget.thisUser,);
    
  }
}
