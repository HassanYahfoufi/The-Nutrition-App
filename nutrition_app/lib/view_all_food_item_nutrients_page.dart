import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/view_food_item_nutrient_page.dart';
import 'package:nutrition_app/home_page.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/food_item_nutrient_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

class ViewAllFoodItemNutrientsPage extends StatefulWidget {
  ViewAllFoodItemNutrientsPage({required this.parentObject, required this.thisUser, super.key});
  dynamic parentObject;
  User thisUser;
  


  @override
  _ViewAllFoodItemNutrientsPageState createState() => _ViewAllFoodItemNutrientsPageState();
}

class _ViewAllFoodItemNutrientsPageState extends State<ViewAllFoodItemNutrientsPage> {

  List<FoodItemNutrient> foodItemNutrients = [];

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> setUp() async
  {
    //widget.parentObject.readFromDatabase();
    //foodItemNutrients = widget.parentObject.foodItemNutrients;

    //!!!!!!!!!!!!!!!!!!!!!!!!!!
    debugPrint("[ViewAllFoodItemNutrientsPage-> setUp()] getting all Food Item Nutrients... ");
    List<Map<String, dynamic>> foodItemNutrientTable = await databaseHelper.getEntireTable_asMap(tableName: "FoodItemNutrientTable");
    debugPrint("[ViewAllFoodItemNutrientsPage-> setUp()] retrieved ${foodItemNutrientTable.length} Food Item Nutrients... ");
    var nutrientInfoID;
    debugPrint("[ViewAllFoodItemNutrientsPage-> setUp()] printing all Food Item Nutrients... ---------------------------------------------------------------------------------");
    for(Map<String, dynamic> foodItemNutrient_map in foodItemNutrientTable)
    {
      debugPrint("[ViewAllFoodItemNutrientsPage-> setUp()]\t map ${foodItemNutrient_map.toString()}");
      nutrientInfoID = foodItemNutrient_map["nutrient_info_id"].toString();
      debugPrint("[ViewAllFoodItemNutrientsPage-> setUp()]\t nutrient info id: $nutrientInfoID");
    }
    foodItemNutrients = foodItemNutrientTable.map((foodItemNutrient_map)=> FoodItemNutrient.fromMap(foodItemNutrient_map)).toList();
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  }

  @override
  initState() {
    debugPrint("[ViewAllFoodItemNutrientsPage] Start");
    setUp().then((value){
      debugPrint("[ViewAllFoodItemNutrientsPage-> initState()] foodItemNutrient update COMPLETE");
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
      pageName: "FoodItemNutrients",
      body: [
        (foodItemNutrients.length > 0) ? Column(children: [...foodItemNutrients.map((foodItemNutrient) => ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(ViewFoodItemNutrientPage(thisFoodItemNutrient: foodItemNutrient, nextPage: ViewAllFoodItemNutrientsPage(thisUser: widget.thisUser, parentObject: widget.parentObject), thisUser: widget.thisUser))),);}, child: Text(foodItemNutrient.nutrientInfoID.toString())))]) : TextButton(onPressed: (){}, child: Text("Loading...")),
      ],
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),);
  }
}