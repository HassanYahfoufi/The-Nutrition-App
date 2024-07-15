import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:multiselect/multiselect.dart';


//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/blank_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!


/*
Blank

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###
*/

class CreateFoodItem extends StatefulWidget {
  CreateFoodItem({required this.nextPage,required this.thisUser, super.key});
  final Widget nextPage;
  User thisUser;

  @override
  State<CreateFoodItem> createState() => _CreateFoodItemState();
}

class _CreateFoodItemState extends State<CreateFoodItem> {
  late FoodItem foodItem;
  TextEditingController FoodNameController = TextEditingController();
  TextEditingController ServingSizeAmountController = TextEditingController();
  TextEditingController NutrientAmountController = TextEditingController();
  
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  // TextEditingController required_var01Controller = TextEditingController();
  // TextEditingController required_var02Controller = TextEditingController();
  List<String> choices = [];

  // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  // TextEditingController required_conversion_var01Controller = TextEditingController();
  // TextEditingController required_conversion_var02Controller = TextEditingController();
  // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  // TextEditingController optional_var01Controller = TextEditingController();
  // TextEditingController optional_var02Controller = TextEditingController();
  // TextEditingController optional_var03Controller = TextEditingController();
  // TextEditingController optional_var04Controller = TextEditingController();
  // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  // TextEditingController optional_conversion_var01Controller = TextEditingController();
  // TextEditingController optional_conversion_var02Controller = TextEditingController();
  // TextEditingController optional_conversion_var03Controller = TextEditingController();
  // TextEditingController optional_conversion_var04Controller = TextEditingController();
  // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!


  DatabaseHelper databaseHelper = DatabaseHelper();

