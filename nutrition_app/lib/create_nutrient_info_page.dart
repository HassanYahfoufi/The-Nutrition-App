import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/nutrient_info_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!


/*
NutrientInfo

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###
*/

class CreateNutrientInfoPage extends StatefulWidget {
  CreateNutrientInfoPage({required this.nextPage, required this.thisUser, super.key});
  final Widget nextPage;
  User thisUser;

  @override
  State<CreateNutrientInfoPage> createState() => _CreateNutrientInfoPageState();
}

class _CreateNutrientInfoPageState extends State<CreateNutrientInfoPage> {
  Map<String,Map<String, dynamic>> variablesInfo = Map<String,Map<String, dynamic>>();

  late NutrientInfo newNutrientInfo;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("[CreateNutrientInfoPage-> submit()] Start");

    String underscoreName;
    Map<String, dynamic> nutrientInfoMap = Map<String, dynamic>();
    debugPrint("[CreateNutrientInfoPage-> submit()] creating map...");
    for (var entry in variablesInfo.entries) 
    {
      debugPrint("[CreateNutrientInfoPage-> submit()]\tprocessing ${entry.key} info...");
      debugPrint("[CreateNutrientInfoPage-> submit()]\t\texcecuting: underscoreName = entry.value[\"name_with_underscore\"];...");
      underscoreName = entry.value["name_with_underscore"];
      
      debugPrint("[CreateNutrientInfoPage-> submit()]\t\t checking data type of ${entry.key}");
      debugPrint("[CreateNutrientInfoPage-> submit()]\t\t${entry.key}'s data type: ${entry.value["DataType"]}");
      if(entry.value["DataType"] == String)
      {
        debugPrint("[CreateNutrientInfoPage-> submit()]\t\t${entry.key} is a String");
        nutrientInfoMap[underscoreName] = entry.value["TextEditingController"].text;
      }
      else
      {
        debugPrint("[CreateNutrientInfoPage-> submit()]\t\t${entry.key} is not a String");
        if(entry.value["DataType"] == int)
        {
          nutrientInfoMap[underscoreName] = int.parse(entry.value["TextEditingController"].text);
        }
        else if(entry.value["DataType"] == double)
        {
          nutrientInfoMap[underscoreName] = double.parse(entry.value["TextEditingController"].text);
        }
        else
        {
          nutrientInfoMap[underscoreName] = entry.value["TextEditingController"].text;
        }
        
      }
    }
    
    nutrientInfoMap["user_id"] = widget.thisUser.id!;
    nutrientInfoMap["nutrient_id"] = -1;

    debugPrint("[CreateNutrientInfoPage-> submit()] The new Nutrient Info as a map: ${nutrientInfoMap.toString()}...");
    
    debugPrint("[CreateNutrientInfoPage-> submit()] creating the new Nutrient Info...");
    newNutrientInfo = NutrientInfo.fromMap(nutrientInfoMap);
    //newNutrientInfo.userID = widget.thisUser.id!;
    //newNutrientInfo.nutrientID = -1;
    

