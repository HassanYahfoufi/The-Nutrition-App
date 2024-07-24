//import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/create_status_update_page_v2.dart';
import 'package:nutrition_app/create_blank_page_v2.dart';
import 'package:nutrition_app/create_consumed_food_page.dart';
import 'package:nutrition_app/create_food_item_page.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/login_page.dart';
import 'package:nutrition_app/view_all_status_updates_page.dart';
import 'package:nutrition_app/view_all_consumed_foods_page.dart';
import 'package:nutrition_app/view_all_food_items_page.dart';
import 'package:nutrition_app/view_food_items.dart';
import 'package:nutrition_app/create_food_item_nutrient_page.dart';
import 'package:nutrition_app/view_all_food_item_nutrients_page.dart';
import 'package:nutrition_app/create_nutrient_info_page.dart';
import 'package:nutrition_app/view_all_nutrient_infos_page.dart';
//import 'package:nutrition_app/create_new_food_items.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:fl_chart/fl_chart.dart';







class HomePage extends StatefulWidget {
  HomePage({required this.thisUser, super.key});
  User thisUser;

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  double buttonHeight = 50;
  double buttonWidth = 200;
  double spacerHeight = 15;
  DateTime start = DateTime.now(); 
  DateTime end = DateTime.now();
  late double minX;
  late double maxX;
  double minY = 0;
  double maxY = 10;
  
  DatabaseHelper databaseHelper = DatabaseHelper();

  String SelectedGraph = 'Calories';

  List<FlSpot> chartData = [];

  Future<void> onPressedGraph(String graph) async
  {
    debugPrint("[HomePage-> onPressedGraph()] Start");
    SelectedGraph = graph;
    if(graph == 'Weight')
    {
      await totalConsumed_weight();
    }
    else if(graph == 'BMI')
    {

    }
    else
    {
      await totalConsumed(graph);
    }
    
    setState(() {
      SelectedGraph = graph;
      debugPrint("[HomePage-> onPressedGraph()] SelectedGraph: $SelectedGraph");
      
    });
    
    debugPrint("[HomePage-> onPressedGraph()] End");
  }


  
  int timestampToX_hours(DateTime timestamp)
  {
    //x = hours
      //each unit of the x axis represents an hour
    int year = timestamp.year * 8760;
    int month = timestamp.month * 720;
    int day = timestamp.day * 24;
    int hour = timestamp.hour * 1;

    int dateInt = day + month + year + hour;

    return dateInt;
  }


  int timestampToX_days(DateTime timestamp)
  {
    debugPrint("[HomePage-> timestampToX_days()] Start");
    //x = days
      //each unit of the x axis represents a day
    int year = timestamp.year * 365;
    int month = (timestamp.month - 1) * 30;
    int day = timestamp.day;

    int dateInt = day + month + year;

    debugPrint("[HomePage-> timestampToX_days()] End");
    return dateInt;
  }
  
  /*
  void printAllMonths()
  {
    debugPrint("[HomePage-> printAllMonths()] Start");
    //year 365
    //get year
    //complex calculation for month

    DateTime beginDate = DateTime.parse("0000-01-01 12:02:02.123456");
    DateTime currDate = beginDate;
    int dateInt;
    int year, month, day;
    for (var i = 0; i < 120; i++) {
      dateInt = timestampToX_days(currDate);
      debugPrint("[HomePage-> printAllMonths()] timestamp: ${currDate.toString()}\tx: ${dateInt}");

      //int currDateYear = currDate.year;
      
      currDate = DateTime(currDate.year, currDate.month + 1, 1);
      //debugPrint("[HomePage-> printAllMonths()]\t timestamp: ${currDate.toString()}\tx: ${dateInt} (after adding 1 month)");
      
    }
    debugPrint("[HomePage-> printAllMonths()] End");
  }
  */

