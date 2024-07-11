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
*/

class CreateFoodItemPage extends StatefulWidget {
  CreateFoodItemPage({required this.nextPage, required this.thisUser, super.key});
  final Widget nextPage;
  User thisUser;

  @override
  State<CreateFoodItemPage> createState() => _CreateFoodItemPageState();
}

class _CreateFoodItemPageState extends State<CreateFoodItemPage> {
  Map<String,Map<String, dynamic>> variablesInfo = Map<String,Map<String, dynamic>>();

  late FoodItem newFoodItem;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("[CreateFoodItemPage-> submit()] Start");

    String underscoreName;
    Map<String, dynamic> foodItemMap = Map<String, dynamic>();
    debugPrint("[CreateFoodItemPage-> submit()] creating map...");
    for (var entry in variablesInfo.entries) 
    {
      debugPrint("[CreateFoodItemPage-> submit()]\tprocessing ${entry.key} info...");
      debugPrint("[CreateFoodItemPage-> submit()]\t\texcecuting: underscoreName = entry.value[\"name_with_underscore\"];...");
      underscoreName = entry.value["name_with_underscore"];
      
      debugPrint("[CreateFoodItemPage-> submit()]\t\t checking data type of ${entry.key}");
      debugPrint("[CreateFoodItemPage-> submit()]\t\t${entry.key}'s data type: ${entry.value["DataType"]}");
      if(entry.value["DataType"] == String)
      {
        debugPrint("[CreateFoodItemPage-> submit()]\t\t${entry.key} is a String");
        foodItemMap[underscoreName] = entry.value["TextEditingController"].text;
      }
      else
      {
        debugPrint("[CreateFoodItemPage-> submit()]\t\t${entry.key} is not a String");
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
    
    debugPrint("[CreateFoodItemPage-> submit()] creating the new food item...");
    newFoodItem = FoodItem.fromMap(foodItemMap);
    

    debugPrint("[CreateFoodItemPage-> submit()] Validating...");
    if (await newFoodItem.countMatching() >= 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Creation failure!"),
                  content:
                      Text("The FoodItem already exists"),
                ));
        debugPrint(
            "[CreateFoodItemPage-> submit()]sign up fail! FoodItem already exists!!!!!!!!!!!!!!!!!!!!");
      });
    } else //if you are here then the combination of alues for the required parameters hasn't been used yet
    {
      debugPrint("[CreateFoodItemPage-> submit()] the combo of values for the required parameters hasn't been used yet");
      

      debugPrint("[CreateFoodItemPage-> submit()] creating...");
      int insertResult = await newFoodItem.create();
      debugPrint("[CreateFoodItemPage-> submit()] creation COMPLETE");

      if (insertResult != 0) {
        setState(() {
          debugPrint("[CreateFoodItemPage-> submit()] creation SUCCESS");
          Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
        });
      } else {
        setState(() {
          debugPrint("[CreateFoodItemPage-> submit()] Sign up failed!");
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Sign in failed!"),
                    content: Text("Insert operation failed!"),
                  ));
          debugPrint("[CreateFoodItemPage-> submit()] Sign up failed!");
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
              'FoodItem',
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
    return PageWidget(pageName: "CreateFoodItemPage", body: [currentPage(variablesInfo: variablesInfo)], thisUser: widget.thisUser,);
  }
}
