import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
//import 'package:nutrition_app/food_item_nutrient_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx


/*
FoodItemNutrient

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###

nonDB_var##
Non Database Var With Space ###
*/

class ViewFoodItemNutrientPage extends StatefulWidget {
  ViewFoodItemNutrientPage({required this.nextPage, required this.thisFoodItemNutrient, required this.thisUser, super.key});
  final Widget nextPage;
  FoodItemNutrient thisFoodItemNutrient;
  User thisUser;

  @override
  State<ViewFoodItemNutrientPage> createState() => _ViewFoodItemNutrientPageState();
}

class _ViewFoodItemNutrientPageState extends State<ViewFoodItemNutrientPage> {

  late FoodItemNutrient newFoodItemNutrient;

  DatabaseHelper databaseHelper = DatabaseHelper();

  
  Widget currentPage()
  { 
    return Center(
          child: Column(children: [
            const SizedBox(height: 60),
            const Text(
              'FoodItemNutrient',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisFoodItemNutrient.foodItemID.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisFoodItemNutrient.nutrientInfoID.toString()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisFoodItemNutrient.amount.toString()),
            ),
            
          ]),
        );}


  @override
  initState() {
    debugPrint("[ViewFoodItemNutrientPage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "View Singular Food Item Nutrient Page", body: [currentPage()], thisUser: widget.thisUser,);
    
  }
}