  Future<void> totalConsumed(String nutrientName) async
  {
    debugPrint("[HomePage-> totalConsumed()] Start");
    minX = timestampToX_days(start) * 1.0;
    maxX = timestampToX_days(end) * 1.0;
    maxY = 10;
    minY = 0;
    debugPrint("[HomePage-> totalConsumed()] minX: $minX\tmaxX: $maxX");
    //get all items where time stamp is >= start && timestaamp <= end
    List<ConsumedFood> matchingConsumedFoods = [];

    if(widget.thisUser.id == null)
    {
      await widget.thisUser.readID();
    }

    debugPrint("[HomePage-> totalConsumed()] retrieving consumed foods...");
    List<Map<String, dynamic>> matchingConsumedFoods_map = await databaseHelper.getMatchingRows(tableName: "ConsumedFoodTable", column: databaseHelper.colUserID, value: widget.thisUser.id!.toString());
    debugPrint("[HomePage-> totalConsumed()] processing...");
    matchingConsumedFoods = matchingConsumedFoods_map.map((consumedFood) => ConsumedFood.fromMap(consumedFood)).toList();

    for (ConsumedFood consumedFood in matchingConsumedFoods) {
      debugPrint("\t[HomePage-> totalConsumed()] timestamp: ${consumedFood.timestamp}\tstart: ${start}\tend: ${end}");
      if(consumedFood.timestamp.isAfter(start) && consumedFood.timestamp.isBefore(end))
      {
        debugPrint("[HomePage-> totalConsumed()]found a consumed food in range!!!!");
      }
      
    }

    debugPrint("[HomePage-> totalConsumed()] there are ${matchingConsumedFoods.length} matching consumed foods xxxxxxxxxx!!!!");
    debugPrint("[HomePage-> totalConsumed()] removing consumed foods that are out of intended time range");
    /*for (ConsumedFood consumedFood in matchingConsumedFoods) {
      if(consumedFood.timestamp.isBefore(start) || consumedFood.timestamp.isAfter(end))
      {
        debugPrint("[HomePage-> totalConsumed()] \tremoving out of time range consumed food");
        matchingConsumedFoods.remove(consumedFood);
      }
      
    }*/
    matchingConsumedFoods.removeWhere(((consumedFood) => consumedFood.timestamp.isBefore(start) || consumedFood.timestamp.isAfter(end)));
    debugPrint("[HomePage-> totalConsumed()] processing the retrieved consumed foods COMPLETE");
    debugPrint("[HomePage-> totalConsumed()] there are ${matchingConsumedFoods.length} matching consumed foods in range xxxxxxxxxxxxxxxxxxxx!!!!");
    
    Map<int, double> dataPoints = Map<int, double>();
    int newX;
    double newY;
    FoodItemNutrient newNutrient;
    double nutrientAmount;
    for(ConsumedFood consumedFood in matchingConsumedFoods)
    {
      debugPrint("[HomePage-> totalConsumed()]\treading consumed food...");
      await consumedFood.readFoodItemFromDatabase();
      debugPrint("[HomePage-> totalConsumed()]\treading nutrients of ${consumedFood.foodItem!.name}...");
      await consumedFood.foodItem!.readNutrients();

      debugPrint("[HomePage-> totalConsumed()]\tconverting timestamp to int...");
      newX = timestampToX_days(consumedFood.timestamp);
      

      debugPrint("[HomePage-> totalConsumed()]\t retrieving nutrient...");
      newNutrient = await consumedFood.foodItem!.getNutrient(nutrientName);
      debugPrint("[HomePage-> totalConsumed()]\t retrieving nutrient COMPLETE");


      nutrientAmount = newNutrient.amount * consumedFood.amount;

      if(nutrientAmount >= 0)
      {
        if(dataPoints.containsKey(newX))
        {
          debugPrint("[HomePage-> totalConsumed()]\tExcecuting: newY = dataPoints[newX]! + nutrientAmount;");
          newY = dataPoints[newX]! + nutrientAmount;
        }
        else
        {
          newY = nutrientAmount;
        }

        if(maxY < newY)
        {
          maxY = newY;
        }

        if(newY < minY)
        {
          minY = newY;
        }
        
        dataPoints[newX] = newY;
        debugPrint("[HomePage-> totalConsumed()] newX: $newX\tnewY: $newY");
      }

      debugPrint("[HomePage-> totalConsumed()] food item:${consumedFood.foodItem!.name}\tnutrient map: ${newNutrient.toMap().toString()}");
    }

    debugPrint("[HomePage-> totalConsumed()] maxY: $maxY (before slight bump)");
    int divisor = 1;
    while(divisor < maxY)
    {
      divisor *= 10;
    }
    divisor = (divisor/10).toInt();
    int multiple = (maxY / divisor).ceil();
    maxY = divisor * multiple * 1.0;
    debugPrint("[HomePage-> totalConsumed()] maxY: $maxY");


    /*int count = 0;
    for (int x in dataPoints.keys) {
      if(count == 0)
      {
        minX = x * 1.0;
        maxX = x * 1.0;
      }



      if(x < minX)
      {
        minX = x * 1.0;
      }

      if(maxX < x)
      {
        maxX = x * 1.0;
      }

      count++;
      
    }*/
    

    debugPrint("[HomePage-> totalConsumed()] updating chart data...");
    chartData.clear;
    chartData = dataPoints.entries.map((dataPoint) => FlSpot(dataPoint.key.toDouble(), dataPoint.value)).toList();
    debugPrint("[HomePage-> totalConsumed()] updating chart data COMPLETE");

    debugPrint("[HomePage-> totalConsumed()] sorting chart data...");
    chartData.sort((a, b) => a.x.compareTo(b.x));

    debugPrint("[HomePage-> totalConsumed()] printing chart data...");
    for (FlSpot dataPoint in chartData) {
      debugPrint("[HomePage-> totalConsumed()] x: ${dataPoint.x}\ty: ${dataPoint.y}");
    }


    debugPrint("[HomePage-> totalConsumed()] End");
  }
  
