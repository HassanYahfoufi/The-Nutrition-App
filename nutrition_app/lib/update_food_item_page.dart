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
Required Variable With Space ###

optional_var##
Optional_Var##
Optional Variable With Space ###
*/

class UpdateFoodItemPage extends StatefulWidget {
  UpdateFoodItemPage({required this.nextPage, required this.thisFoodItem, required this.thisUser, super.key});
  final Widget nextPage;
  FoodItem thisFoodItem;
  User thisUser;

  @override
  State<UpdateFoodItemPage> createState() => _UpdateFoodItemPageState();
}

class _UpdateFoodItemPageState extends State<UpdateFoodItemPage> {
  Map<String,Map<String, dynamic>> variablesInfo = Map<String,Map<String, dynamic>>();

  //late FoodItem newFoodItem;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("\[UpdateFoodItemPage-> submit()] Start");

    String underscoreName;
    Map<String, dynamic> foodItemMap = Map<String, dynamic>();
    debugPrint("[CreateFoodItemPagev2-> submit()] creating map...");
    for (var entry in variablesInfo.entries) 
    {
      debugPrint("[CreateFoodItemPagev2-> submit()]\tprocessing ${entry.key} info...");
      debugPrint("[CreateFoodItemPagev2-> submit()]\t\texcecuting: underscoreName = entry.value[\"name_with_underscore\"];...");
      underscoreName = entry.value["name_with_underscore"];
      
      debugPrint("[CreateFoodItemPagev2-> submit()]\t\t checking data type of ${entry.key}");
      debugPrint("[CreateFoodItemPagev2-> submit()]\t\t${entry.key}'s data type: ${entry.value["DataType"]}");
      if(entry.value["DataType"] == String)
      {
        debugPrint("[CreateFoodItemPagev2-> submit()]\t\t${entry.key} is a String");
        foodItemMap[underscoreName] = entry.value["TextEditingController"].text;
      }
      else
      {
        debugPrint("[CreateFoodItemPagev2-> submit()]\t\t${entry.key} is not a String");
        if(entry.value["DataType"] == int)
        {
          foodItemMap[underscoreName] = int.parse(entry.value["TextEditingController"].text);
        }
        else if(entry.value["DataType"] == double)
        {
          foodItemMap[underscoreName] = double.parse(entry.value["TextEditingController"].text);
        }
        else
        {
          foodItemMap[underscoreName] = entry.value["TextEditingController"].text;
        }
        
      }
    }
    
    debugPrint("[CreateFoodItemPagev2-> submit()] creating the updated foodItem...");
    widget.thisFoodItem.fromMap(foodItemMap);
    

    debugPrint("\[UpdateFoodItemPage-> submit()] Updating...");
    int updateResult = await widget.thisFoodItem.update();

    if (updateResult != 0) {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
      });
    } else {
      setState(() {
        debugPrint("\[UpdateFoodItemPage-> submit()] Update failed!");
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Update failed!"),
                  content: Text("Update operation failed!"),
                ));
        debugPrint("\[UpdateFoodItemPage-> submit()] Update failed!");
      });
    }


    
  }
  
  Widget currentPage({required variablesInfo})
  { 
    return Center(
          child: Column(children: [
            const SizedBox(height: 60),
            const Text(
              'Food Item',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 30),

            ...variablesInfo.entries.map((variableInfo) => Column(children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: variableInfo.value["TextEditingController"]/*variablesInfo["name"]!["TextEditingController"]*/,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: variableInfo.value["NameWithSpace"]/*"Name"*/),
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
    debugPrint("[UpdateFoodItemPage] Start");

    debugPrint("[CreateFoodItemPage] Start");
    variablesInfo["name"] = <String, dynamic>{};
    variablesInfo["name"]!["TextEditingController"] = TextEditingController();
    variablesInfo["name"]!["DataType"] = String;
    variablesInfo["name"]!["name_with_underscore"] = "name";
    variablesInfo["name"]!["NameWithSpace"] = "Name";
    variablesInfo["servingSize"] = <String, dynamic>{};
    variablesInfo["servingSize"]!["TextEditingController"] = TextEditingController();
    variablesInfo["servingSize"]!["DataType"] = int;
    variablesInfo["servingSize"]!["name_with_underscore"] = "serving_size";
    variablesInfo["servingSize"]!["NameWithSpace"] = "Serving Size";
    variablesInfo["note"] = <String, dynamic>{};
    variablesInfo["note"]!["TextEditingController"] = TextEditingController();
    variablesInfo["note"]!["DataType"] = String;
    variablesInfo["note"]!["name_with_underscore"] = "note";
    variablesInfo["note"]!["NameWithSpace"] = "Note";
  }

  @override
  Widget build(BuildContext context) {
    
    return PageWidget(pageName: "Update Food Item Page", body: [currentPage(variablesInfo: variablesInfo)], thisUser: widget.thisUser,);
    
  }
}