    Map<String,Map<String, dynamic>> variablesInfo = Map<String,Map<String, dynamic>>();
  Future<void> submit() async
  {
  Map<String, dynamic> FoodItemMap = Map<String, dynamic>();



    FoodItemMap[databaseHelper.colUserID] = widget.thisUser.id;
    String underscoreName;

    debugPrint("[CreateNewFoodItemsPage Page-> submit()] Start");
    for (var entry in variablesInfo.entries) 
    {
      debugPrint("[CreateNewFoodItemsPage-> submit()]\tprocessing ${entry.key} info...");
      debugPrint("[CreateNewFoodItemsPage-> submit()]\t\texcecuting: underscoreName = entry.value[\"name_with_underscore\"];...");
      underscoreName = entry.value["name_with_underscore"];
      
      debugPrint("[CreateNewFoodItemsPage-> submit()]\t\t checking data type of ${entry.key}");
      debugPrint("[CreateNewFoodItemsPage-> submit()]\t\t${entry.key}'s data type: ${entry.value["DataType"]}");
      if(entry.value["DataType"] == String)
      {
        debugPrint("[CreateNewFoodItemsPage-> submit()]\t\t${entry.key} is a String");
        FoodItemMap[underscoreName] = entry.value["TextEditingController"].text;
      }
      else
      {
        debugPrint("[CreateNewFoodItemsPage-> submit()]\t\t${entry.key} is not a String");
        if(entry.value["DataType"] == int)
        {
          FoodItemMap[underscoreName] = int.parse(entry.value["TextEditingController"].text);
        }
        else if(entry.value["DataType"] == double)
        {
          FoodItemMap[underscoreName] = double.parse(entry.value["TextEditingController"].text);
        }
        else
        {
          FoodItemMap[underscoreName] = entry.value["TextEditingController"].text;
        }
        
      }
    }
    

    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    // late requiredVar01_DataType tempRequired_Var01 = requiredVar01_DataType.parse(required_var01Controller.text);
    // late requiredVar02_DataType tempRequired_Var02 = requiredVar02_DataType.parse(required_var02Controller.text);
    // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    // late required_conversionVar01_DataType tempRequired_Conversion_Var01 = required_conversionVar01_DataType.parse(required_conversion_var01Controller.text);
    // late required_conversionVar02_DataType tempRequired_Conversion_Var02 = required_conversionVar02_DataType.parse(required_conversion_var02Controller.text);
    // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    // optionalVar01_DataType? tempOptional_Var01 = optionalVar01_DataType.parse(optional_var01Controller.text);
    // optionalVar02_DataType? tempOptional_Var02 = optionalVar02_DataType.parse(optional_var02Controller.text);
    // optionalVar03_DataType? tempOptional_Var03 = optionalVar03_DataType.parse(optional_var03Controller.text);
    // optionalVar04_DataType? tempOptional_Var04 = optionalVar04_DataType.parse(optional_var04Controller.text);
    // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    // optional_conversionVar01_DataType? tempOptional_Conversion_Var01 = optional_conversionVar01_DataType.parse(optional_conversion_var01Controller.text);
    // optional_conversionVar02_DataType? tempOptional_Conversion_Var02 = optional_conversionVar02_DataType.parse(optional_conversion_var02Controller.text);
    // optional_conversionVar03_DataType? tempOptional_Conversion_Var03 = optional_conversionVar03_DataType.parse(optional_conversion_var03Controller.text);
    // optional_conversionVar04_DataType? tempOptional_Conversion_Var04 = optional_conversionVar04_DataType.parse(optional_conversion_var04Controller.text);
    // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    // //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    
    



    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

    //newBlank = Blank(/*!!!!!*/Required_Var01: FoodNameController, Required_Var02: tempRequired_Var02/*!!!!!*//*!!!!!*/, Required_Conversion_Var01: tempRequired_Conversion_Var01, Required_Conversion_Var02: tempRequired_Conversion_Var02/*!!!!!*//*!!!!!*/, Optional_Var01: tempOptional_Var01, Optional_Var02: tempOptional_Var02, Optional_Var03: tempOptional_Var03, Optional_Var04: tempOptional_Var04/*!!!!!*//*!!!!!*/, Optional_Conversion_Var01: tempOptional_Conversion_Var01, Optional_Conversion_Var02: tempOptional_Conversion_Var02, Optional_Conversion_Var03: tempOptional_Conversion_Var03, Optional_Conversion_Var04: tempOptional_Conversion_Var04/*!!!!!*/);

    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
       
        foodItem = FoodItem.fromMap(FoodItemMap);

    debugPrint("[CreateNewFoodItemsPage Page-> submit()] Validating...");
    if (await foodItem.countMatching() >= 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Creation failure!"),
                  content:
                      Text("The Blank already exists"),
                ));
        debugPrint(
            "[CreateNewFoodItemsPage Page-> submit()]sign up fail! Blank already exists!!!!!!!!!!!!!!!!!!!!");
      });
    } else //if you are here then the combonation of alues for the required parameters hasn't been used yet
    {
      debugPrint("[CreateNewFoodItemsPage Page-> submit()] the combo of values for the required parameters hasn't been used yet");
      

      int insertResult = await foodItem.create();

      if (insertResult != 0) {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
        });
      } else {
        setState(() {
          debugPrint("[CreateNewFoodItemsPage Page-> submit()] Sign up failed!");
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Sign in failed!"),
                    content: Text("Insert operation failed!"),
                  ));
          debugPrint("[CreateNewFoodItemsPage Page-> submit()] Sign up failed!");
        });
      }
    }
  }
  
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Widget currentPage({required variablesInfo})
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  { 
    String oldvalue = 'g';
    return SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 60),
            const Text(
              'Create new food',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
           ...variablesInfo.entries.map((variableInfo) => Column(children: [
            Padding(
              padding: EdgeInsets.all(15),
                  
                    child: Column(
                      children: <Widget>[
                        Container(height: 1, color: Colors.black),
                        TextField(
                          controller: variableInfo.value["TextEditingController"],
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: variableInfo.value["NameWithSpace"]),
                              ),
                              Container(height: 1, color: Colors.black),
                            ],
                ),
              
                
           ), ],
              ) 
              
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            

            //!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 20),
            Divider (height: 1, color: Colors.black),
             const SizedBox(height: 20),
            const Text(
              'Nutrients',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: 550,
              height: 250,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)
              ),
             //CardWidget(title: "search", body: [required_var01Controller, required_var02Controller, required_conversion_var01Controller, required_conversion_var02Controller,],),
              
              child: DropDownMultiSelect(
                onChanged: (List<String> y){
                  setState(() {
                    choices = y;
                });
                },
                options: ['Calories', 'Saturated Fat', 'Trans Fat', 'Carbohydrates', 'Cholesterol', 'Sodium', 'Sugars', 'Protein', 'Vitamin A', 'Vitamin B12', 'Vitamin C', 'Vitamin D', 'Calcium', 'Iron', 'Potassium', 'Zinc'],
                selectedValues: choices,
             //   whenEmpty: "Select nutrient",
              ),
              
              // child: TextField(
              //   controller: required_conversion_var02Controller,
              //   decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.white),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey),
              //       ),
              //       fillColor: Colors.white,
              //       filled: true,
              //       hintText: "Search"),
              // ),
            
            ),
            Text(
              'Selected Choices:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            
            ...choices.map((choice){
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      
                        Text(choice),
                        SizedBox(width: 5),
                      
                      Expanded(
                        child: TextField(
                           decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Amount"),
                        ),
                      ),
                      SizedBox(width: 8),
              Column(
                children: <Widget>[
                  DropdownButton<String>(
                    value: oldvalue,
                    onChanged: (String? newValue){
                      setState(() {
                        oldvalue = newValue!;
                      });
                    },
                    items: <String>['g', 'mg']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
                    ],
                    
                  ),
                );
                

            }).toList(),

            
            const SizedBox(height: 20),
            Divider (height: 1, color: Colors.black),
            const SizedBox(height: 20),
            const Text(
              'Ingredients',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: 550,
              height: 250,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)
              ),
              
              
              child: TextField(
               // controller: required_conversion_var02Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search"),
              ),
            
            ),
            const SizedBox(height: 20),
            
            Divider (height: 1, color: Colors.black),
            const SizedBox(height: 20),
            const Text(
              'Allergen Information',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: 550,
              height: 250,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)
              ),
              
              
              child: TextField(
              //  controller: required_conversion_var01Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search"),
              ),
            
            ),
            const SizedBox(height: 20),



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
                    child: Text('Add new food',
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
    debugPrint("[CreateFoodItem] Start");
    variablesInfo["FoodName"] = <String, dynamic>{};
    variablesInfo["FoodName"]!["TextEditingController"] = TextEditingController();
    variablesInfo["FoodName"]!["DataType"] = String;
    variablesInfo["FoodName"]!["name_with_underscore"] = "food_name";
    variablesInfo["FoodName"]!["NameWithSpace"] = "FoodName";
    variablesInfo["amount"] = <String, dynamic>{};
    variablesInfo["amount"]!["TextEditingController"] = TextEditingController();
    variablesInfo["amount"]!["DataType"] = double;
    variablesInfo["amount"]!["name_with_underscore"] = "Serving_Size_Amount";
    variablesInfo["amount"]!["NameWithSpace"] = "Serving Size Amount";
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "Create New Food Item", body: [currentPage(variablesInfo: variablesInfo)], thisUser: widget.thisUser,);
  }
}
