import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/view_consumed_food_page.dart';
import 'package:nutrition_app/home_page.dart';


class ViewAllConsumedFoodsPage extends StatefulWidget {
  ViewAllConsumedFoodsPage({required this.parentObject, required this.thisUser, super.key});
  dynamic parentObject;
  User thisUser;
  


  @override
  _ViewAllConsumedFoodsPageState createState() => _ViewAllConsumedFoodsPageState();
}

class _ViewAllConsumedFoodsPageState extends State<ViewAllConsumedFoodsPage> {

  List<ConsumedFood> consumedFoods = [];

  
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> setUp() async
  {
    debugPrint("[ViewAllConsumedFoodsPage-> setUp()] Start");
    debugPrint("[ViewAllConsumedFoodsPage-> setUp()] getting all consumed foods... ");
    List<Map<String, dynamic>> consumedFoodTable = await databaseHelper.getEntireTable_asMap(tableName: "ConsumedFoodTable");
    String title;
    debugPrint("[ViewAllConsumedFoodsPage-> setUp()] printing all consumed foods... !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    
    for(Map<String, dynamic> consumedFood_map in consumedFoodTable)
    {
      debugPrint("[ViewAllConsumedFoodsPage-> setUp()]\t consumedFood_map: ${consumedFood_map.toString()}");
      if(consumedFood_map["food_item_id"] != null)
      {
        title = consumedFood_map["food_item_id"];
      }
      else
      {
        title = "null";
        //consumedFood_map["food_item_id"] = 0;
      }
      debugPrint("[ViewAllConsumedFoodsPage-> setUp()]\t $title");
    }
    /*for(int i = 0; i < consumedFoodTable.length; i++)
    {
      
      debugPrint("[ViewAllConsumedFoodsPage-> setUp()]\t consumedFoodTable[$i]: ${consumedFoodTable[i].toString()}");
      if(consumedFoodTable[i]["food_item_id"] != null)
      {
        title = consumedFoodTable[i]["food_item_id"];
      }
      else
      {
        title = "null";
        debugPrint("[ViewAllConsumedFoodsPage-> setUp()]\t updating consumedFoodTable[$i]...");
        consumedFoodTable[i]["food_item_id"] = 0;
      }
      debugPrint("[ViewAllConsumedFoodsPage-> setUp()]\t $title");
    }*/
    debugPrint("[ViewAllConsumedFoodsPage-> setUp()] consumedFoodTable[0]: ${consumedFoodTable[0].toString()}");
      
    List<ConsumedFood> tempConsumedFoods = consumedFoodTable.map((consumedFood_map)=> ConsumedFood.fromMap(consumedFood_map)).toList();

    
    


    widget.parentObject.readFromDatabase();
    consumedFoods = widget.parentObject.consumedFoods;

    //This is temporary code plaeas refactor this to make the program more robust --------------------------
    if(tempConsumedFoods.length > consumedFoods.length)
    {
      debugPrint("[ViewAllConsumedFoodsPage-> setUp()] ERROR updating collecting consumed foods via user failed!!!!!!!!!!!!!!!!!!!");
      consumedFoods = tempConsumedFoods;
    }
    else
    {
      debugPrint("[ViewAllConsumedFoodsPage-> setUp()] apparently collecting consumed foods via user suceededWWWWWWWWWWWWWWWWWWWWWWWW");
    }

    debugPrint("[ViewAllConsumedFoodsPage-> setUp()] End");
  }

  @override
  initState() {
    debugPrint("[ViewAllConsumedFoodsPage] Start");
    setUp().then((value){
      debugPrint("[ViewAllConsumedFoodsPage-> initState()] consumedFood update COMPLETE");
        setState(() 
        {
        }
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      thisUser: widget.thisUser,
      home: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(HomePage(thisUser: widget.thisUser,))),);},
      pageName: "ConsumedFoods",
      body: [
        (consumedFoods.length > 0) ? Column(children: [...consumedFoods.map((consumedFood) => ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(ViewConsumedFoodPage(thisConsumedFood: consumedFood, nextPage: ViewAllConsumedFoodsPage(thisUser: widget.thisUser, parentObject: widget.parentObject), thisUser: widget.thisUser))),);}, child: Text(consumedFood.id.toString())))]) : TextButton(onPressed: (){}, child: Text("Loading...")),
      ],
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),);
  }
}