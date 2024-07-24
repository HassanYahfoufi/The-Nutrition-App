import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:dropdown_search/dropdown_search.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/consumed_food_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!


/*
ConsumedFood

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###
*/

class CreateConsumedFoodPage extends StatefulWidget {
  CreateConsumedFoodPage({required this.nextPage, required this.thisUser, super.key});
  final Widget nextPage;
  User thisUser;

  @override
  State<CreateConsumedFoodPage> createState() => _CreateConsumedFoodPageState();
}

class _CreateConsumedFoodPageState extends State<CreateConsumedFoodPage> {
  Map<String,Map<String, dynamic>> variablesInfo = Map<String,Map<String, dynamic>>();
  Map<String,Map<String, dynamic>> foodItemsInfo = Map<String,Map<String, dynamic>>();

  late ConsumedFood newConsumedFood;

  late final List<FoodItem> foodItems;
  late FoodItem selectedFoodItem;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> setUp() async
  {
    debugPrint("[CreateConsumedFoodPagev2-> setUp()] Start");
    debugPrint("[CreateConsumedFood-> setUp()] getting all Food Items... ");
    List<Map<String, dynamic>> foodItemTable = await databaseHelper.getEntireTable_asMap(tableName: "FoodItemTable");
    debugPrint("[CreateConsumedFood-> setUp()] retrieved ${foodItemTable.length} Food Items... ");
    String name;
    debugPrint("[CreateConsumedFood-> setUp()] printing all Food Items... ---------------------------------------------------------------------------------");
    for(Map<String, dynamic> foodItem_map in foodItemTable)
    {
      debugPrint("[CreateConsumedFood-> setUp()]\t map ${foodItem_map.toString()}");
      name = foodItem_map["name"];
      debugPrint("[CreateConsumedFood-> setUp()]\t foodItem_map[\"name\"] = ${foodItem_map["name"]}");
      debugPrint("[CreateConsumedFood-> setUp()]\t $name");
    }
    foodItems = foodItemTable.map((foodItem_map)=> FoodItem.fromMap(foodItem_map)).toList();

    for(FoodItem foodItem in foodItems)
    {
      foodItemsInfo[foodItem.name] = <String, dynamic>{};
      foodItemsInfo[foodItem.name]!["TextEditingController"] = TextEditingController();
    }

    /*if(foodItems.isNotEmpty)
    {
      selectedFoodItem = foodItems[0];
    }
    else
    {
      selectedFoodItem = FoodItem(Name: 'Empty', ServingSize: -1, ID: -1);
    }*/
    debugPrint("[CreateConsumedFoodPagev2-> setUp()] End");
  }
 
