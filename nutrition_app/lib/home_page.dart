import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';
import 'package:nutrition_app/create_status_update_page.dart';
import 'package:nutrition_app/create_blank_page.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double buttonHeight = 50;
  double buttonWidth = 200;
  double spacerHeight = 15;
  @override

  Widget build(BuildContext context) {
    return PageWidget(home: () {}, pageName: "Home Page", body: [Center(
      child: Column(children: [
        SizedBox(height: 25,),
        SizedBox(child: OutlinedButton(onPressed: () {}, child: Text("Placeholder")), height: 175, width: 350),
        SizedBox(height: (spacerHeight * 2)),
        SizedOutlinedButton(text: "Add New Food Item", height: buttonHeight, width: buttonWidth),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add New Recipie", height: buttonHeight, width: buttonWidth),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Consumed Food", height: buttonHeight, width: buttonWidth),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Update Status", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateStatusUpdatePage()),);}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add New Blank", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlankPage(nextPage: HomePage())),);}),
      ],),
    )]);
  }
}
