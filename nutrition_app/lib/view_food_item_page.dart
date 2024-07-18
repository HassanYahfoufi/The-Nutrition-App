import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/view_nutrient_info_page.dart';

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

nonDB_var##
Non Database Var With Space ###
*/

class ViewFoodItemPage extends StatefulWidget {
  ViewFoodItemPage({required this.nextPage, required this.thisFoodItem, required this.thisUser, super.key});
  final Widget nextPage;
  FoodItem thisFoodItem;
  User thisUser;

  @override
  State<ViewFoodItemPage> createState() => _ViewFoodItemPageState();
}

class _ViewFoodItemPageState extends State<ViewFoodItemPage> {

  late FoodItem newFoodItem;

  DatabaseHelper databaseHelper = DatabaseHelper();
  

  Future<void> setUp() async
  {
    debugPrint("[ViewFoodItemPage->setUp] Start");
    debugPrint("[ViewFoodItemPage->setUp] reading nutrients...");
    await widget.thisFoodItem.readNutrients();
    
    if(widget.thisFoodItem.nutrients.length > 0)
    {
      debugPrint("[ViewFoodItemPage->setUp] reading nutrient info for each nutrient...");
      for(FoodItemNutrient nutrient in widget.thisFoodItem.nutrients)
      {
        debugPrint("[ViewFoodItemPage->setUp] reading nutrient ...");
        debugPrint("[ViewFoodItemPage->setUp] reading nutrient (id: ${nutrient.foodItemID})...");
        await nutrient.readNutrientInfoFromDatabase();
      }
    }
    else
    {
      debugPrint("[ViewFoodItemPage->setUp] There are no nutrients!");

      debugPrint("[ViewFoodItemPage->setUp] This food item's id: ${widget.thisFoodItem.id}...");
      debugPrint("[ViewFoodItemPage->setUp] printing nutrient table...");
      List<Map<String, dynamic>> nutirentTable = await databaseHelper.getEntireTable_asMap(tableName: "FoodItemNutrientTable");
      String name;
      for(Map<String, dynamic> nutrient_map in nutirentTable)
      {
        debugPrint("[ViewAllStatusUpdatesPage-> setUp()]\t ${nutrient_map.toString()}");
      }
    }

    debugPrint("[ViewFoodItemPage->setUp] End");
  }
  
  Widget currentPage()
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisFoodItem.name.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisFoodItem.servingSize.toString()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(widget.thisFoodItem.note.toString()),
            ),

            Divider(),

            CardWidget(title: "Nutrients", body: [
              ( widget.thisFoodItem.nutrients.length > 0) ? Column(children: [...widget.thisFoodItem.nutrients.map((nutrient) => ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(ViewNutrientInfoPage(thisNutrientInfo: nutrient.info!, nextPage: ViewFoodItemPage(thisUser: widget.thisUser, nextPage: widget.nextPage, thisFoodItem: widget.thisFoodItem), thisUser: widget.thisUser))),);}, child: Text(nutrient.info!.name)))]) : TextButton(onPressed: (){}, child: Text("Loading...")),
            ]),
          ]),
        );
  }


  @override
  initState() {
    debugPrint("[ViewFoodItemPage] Start");

    setUp().then((value){
      debugPrint("[ViewFoodItemPage-> initState()] nutrients update COMPLETE");
        setState(() 
        {
        }
        );
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(pageName: "View Singular Food Item Page", body: [currentPage()], thisUser: widget.thisUser,);
    
  }
}