  Future<void> submit() async
  {
    debugPrint("[CreateConsumedFoodPagev2-> submit()] Start");

    String underscoreName;
    Map<String, dynamic> consumedFoodMap = Map<String, dynamic>();
    debugPrint("[CreateConsumedFoodPagev2-> submit()] creating map...");
    consumedFoodMap[databaseHelper.colUserID] = widget.thisUser.id;
    for (var entry in variablesInfo.entries) 
    {
      debugPrint("[CreateConsumedFoodPagev2-> submit()]\tprocessing ${entry.key} info...");
      debugPrint("[CreateConsumedFoodPagev2-> submit()]\t\texcecuting: underscoreName = entry.value[\"name_with_underscore\"];...");
      underscoreName = entry.value["name_with_underscore"];
      
      debugPrint("[CreateConsumedFoodPagev2-> submit()]\t\t checking data type of ${entry.key}");
      debugPrint("[CreateConsumedFoodPagev2-> submit()]\t\t${entry.key}'s data type: ${entry.value["DataType"]}");
      if(entry.value["DataType"] == String)
      {
        debugPrint("[CreateConsumedFoodPagev2-> submit()]\t\t${entry.key} is a String");
        consumedFoodMap[underscoreName] = entry.value["TextEditingController"].text;
      }
      else
      {
        debugPrint("[CreateConsumedFoodPagev2-> submit()]\t\t${entry.key} is not a String");
        if(entry.value["DataType"] == int)
        {
          consumedFoodMap[underscoreName] = int.parse(entry.value["TextEditingController"].text);
        }
        else if(entry.value["DataType"] == double)
        {
          consumedFoodMap[underscoreName] = double.parse(entry.value["TextEditingController"].text);
        }
        else
        {
          consumedFoodMap[underscoreName] = entry.value["TextEditingController"].text;
        }
        
      }
    }

    //!!!!!!!!!!!!!!!!!
    //add food item id to map
    //!!!!!!!!!!!!!!!

    consumedFoodMap["user_id"] = widget.thisUser.id;
    consumedFoodMap["food_item_id"] = selectedFoodItem.id;
    consumedFoodMap["amount"] = double.parse(foodItemsInfo[selectedFoodItem.name]!["TextEditingController"].text);

    debugPrint("[CreateNutrientInfoPage-> submit()] The new consumed food as a map: ${consumedFoodMap.toString()}... !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    
    
    debugPrint("[CreateConsumedFoodPagev2-> submit()] creating the new status update...");
    newConsumedFood = ConsumedFood.fromMap(consumedFoodMap);
    

    debugPrint("[CreateConsumedFoodPagev2-> submit()] Validating...");
    if (await newConsumedFood.countMatching() >= 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Creation failure!"),
                  content:
                      Text("The ConsumedFood already exists"),
                ));
        debugPrint(
            "[CreateConsumedFoodPagev2-> submit()]sign up fail! ConsumedFood already exists!!!!!!!!!!!!!!!!!!!!");
      });
    } else //if you are here then the combination of alues for the required parameters hasn't been used yet
    {
      debugPrint("[CreateConsumedFoodPagev2-> submit()] the combo of values for the required parameters hasn't been used yet");
      

      int insertResult = await newConsumedFood.create();

      if (insertResult != 0) {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
        });
      } else {
        setState(() {
          debugPrint("[CreateConsumedFoodPagev2-> submit()] Sign up failed!");
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Sign in failed!"),
                    content: Text("Insert operation failed!"),
                  ));
          debugPrint("[CreateConsumedFoodPagev2-> submit()] Sign up failed!");
        });
      }
    }
  }
  
  Widget currentPage({required variablesInfo})
  { 
    String oldvalue = 'default unit of measurement';//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
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
            const Text(
              'Food Items',
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
              
              child: DropdownSearch<FoodItem>(
                items: foodItems,
                dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Food Item",
                        hintText: "Please select the food item from the dropdown menu",
                    ),
                ),
                
                onChanged: (value) {
                  setState(() {
                    selectedFoodItem = value!;
                  });
                },
                selectedItem: selectedFoodItem,
                dropdownBuilder: (context, selectedItem) => Text(selectedItem!.name),
                itemAsString: (foodItem) => foodItem.name,
                
      

                ),
              
              
              /*DropDownMultiSelect(
                onChanged: (List<FoodItem> collection){
                  setState(() {
                    selectedFoodItems = collection;
                    
                });
                },
                options: foodItems,
                selectedValues: selectedFoodItems,
                childBuilder: (selectedValues) {
                    String selectedItemsText = "";
                    bool notFirst = false;
                    for (FoodItem selectedValue in selectedValues) {
                      if(notFirst)
                      {
                        selectedItemsText = selectedItemsText + ", " + selectedValue.name;
                      }
                      else
                      {
                        selectedItemsText = selectedItemsText + " " + selectedValue.name;
                        notFirst = true;
                      }
                    } 
                    return Text(selectedItemsText);},
                  menuItembuilder: (option) {
                    return Text(option.name);
                  },
              ),*/
                        
            ),



            Text(
              'Selected Choices:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(selectedFoodItem.name),
                  SizedBox(width: 5),
                  
                  Expanded(
                    child: TextField(
                      controller: foodItemsInfo[selectedFoodItem.name]!["TextEditingController"],
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
                        items: <String>['default unit of measurement'].map<DropdownMenuItem<String>>((String value) {
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
            ),
            /*...selectedFoodItems.map((selectedFoodItem){
                if(foodItemsInfo[selectedFoodItem.name] == null)
                {
                  foodItemsInfo[selectedFoodItem.name] = <String, dynamic>{};
                  foodItemsInfo[selectedFoodItem.name]!["TextEditingController"] = TextEditingController();
                }
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(selectedFoodItem.name),
                      SizedBox(width: 5),
                      
                      Expanded(
                        child: TextField(
                          controller: foodItemsInfo[selectedFoodItem.name]!["TextEditingController"],
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
                            items: <String>['default unit of measurement', 'default unit of measurement2'].map<DropdownMenuItem<String>>((String value) {
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
            }).toList(),*/

            Divider (height: 1, color: Colors.black),
            const SizedBox(height: 20),







            ...variablesInfo.entries.map((variableInfo) => Column(children: [
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: variableInfo.value["TextEditingController"]/*variablesInfo["userID"]!["TextEditingController"]*/,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: variableInfo.value["NameWithSpace"]/*"User ID"*/),
                      readOnly: variableInfo.key == "dateCreated" || variableInfo.key == "dateModified" || variableInfo.key == "timestamp",
                      onTap: () async {
                        if (variableInfo.key == "dateCreated" || variableInfo.key == "dateModified") {
                          await DateSeletctor(variableInfo.value["TextEditingController"]); // does the date selectorss
                        } else if (variableInfo.key == "timestamp") { // does timestamp
                          final TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            initialEntryMode: TimePickerEntryMode.dial,
                          );
                          if (time != null) {
                              variableInfo.value["TextEditingController"].text = time.format(context); 
                            setState(() {
                            });
                          }
                        }
                      },
                      
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
    debugPrint("[CreateConsumedFoodPage] Start");
    /*variablesInfo["userID"] = <String, dynamic>{};
    variablesInfo["userID"]!["TextEditingController"] = TextEditingController();
    variablesInfo["userID"]!["DataType"] = int;
    variablesInfo["userID"]!["name_with_underscore"] = "user_id";
    variablesInfo["userID"]!["NameWithSpace"] = "User ID";*/
    /*variablesInfo["foodItemID"] = <String, dynamic>{};
    variablesInfo["foodItemID"]!["TextEditingController"] = TextEditingController();
    variablesInfo["foodItemID"]!["DataType"] = int;
    variablesInfo["foodItemID"]!["name_with_underscore"] = "food_item_id";
    variablesInfo["foodItemID"]!["NameWithSpace"] = "Food Item ID";*/
    variablesInfo["amount"] = <String, dynamic>{};
    variablesInfo["amount"]!["TextEditingController"] = TextEditingController();
    variablesInfo["amount"]!["DataType"] = double;
    variablesInfo["amount"]!["name_with_underscore"] = "amount";
    variablesInfo["amount"]!["NameWithSpace"] = "Amount";
    variablesInfo["timestamp"] = <String, dynamic>{};
    variablesInfo["timestamp"]!["TextEditingController"] = TextEditingController();
    variablesInfo["timestamp"]!["DataType"] = DateTime;
    variablesInfo["timestamp"]!["name_with_underscore"] = "timestamp";
    variablesInfo["timestamp"]!["NameWithSpace"] = "Timestamp";
    variablesInfo["dateCreated"] = <String, dynamic>{};
    variablesInfo["dateCreated"]!["TextEditingController"] = TextEditingController();
    variablesInfo["dateCreated"]!["DataType"] = DateTime;
    variablesInfo["dateCreated"]!["name_with_underscore"] = "date_created";
    variablesInfo["dateCreated"]!["NameWithSpace"] = "Date Created";
    variablesInfo["dateModified"] = <String, dynamic>{};
    variablesInfo["dateModified"]!["TextEditingController"] = TextEditingController();
    variablesInfo["dateModified"]!["DataType"] = DateTime;
    variablesInfo["dateModified"]!["name_with_underscore"] = "date_modified";
    variablesInfo["dateModified"]!["NameWithSpace"] = "Date Modified";
    variablesInfo["note"] = <String, dynamic>{};
    variablesInfo["note"]!["TextEditingController"] = TextEditingController();
    variablesInfo["note"]!["DataType"] = String;
    variablesInfo["note"]!["name_with_underscore"] = "note";
    variablesInfo["note"]!["NameWithSpace"] = "Note";

    setUp().then((value){
      debugPrint("[CreateConsumedFoodPage-> initState()] food item update COMPLETE");
        setState(() 
        {
        }
        );
    });
      
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "CreateConsumedFoodPage", body: [currentPage(variablesInfo: variablesInfo)], thisUser: widget.thisUser,);
  }
Future<void> DateSeletctor(TextEditingController dobController) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1940),
    lastDate: DateTime(2025),



  );

  if (picked != null){
    setState(() {

      dobController.text = picked.toString().split(" ")[0];

    });
  }

}
}

        