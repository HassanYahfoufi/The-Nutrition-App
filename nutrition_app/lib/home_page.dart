import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';
//import 'package:nutrition_app/create_status_update_page.dart';
import 'package:nutrition_app/create_blank_page.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/login_page.dart';




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
    return PageWidget(home: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);}, pageName: "Home Page", thisUser: widget.thisUser, body: [Center(
      child: Column(children: [
        
        SizedBox(height: 25),
        Icon(Icons.more_vert),
        SizedBox(child: LineChartWidget(), height: 200, width: 700),
        SizedBox(height: (spacerHeight * 2)),
        TextButton(
          
          onPressed: (
  
           
          ){ Navigator.pushNamed(context, '/viewfooditems');},
          
          child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                    child: Text(
                  'View Food items',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
              ),
        ),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add New Recipie", height: buttonHeight, width: buttonWidth),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add Consumed Food", height: buttonHeight, width: buttonWidth),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Update Status", height: buttonHeight, width: buttonWidth, onPressed: (){/*Navigator.push(context, MaterialPageRoute(builder: (context) => CreateStatusUpdatePage()),);*/}),
        SizedBox(height: spacerHeight),
        SizedOutlinedButton(text: "Add New Blank", height: buttonHeight, width: buttonWidth, onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlankPage(nextPage: HomePage(thisUser: widget.thisUser,), thisUser: widget.thisUser)),);}),
      ],),
    )]);
  }
}
