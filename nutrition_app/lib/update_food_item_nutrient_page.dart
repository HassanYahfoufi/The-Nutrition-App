import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:nutrition_app/food_item_nutrient_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx


/*
FoodItemNutrient

required_var##
Required_Var##
Required Variable With Space ###

optional_var##
Optional_Var##
Optional Variable With Space ###
*/

class UpdateFoodItemNutrientPage extends StatefulWidget {
  UpdateFoodItemNutrientPage({required this.nextPage, required this.thisFoodItemNutrient, required this.thisUser, super.key});
  final Widget nextPage;
  FoodItemNutrient thisFoodItemNutrient;
  User thisUser;

  @override
  State<UpdateFoodItemNutrientPage> createState() => _UpdateFoodItemNutrientPageState();
}

class _UpdateFoodItemNutrientPageState extends State<UpdateFoodItemNutrientPage> {
  Map<String,Map<String, dynamic>> variablesInfo = Map<String,Map<String, dynamic>>();

  //late FoodItemNutrient newFoodItemNutrient;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("\[UpdateFoodItemNutrientPage-> submit()] Start");

    String underscoreName;
    Map<String, dynamic> foodItemNutrientMap = Map<String, dynamic>();
    debugPrint("[CreateFoodItemNutrientPagev2-> submit()] creating map...");
    for (var entry in variablesInfo.entries) 
    {
      debugPrint("[CreateFoodItemNutrientPagev2-> submit()]\tprocessing ${entry.key} info...");
      debugPrint("[CreateFoodItemNutrientPagev2-> submit()]\t\texcecuting: underscoreName = entry.value[\"name_with_underscore\"];...");
      underscoreName = entry.value["name_with_underscore"];
      
      debugPrint("[CreateFoodItemNutrientPagev2-> submit()]\t\t checking data type of ${entry.key}");
      debugPrint("[CreateFoodItemNutrientPagev2-> submit()]\t\t${entry.key}'s data type: ${entry.value["DataType"]}");
      if(entry.value["DataType"] == String)
      {
        debugPrint("[CreateFoodItemNutrientPagev2-> submit()]\t\t${entry.key} is a String");
        foodItemNutrientMap[underscoreName] = entry.value["TextEditingController"].text;
      }
      else
      {
        debugPrint("[CreateFoodItemNutrientPagev2-> submit()]\t\t${entry.key} is not a String");
        if(entry.value["DataType"] == int)
        {
          foodItemNutrientMap[underscoreName] = int.parse(entry.value["TextEditingController"].text);
        }
        else if(entry.value["DataType"] == double)
        {
          foodItemNutrientMap[underscoreName] = double.parse(entry.value["TextEditingController"].text);
        }
        else
        {
          foodItemNutrientMap[underscoreName] = entry.value["TextEditingController"].text;
        }
        
      }
    }
    
    debugPrint("[CreateFoodItemNutrientPagev2-> submit()] creating the updated foodItemNutrient...");
    widget.thisFoodItemNutrient.fromMap(foodItemNutrientMap);
    

    debugPrint("\[UpdateFoodItemNutrientPage-> submit()] Updating...");
    int updateResult = await widget.thisFoodItemNutrient.update();

    if (updateResult != 0) {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
      });
    } else {
      setState(() {
        debugPrint("\[UpdateFoodItemNutrientPage-> submit()] Update failed!");
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Update failed!"),
                  content: Text("Update operation failed!"),
                ));
        debugPrint("\[UpdateFoodItemNutrientPage-> submit()] Update failed!");
      });
    }


    
  }
  
  Widget currentPage({required variablesInfo})
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

            ...variablesInfo.entries.map((variableInfo) => Column(children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: variableInfo.value["TextEditingController"]/*variablesInfo["foodItemID"]!["TextEditingController"]*/,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: variableInfo.value["NameWithSpace"]/*"Food Item ID"*/),
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
    debugPrint("[UpdateFoodItemNutrientPage] Start");

    variablesInfo["foodItemID"] = <String, dynamic>{};
    variablesInfo["foodItemID"]!["TextEditingController"] = TextEditingController();
    variablesInfo["foodItemID"]!["DataType"] = int;
    variablesInfo["foodItemID"]!["name_with_underscore"] = "food_item_id";
    variablesInfo["foodItemID"]!["NameWithSpace"] = "Food Item ID";
    
    variablesInfo["nutrientInfoID"] = <String, dynamic>{};
    variablesInfo["nutrientInfoID"]!["TextEditingController"] = TextEditingController();
    variablesInfo["nutrientInfoID"]!["DataType"] = int;
    variablesInfo["nutrientInfoID"]!["name_with_underscore"] = "nutrient_info_id";
    variablesInfo["nutrientInfoID"]!["NameWithSpace"] = "Nutrient Info ID";
    
    variablesInfo["amount"] = <String, dynamic>{};
    variablesInfo["amount"]!["TextEditingController"] = TextEditingController();
    variablesInfo["amount"]!["DataType"] = double;
    variablesInfo["amount"]!["name_with_underscore"] = "amount";
    variablesInfo["amount"]!["NameWithSpace"] = "Amount";
  }

  @override
  Widget build(BuildContext context) {
    
    return PageWidget(pageName: "Update Food Item Nutrient Page", body: [currentPage(variablesInfo: variablesInfo)], thisUser: widget.thisUser,);
    
  }
}
