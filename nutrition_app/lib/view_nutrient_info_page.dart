import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/update_nutrient_info_page.dart';
import 'package:nutrition_app/view_all_nutrient_infos_page.dart';

//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:nutrition_app/nutrient_info_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx


/*
NutrientInfo

required_var##
Required_Var##
Required Var With Space ###

optional_var##
Optional_Var##
Optional Var With Space ###

nonDB_var##
Non Database Var With Space ###
*/

class ViewNutrientInfoPage extends StatefulWidget {
  ViewNutrientInfoPage({required this.nextPage, required this.thisNutrientInfo, required this.thisUser, super.key});
  final Widget nextPage;
  NutrientInfo thisNutrientInfo;
  User thisUser;

  @override
  State<ViewNutrientInfoPage> createState() => _ViewNutrientInfoPageState();
}

class _ViewNutrientInfoPageState extends State<ViewNutrientInfoPage> {

  late NutrientInfo newNutrientInfo;

  DatabaseHelper databaseHelper = DatabaseHelper();

  
  Widget currentPage()
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
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.userID.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.nutrientID.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.name.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.recomendedDietaryAllowance.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.unitOfMeasurement_recomendedDietaryAllowance.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.description.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.adequateIntake.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.unitOfMeasurement_adequateIntake.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.estimatedAverageRequirement.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.unitOfMeasurement_estimatedAverageRequirement.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.tolerableUpperIntakeLevel.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.unitOfMeasurement_tolerableUpperIntakeLevel.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.age.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.sex.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.weight.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.lifestyle.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.physiologicalStatus.toString()),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
          ]),
        );
  }


  @override
  initState() {
    debugPrint("[ViewNutrientInfoPage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      pageName: "View Singular Nutrient Info Page", 
      body: [currentPage()], 
      thisUser: widget.thisUser,
      editPage: UpdateNutrientInfoPage(nextPage: ViewNutrientInfoPage(thisNutrientInfo: widget.thisNutrientInfo, nextPage: ViewAllNutrientInfosPage(thisUser: widget.thisUser), thisUser: widget.thisUser), thisNutrientInfo: widget.thisNutrientInfo, thisUser: widget.thisUser),
    );
    
  }
}
