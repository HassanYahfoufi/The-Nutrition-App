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
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.userID.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.nutrientID.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.name.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.recomendedDietaryAllowance.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.unitOfMeasurement_recomendedDietaryAllowance.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.description.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.adequateIntake.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.unitOfMeasurement_adequateIntake.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.estimatedAverageRequirement.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.unitOfMeasurement_estimatedAverageRequirement.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.tolerableUpperIntakeLevel.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.unitOfMeasurement_tolerableUpperIntakeLevel.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.age.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.sex.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.weight.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.lifestyle.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisNutrientInfo.physiologicalStatus.toString()),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
            //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
          ]),
        );}


  @override
  initState() {
    debugPrint("[ViewNutrientInfoPage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "View Singular Nutrient Info Page", body: [currentPage()], thisUser: widget.thisUser,);
    
  }
}
