import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/create_status_update_page.dart';
import 'package:nutrition_app/create_status_update_page_v2.dart';
import 'package:nutrition_app/create_blank_page.dart';
import 'package:nutrition_app/create_consumed_food_page.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/login_page.dart';
import 'package:nutrition_app/view_all_status_updates_page.dart';
import 'package:nutrition_app/view_all_consumed_foods_page.dart';
import 'package:nutrition_app/view_food_items.dart';







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
  @override

  Widget build(BuildContext context) {
    return PageWidget(home: () { debugPrint("[HomePage-> build] Going to Log-In Page"); Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);}, pageName: "Home Page", thisUser: widget.thisUser, body: [Center(
      child: Column(children: [
        
        SizedBox(height: 25),
        Icon(Icons.more_vert),

        Column(children:[
          Row(children:[
            SizedOutlinedButton(text: "Calories", height: buttonHeight, width: buttonWidth),
            SizedOutlinedButton(text: "BMI", height: buttonHeight, width: buttonWidth),
            SizedOutlinedButton(text: "Weight", height: buttonHeight, width: buttonWidth),
          ]),
          SizedBox(child: LineChartWidget(), height: 200, width: 700),
        ]),
        SizedBox(height: (spacerHeight * 2)),
        SizedOutlinedButton(text: "View Food Items", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewFoodItems(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),

        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add New Recipie", height: buttonHeight, width: buttonWidth),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Consumed Food", height: buttonHeight, width: buttonWidth),
        SizedBox(height: spacerHeight),

        SizedOutlinedButton(text: "Update Status", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateStatusUpdatePage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Update Status v2", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateStatusUpdatePage_v2(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add New ConsumedFood", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateConsumedFoodPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add New Blank", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlankPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Status Updates", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllStatusUpdatesPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "View Consumed Foods", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllConsumedFoodsPage(parentObject:widget.thisUser, thisUser: widget.thisUser)),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Sign Out", height: buttonHeight, width: buttonWidth, onPressed: () {displayDialogSignOut(context);},)
      ],),
    )]);
  }
}