    debugPrint("[CreateNutrientInfoPage-> submit()] Validating...");
    if (await newNutrientInfo.countMatching() >= 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Creation failure!"),
                  content:
                      Text("The NutrientInfo already exists"),
                ));
        debugPrint(
            "[CreateNutrientInfoPage-> submit()]sign up fail! NutrientInfo already exists!!!!!!!!!!!!!!!!!!!!");
      });
    } else //if you are here then the combination of alues for the required parameters hasn't been used yet
    {
      debugPrint("[CreateNutrientInfoPage-> submit()] the combo of values for the required parameters hasn't been used yet");
      

      int insertResult = await newNutrientInfo.create();

      if (insertResult != 0) {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
        });
      } else {
        setState(() {
          debugPrint("[CreateNutrientInfoPage-> submit()] Sign up failed!");
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Sign in failed!"),
                    content: Text("Insert operation failed!"),
                  ));
          debugPrint("[CreateNutrientInfoPage-> submit()] Sign up failed!");
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
              'NutrientInfo',
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
    debugPrint("[CreateNutrientInfoPage] Start");
    /*variablesInfo["userID"] = <String, dynamic>{};
    variablesInfo["userID"]!["TextEditingController"] = TextEditingController();
    variablesInfo["userID"]!["DataType"] = int;
    variablesInfo["userID"]!["name_with_underscore"] = "user_id";
    variablesInfo["userID"]!["NameWithSpace"] = "User ID";

    variablesInfo["nutrientID"] = <String, dynamic>{};
    variablesInfo["nutrientID"]!["TextEditingController"] = TextEditingController();
    variablesInfo["nutrientID"]!["DataType"] = int;
    variablesInfo["nutrientID"]!["name_with_underscore"] = "nutrient_id";
    variablesInfo["nutrientID"]!["NameWithSpace"] = "Nutrient ID";
    */

    variablesInfo["name"] = <String, dynamic>{};
    variablesInfo["name"]!["TextEditingController"] = TextEditingController();
    variablesInfo["name"]!["DataType"] = String;
    variablesInfo["name"]!["name_with_underscore"] = "name";
    variablesInfo["name"]!["NameWithSpace"] = "Name";
    
    variablesInfo["recomendedDietaryAllowance"] = <String, dynamic>{};
    variablesInfo["recomendedDietaryAllowance"]!["TextEditingController"] = TextEditingController();
    variablesInfo["recomendedDietaryAllowance"]!["DataType"] = double;
    variablesInfo["recomendedDietaryAllowance"]!["name_with_underscore"] = "recomended_dietary_allowance";
    variablesInfo["recomendedDietaryAllowance"]!["NameWithSpace"] = "Recomended Dietary Allowance";
    
    variablesInfo["unitOfMeasurement_recomendedDietaryAllowance"] = <String, dynamic>{};
    variablesInfo["unitOfMeasurement_recomendedDietaryAllowance"]!["TextEditingController"] = TextEditingController();
    variablesInfo["unitOfMeasurement_recomendedDietaryAllowance"]!["DataType"] = int;
    variablesInfo["unitOfMeasurement_recomendedDietaryAllowance"]!["name_with_underscore"] = "unit_of_measurement_for_recomended_dietary_allowance";
    variablesInfo["unitOfMeasurement_recomendedDietaryAllowance"]!["NameWithSpace"] = "Unit Of Measurement (Recomended Dietary Allowance)";
    
    variablesInfo["description"] = <String, dynamic>{};
    variablesInfo["description"]!["TextEditingController"] = TextEditingController();
    variablesInfo["description"]!["DataType"] = String;
    variablesInfo["description"]!["name_with_underscore"] = "description";
    variablesInfo["description"]!["NameWithSpace"] = "Description";
    
    variablesInfo["adequateIntake"] = <String, dynamic>{};
    variablesInfo["adequateIntake"]!["TextEditingController"] = TextEditingController();
    variablesInfo["adequateIntake"]!["DataType"] = double;
    variablesInfo["adequateIntake"]!["name_with_underscore"] = "adequate_intake";
    variablesInfo["adequateIntake"]!["NameWithSpace"] = "Adequate Intake";
    
    variablesInfo["unitOfMeasurement_adequateIntake"] = <String, dynamic>{};
    variablesInfo["unitOfMeasurement_adequateIntake"]!["TextEditingController"] = TextEditingController();
    variablesInfo["unitOfMeasurement_adequateIntake"]!["DataType"] = int;
    variablesInfo["unitOfMeasurement_adequateIntake"]!["name_with_underscore"] = "unit_of_measurement_for_adequate_intake";
    variablesInfo["unitOfMeasurement_adequateIntake"]!["NameWithSpace"] = "Unit Of Measurement (Adequate Intake)";
    
    variablesInfo["estimatedAverageRequirement"] = <String, dynamic>{};
    variablesInfo["estimatedAverageRequirement"]!["TextEditingController"] = TextEditingController();
    variablesInfo["estimatedAverageRequirement"]!["DataType"] = double;
    variablesInfo["estimatedAverageRequirement"]!["name_with_underscore"] = "estimated_average_requirement";
    variablesInfo["estimatedAverageRequirement"]!["NameWithSpace"] = "Estimated Average Requirement";
    
    variablesInfo["unitOfMeasurement_estimatedAverageRequirement"] = <String, dynamic>{};
    variablesInfo["unitOfMeasurement_estimatedAverageRequirement"]!["TextEditingController"] = TextEditingController();
    variablesInfo["unitOfMeasurement_estimatedAverageRequirement"]!["DataType"] = int;
    variablesInfo["unitOfMeasurement_estimatedAverageRequirement"]!["name_with_underscore"] = "unit_of_measurement_for_estimated_average_requirement";
    variablesInfo["unitOfMeasurement_estimatedAverageRequirement"]!["NameWithSpace"] = "Unit Of Measurement (Estimated Average Requirement)";
    
    variablesInfo["tolerableUpperIntakeLevel"] = <String, dynamic>{};
    variablesInfo["tolerableUpperIntakeLevel"]!["TextEditingController"] = TextEditingController();
    variablesInfo["tolerableUpperIntakeLevel"]!["DataType"] = double;
    variablesInfo["tolerableUpperIntakeLevel"]!["name_with_underscore"] = "tolerable_upper_intake_level";
    variablesInfo["tolerableUpperIntakeLevel"]!["NameWithSpace"] = "Tolerable Upper Intake Level";
    
    variablesInfo["unitOfMeasurement_tolerableUpperIntakeLevel"] = <String, dynamic>{};
    variablesInfo["unitOfMeasurement_tolerableUpperIntakeLevel"]!["TextEditingController"] = TextEditingController();
    variablesInfo["unitOfMeasurement_tolerableUpperIntakeLevel"]!["DataType"] = int;
    variablesInfo["unitOfMeasurement_tolerableUpperIntakeLevel"]!["name_with_underscore"] = "unit_of_measurement_for_tolerable_upper_intake_level";
    variablesInfo["unitOfMeasurement_tolerableUpperIntakeLevel"]!["NameWithSpace"] = "Unit Of Measurement (Tolerable Upper Intake Level)";
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "CreateNutrientInfoPage", body: [currentPage(variablesInfo: variablesInfo)], thisUser: widget.thisUser,);
  }
}