  Future<void> totalConsumed_weight() async
  {
    debugPrint("[HomePage-> totalConsumed_weight()] Start ===================================================================================");
    minX = timestampToX_days(start) * 1.0;
    maxX = timestampToX_days(end) * 1.0;
    maxY = 10;
    minY = 0;
    debugPrint("[HomePage-> totalConsumed_weight()] minX: $minX\tmaxX: $maxX");
    //get all items where time stamp is >= start && timestaamp <= end
    List<StatusUpdate> matchingStatusUpdates = [];

    if(widget.thisUser.id == null)
    {
      await widget.thisUser.readID();
    }

    debugPrint("[HomePage-> totalConsumed_weight()] retrieving status updates...");
    List<Map<String, dynamic>> matchingStatusUpdates_map = await databaseHelper.getMatchingRows(tableName: "StatusUpdateTable", column: databaseHelper.colUserID, value: widget.thisUser.id!.toString());
    debugPrint("[HomePage-> totalConsumed_weight()] processing...");
    matchingStatusUpdates = matchingStatusUpdates_map.map((statusUpdate) => StatusUpdate.fromMap(statusUpdate)).toList();

    for (StatusUpdate statusUpdate in matchingStatusUpdates) {
      debugPrint("\t[HomePage-> totalConsumed_weight()] timestamp: ${statusUpdate.timestamp}\tstart: ${start}\tend: ${end}");
      if(statusUpdate.timestamp.isAfter(start) && statusUpdate.timestamp.isBefore(end))
      {
        debugPrint("[HomePage-> totalConsumed_weight()]found a status update in range!!!!");
      }
      
    }

    debugPrint("[HomePage-> totalConsumed_weight()] there are ${matchingStatusUpdates.length} matching status updates xxxxxxxxxx!!!!");
    debugPrint("[HomePage-> totalConsumed_weight()] removing status updates that are out of intended time range");
    
    matchingStatusUpdates.removeWhere(((statusUpdate) => statusUpdate.timestamp.isBefore(start) || statusUpdate.timestamp.isAfter(end)));
    debugPrint("[HomePage-> totalConsumed_weight()] processing the retrieved status updates COMPLETE");
    debugPrint("[HomePage-> totalConsumed_weight()] there are ${matchingStatusUpdates.length} matching status updates in range xxxxxxxxxxxxxxxxxxxx!!!!");
    
    Map<int, Map<String, dynamic>> dataPoints = Map<int, Map<String, dynamic>>();
    int newX;
    //FoodItemNutrient newNutrient;
    //double nutrientAmount;
    double weight;
    for(StatusUpdate statusUpdate in matchingStatusUpdates)
    {
      
      if(statusUpdate.weight != null)
      {
        debugPrint("[HomePage-> totalConsumed_weight()]\tconverting timestamp to int...");
        newX = timestampToX_days(statusUpdate.timestamp);

        if(statusUpdate.weight == null)
        {
          debugPrint("[HomePage-> totalConsumed_weight()] statusUpdate weight is null XXXXX");
        }

        debugPrint("[HomePage-> totalConsumed_weight()] statusUpdate weight: ${statusUpdate.weight.toString()}");
        weight = statusUpdate.weight!;
        
        if(weight >= 0)
        {
          debugPrint("[HomePage-> totalConsumed_weight()] statusUpdate weight os positive");
          if(dataPoints.containsKey(newX) == false)//XXXXXXXXXXXXXXXXX
          {
            dataPoints[newX] = Map<String, dynamic>();
            dataPoints[newX]!['sum'] = 0;
            dataPoints[newX]!['count'] = 0;
            dataPoints[newX]!['avg'] = 0;


            /*dataPoints[newX]!['sum'] = weight;
            dataPoints[newX]!['count'] = 1;
            dataPoints[newX]!['avg'] = weight;*/
          }
          

          dataPoints[newX]!['sum'] += weight;
          dataPoints[newX]!['count']++;
          dataPoints[newX]!['avg'] = dataPoints[newX]!['sum'] / dataPoints[newX]!['count'];
          
          
          //dataPoints[newX] = newY;//XXXXXXXXXXXXXXX
          debugPrint("[HomePage-> totalConsumed_weight()] newX: $newX\tnewY: ${dataPoints[newX]!['avg']}");
        }

        debugPrint("[HomePage-> totalConsumed_weight()] Status update as map:${statusUpdate.toMap().toString()}");
      }
    }

    



    debugPrint("[HomePage-> totalConsumed_weight()] updating chart data...");
    chartData.clear;
    chartData = dataPoints.entries.map((dataPoint) => FlSpot(dataPoint.key.toDouble(), dataPoint.value["avg"])).toList(); //XXXXXXXXXXXXX
    debugPrint("[HomePage-> totalConsumed_weight()] updating chart data COMPLETE");

    debugPrint("[HomePage-> totalConsumed_weight()] sorting chart data...");
    chartData.sort((a, b) => a.x.compareTo(b.x));

    debugPrint("[HomePage-> totalConsumed_weight()] printing chart data...");
    for (FlSpot dataPoint in chartData) 
    {
      debugPrint("[HomePage-> totalConsumed_weight()] x: ${dataPoint.x}\ty: ${dataPoint.y}");
      if(maxY < dataPoint.y)
      {
        maxY = dataPoint.y;
      }

      if(dataPoint.y < minY)
      {
        minY = dataPoint.y;
      }
    }

    debugPrint("[HomePage-> totalConsumed_weight()] maxY: $maxY (before slight bump)");
    int divisor = 1;
    while(divisor < maxY)
    {
      divisor *= 10;
    }
    divisor = (divisor/10).toInt();
    int multiple = (maxY / divisor).ceil();
    maxY = divisor * multiple * 1.0;
    debugPrint("[HomePage-> totalConsumed_weight()] maxY: $maxY");

    debugPrint("[HomePage-> totalConsumed_weight()] End");
  }
  
