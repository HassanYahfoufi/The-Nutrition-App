import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/view_nutrient_info_page.dart';
import 'package:nutrition_app/home_page.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:nutrition_app/nutrient_info_class_template.dart';
//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

class ViewAllNutrientInfosPage extends StatefulWidget {
  ViewAllNutrientInfosPage({required this.thisUser, super.key});
  
  User thisUser;
  


  @override
  _ViewAllNutrientInfosPageState createState() => _ViewAllNutrientInfosPageState();
}

class _ViewAllNutrientInfosPageState extends State<ViewAllNutrientInfosPage> {

  List<NutrientInfo> nutrientInfos = [];

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> setUp() async
  {
    debugPrint("[ViewAllNutrientInfosPage-> setUp()] getting all Nutrient Infos... ");
    List<Map<String, dynamic>> nutrientInfoTable = await databaseHelper.getEntireTable_asMap(tableName: "NutrientInfoTable");
    debugPrint("[ViewAllNutrientInfosPage-> setUp()] retrieved ${nutrientInfoTable.length} Nutrient Infos... ");
    String name;
    debugPrint("[ViewAllNutrientInfosPage-> setUp()] printing all Nutrient Infos... ---------------------------------------------------------------------------------");
    for(Map<String, dynamic> nutrientInfo_map in nutrientInfoTable)
    {
      debugPrint("[ViewAllNutrientInfosPage-> setUp()]\t map ${nutrientInfo_map.toString()}");
      name = nutrientInfo_map["name"];
      debugPrint("[ViewAllNutrientInfosPage-> setUp()]\t nutrientInfo_map[\"name\"] = ${nutrientInfo_map["name"]}");
      debugPrint("[ViewAllNutrientInfosPage-> setUp()]\t $name");
    }
    nutrientInfos = nutrientInfoTable.map((nutrientInfo_map)=> NutrientInfo.fromMap(nutrientInfo_map)).toList();
  }

  @override
  initState() {
    debugPrint("[ViewAllNutrientInfosPage] Start");
    setUp().then((value){
      debugPrint("[ViewAllNutrientInfosPage-> initState()] nutrientInfo update COMPLETE");
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
      pageName: "NutrientInfos",
      body: [
        (nutrientInfos.length > 0) ? Column(children: [...nutrientInfos.map((nutrientInfo) => ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>(ViewNutrientInfoPage(thisNutrientInfo: nutrientInfo, nextPage: ViewAllNutrientInfosPage(thisUser: widget.thisUser), thisUser: widget.thisUser))),);}, child: Text(nutrientInfo.name.toString())))]) : TextButton(onPressed: (){}, child: Text("Loading...")),
      ],
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),);
  }
}