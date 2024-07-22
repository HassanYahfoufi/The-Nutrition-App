import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/food_item_nutrient_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!


/*
FoodItemNutrient

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###
*/

class CreateFoodItemNutrientPage extends StatefulWidget {
  CreateFoodItemNutrientPage({required this.nextPage, required this.thisUser, super.key});
  final Widget nextPage;
  User thisUser;

  @override
  State<CreateFoodItemNutrientPage> createState() => _CreateFoodItemNutrientPageState();
}

class _CreateFoodItemNutrientPageState extends State<CreateFoodItemNutrientPage> {
  Map<String,Map<String, dynamic>> variablesInfo = Map<String,Map<String, dynamic>>();

  late FoodItemNutrient newFoodItemNutrient;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("[CreateFoodItemNutrientPage-> submit()] Start");

    String underscoreName;
    Map<String, dynamic> foodItemNutrientMap = Map<String, dynamic>();
    debugPrint("[CreateFoodItemNutrientPage-> submit()] creating map...");
    for (var entry in variablesInfo.entries) 
    {
      debugPrint("[CreateFoodItemNutrientPage-> submit()]\tprocessing ${entry.key} info...");
      debugPrint("[CreateFoodItemNutrientPage-> submit()]\t\texcecuting: underscoreName = entry.value[\"name_with_underscore\"];...");
      underscoreName = entry.value["name_with_underscore"];
      
      debugPrint("[CreateFoodItemNutrientPage-> submit()]\t\t checking data type of ${entry.key}");
      debugPrint("[CreateFoodItemNutrientPage-> submit()]\t\t${entry.key}'s data type: ${entry.value["DataType"]}");
      if(entry.value["DataType"] == String)
      {
        debugPrint("[CreateFoodItemNutrientPage-> submit()]\t\t${entry.key} is a String");
        foodItemNutrientMap[underscoreName] = entry.value["TextEditingController"].text;
      }
      else
      {
        debugPrint("[CreateFoodItemNutrientPage-> submit()]\t\t${entry.key} is not a String");
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
    
    debugPrint("[CreateFoodItemNutrientPage-> submit()] The new Food Item Nutrient as a map: ${foodItemNutrientMap.toString()}...");
    
    debugPrint("[CreateFoodItemNutrientPage-> submit()] creating the new Food Item Nutrient...");
    newFoodItemNutrient = FoodItemNutrient.fromMap(foodItemNutrientMap);
    

    debugPrint("[CreateFoodItemNutrientPage-> submit()] Validating...");
    if (await newFoodItemNutrient.countMatching() >= 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Creation failure!"),
                  content:
                      Text("The FoodItemNutrient already exists"),
                ));
        debugPrint(
            "[CreateFoodItemNutrientPage-> submit()]sign up fail! FoodItemNutrient already exists!!!!!!!!!!!!!!!!!!!!");
      });
    } else //if you are here then the combination of alues for the required parameters hasn't been used yet
    {
      debugPrint("[CreateFoodItemNutrientPage-> submit()] the combo of values for the required parameters hasn't been used yet");
      

      int insertResult = await newFoodItemNutrient.create();

      if (insertResult != 0) {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
        });
      } else {
        setState(() {
          debugPrint("[CreateFoodItemNutrientPage-> submit()] Sign up failed!");
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Sign in failed!"),
                    content: Text("Insert operation failed!"),
                  ));
          debugPrint("[CreateFoodItemNutrientPage-> submit()] Sign up failed!");
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
        );
  }


  @override
  initState() {
    debugPrint("[CreateFoodItemNutrientPage] Start");
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
    return PageWidget(pageName: "CreateFoodItemNutrientPage", body: [currentPage(variablesInfo: variablesInfo)], thisUser: widget.thisUser,);
  }
}