  Future<void> SetUp() async
  {
    debugPrint("[HomePage-> SetUp()] Start");

    //start = DateTime(2024, 1, 1);
    //end = DateTime(2024, 5, 1);
    start = DateTime.parse("2024-01-01 12:02:02.123456");
    end = DateTime.parse("2024-05-01 12:02:02.123456");
    minX = timestampToX_days(start) * 1.0;
    maxX = timestampToX_days(end) * 1.0;
    debugPrint("\t[HomePage-> SetUp()] start: ${start}\tend: ${end}xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx!");  
    await totalConsumed(SelectedGraph);


    debugPrint("[HomePage-> SetUp()] End");
  }
  
  @override
  initState() {
    debugPrint("[Homepage] Start");
    SetUp().then((value){
      debugPrint("[Homepage-> initState()] SetUp COMPLETE");
        setState(() 
        {
        }
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(home: () { debugPrint("[HomePage-> build] Going to Log-In Page"); Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);}, pageName: "Home Page", thisUser: widget.thisUser, body: [Center(
      child: Column(children: [
        
        SizedBox(height: 25),
       

        Center(child:
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
    
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                
                children:[
                  SizedOutlinedButton(text: "Calories", height: buttonHeight, width: buttonWidth, onPressed:() => onPressedGraph('Calories'),),
                  SizedOutlinedButton(text: "BMI", height: buttonHeight, width: buttonWidth, onPressed:() => onPressedGraph('BMI'),),
                  SizedOutlinedButton(text: "Weight", height: buttonHeight, width: buttonWidth, onPressed:() => onPressedGraph('Weight'),),
                ]),
              SizedBox(child: DisplayGraph(), height: 300, width: 700),
              SizedBox(child: Row(children: [SizedBox(width: 25,), SizedOutlinedButton(text: "Start", onPressed: () {}, height: 25, width: 100,), SizedBox(width: 475,), SizedOutlinedButton(text: "End", onPressed: () {}, height: 25, width: 100,),]), height: 300, width: 700),
          ]),
        ),
        
        SizedBox(height: (spacerHeight * 2)),
        //SizedOutlinedButton(text: "View Food Items", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewFoodItems(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),

        SizedBox(height: spacerHeight),
        //SizedOutlinedButton(text: "Add New Food Item", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateFoodItem(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        

        SizedOutlinedButton(text: "Update Status", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateStatusUpdatePage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add ConsumedFood", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateConsumedFoodPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Food Item", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateFoodItemPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Blank", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlankPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Nutrient Info", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNutrientInfoPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Food Item Nutrient", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateFoodItemNutrientPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Status Updates", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllStatusUpdatesPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Food Items", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllFoodItemsPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Consumed Foods", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllConsumedFoodsPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View All Nutrient Infos", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllNutrientInfosPage(thisUser: widget.thisUser)));}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Food Item Nutrientss", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllFoodItemNutrientsPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
      ],),
    )]);
  }

  Widget DisplayGraph() {
    switch (SelectedGraph) {
      case 'BMI':
        chartData.clear;
        chartData = [
              FlSpot(1, 15.0), //temporary data
              FlSpot(2, 12.0),
              FlSpot(3, 11.0),
              FlSpot(4, 14.0),
              FlSpot(5, 16.0),
            ];
        minX = 1.0;
        maxX = 10.0;
        maxY = 20;
        return BMILineGraph(spots: chartData, minX: minX, maxX: maxX, maxY: maxY,);
      case 'Weight':
        return WeightLineGraph(spots: chartData, minX: minX, maxX: maxX, maxY: maxY);
      case 'Calories':
      default:
        return CalorieLineGraph(spots: chartData, minX: minX, maxX: maxX, maxY: maxY, minY: 0,);
    }
  }
}
