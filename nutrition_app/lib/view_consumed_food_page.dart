import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:nutrition_app/consumed_food_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx


/*
ConsumedFood

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###

nonDB_var##
Non Database Var With Space ###
*/

class ViewConsumedFoodPage extends StatefulWidget {
  ViewConsumedFoodPage({required this.nextPage, required this.thisConsumedFood, required this.thisUser, super.key});
  final Widget nextPage;
  ConsumedFood thisConsumedFood;
  User thisUser;

  @override
  State<ViewConsumedFoodPage> createState() => _ViewConsumedFoodPageState();
}

class _ViewConsumedFoodPageState extends State<ViewConsumedFoodPage> {

  late ConsumedFood newConsumedFood;

  DatabaseHelper databaseHelper = DatabaseHelper();

  
  Widget currentPage()
  { 
    return Center(
          child: Column(children: [
            const SizedBox(height: 60),
            const Text(
              'ConsumedFood',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisConsumedFood.userID.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisConsumedFood.foodItemID.toString()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisConsumedFood.amount.toString()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisConsumedFood.timestamp.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisConsumedFood.dateCreated.toString()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisConsumedFood.dateModified.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisConsumedFood.note.toString()),
            ),
          ]),
        );}


  @override
  initState() {
    debugPrint("[ViewConsumedFoodPage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "View Singular Consumed Food Page", body: [currentPage()], thisUser: widget.thisUser,);
    
  }
}
