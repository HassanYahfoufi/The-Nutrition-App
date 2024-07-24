import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:nutrition_app/custom_widgets.dart';

//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:nutrition_app/blank_class_template.dart';
//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx


/*
Blank

required_var##
Required_Var##
Required Variable With Space ###

optional_var##
Optional_Var##
Optional Variable With Space ###
*/

class UpdateBlankPage extends StatefulWidget {
  UpdateBlankPage({required this.nextPage, required this.thisBlank, required this.thisUser, super.key});
  final Widget nextPage;
  Blank thisBlank;
  User thisUser;

  @override
  State<UpdateBlankPage> createState() => _UpdateBlankPageState();
}

class _UpdateBlankPageState extends State<UpdateBlankPage> {
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  TextEditingController required_var01Controller = TextEditingController();
  TextEditingController required_var02Controller = TextEditingController();
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  TextEditingController required_conversion_var01Controller = TextEditingController();
  TextEditingController required_conversion_var02Controller = TextEditingController();
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  TextEditingController optional_var01Controller = TextEditingController();
  TextEditingController optional_var02Controller = TextEditingController();
  TextEditingController optional_var03Controller = TextEditingController();
  TextEditingController optional_var04Controller = TextEditingController();
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  TextEditingController optional_conversion_var01Controller = TextEditingController();
  TextEditingController optional_conversion_var02Controller = TextEditingController();
  TextEditingController optional_conversion_var03Controller = TextEditingController();
  TextEditingController optional_conversion_var04Controller = TextEditingController();
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx


  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> submit() async
  {
    debugPrint("\[UpdateBlankPage-> submit()] Start");

    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(required_var01Controller.text.isNotEmpty)
    {
      widget.thisBlank.required_var01 = requiredVar01_DataType.parse(required_var01Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(required_var02Controller.text.isNotEmpty)
    {
      widget.thisBlank.required_var02 = requiredVar02_DataType.parse(required_var02Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(required_conversion_var01Controller.text.isNotEmpty)
    {
      widget.thisBlank.required_conversion_var01 = required_conversionVar01_DataType.parse(required_conversion_var01Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(required_conversion_var02Controller.text.isNotEmpty)
    {
      widget.thisBlank.required_conversion_var02 = required_conversionVar02_DataType.parse(required_conversion_var02Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(optional_var01Controller.text.isNotEmpty)
    {
      widget.thisBlank.optional_var01 = optionalVar01_DataType.parse(optional_var01Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(optional_var02Controller.text.isNotEmpty)
    {
      widget.thisBlank.optional_var02 = optionalVar02_DataType.parse(optional_var02Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(optional_var03Controller.text.isNotEmpty)
    {
      widget.thisBlank.optional_var03 = optionalVar03_DataType.parse(optional_var03Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(optional_var04Controller.text.isNotEmpty)
    {
      widget.thisBlank.optional_var04 = optionalVar04_DataType.parse(optional_var04Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(optional_conversion_var01Controller.text.isNotEmpty)
    {
      widget.thisBlank.optional_conversion_var01 = optional_conversionVar01_DataType.parse(optional_conversion_var01Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(optional_conversion_var02Controller.text.isNotEmpty)
    {
      widget.thisBlank.optional_conversion_var02 = optional_conversionVar02_DataType.parse(optional_conversion_var02Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(optional_conversion_var03Controller.text.isNotEmpty)
    {
      widget.thisBlank.optional_conversion_var03 = optional_conversionVar03_DataType.parse(optional_conversion_var03Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    debugPrint("\[UpdateBlankPage-> submit()] processing ...");
    if(optional_conversion_var04Controller.text.isNotEmpty)
    {
      widget.thisBlank.optional_conversion_var04 = optional_conversionVar04_DataType.parse(optional_conversion_var04Controller.text);
    }
    //xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    
    



    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
    //newBlank = Blank(/*xxxxx*/Required_Var01: tempRequired_Var01, Required_Var02: tempRequired_Var02/*xxxxx*//*xxxxx*/, Required_Conversion_Var01: tempRequired_Conversion_Var01, Required_Conversion_Var02: tempRequired_Conversion_Var02/*xxxxx*//*xxxxx*/, Optional_Var01: tempOptional_Var01, Optional_Var02: tempOptional_Var02, Optional_Var03: tempOptional_Var03, Optional_Var04: tempOptional_Var04/*xxxxx*//*xxxxx*/, Optional_Conversion_Var01: tempOptional_Conversion_Var01, Optional_Conversion_Var02: tempOptional_Conversion_Var02, Optional_Conversion_Var03: tempOptional_Conversion_Var03, Optional_Conversion_Var04: tempOptional_Conversion_Var04/*xxxxx*/);
    //widget.thisBlank
    //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx

    debugPrint("\[UpdateBlankPage-> submit()] Updating...");
    int updateResult = await widget.thisBlank.update();

    if (updateResult != 0) {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>(widget.nextPage)),); 
      });
    } else {
      setState(() {
        debugPrint("\[UpdateBlankPage-> submit()] Update failed!");
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Update failed!"),
                  content: Text("Update operation failed!"),
                ));
        debugPrint("\[UpdateBlankPage-> submit()] Update failed!");
      });
    }


    
  }
  
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  Widget currentPage({/*xxxxx*/required required_var01Controller, required required_var02Controller/*xxxxx*//*xxxxx*/, required required_conversion_var01Controller, required required_conversion_var02Controller/*xxxxx*//*xxxxx*/, required optional_var01Controller, required optional_var02Controller, required optional_var03Controller, required optional_var04Controller/*xxxxx*//*xxxxx*/, required optional_conversion_var01Controller, required optional_conversion_var02Controller, required optional_conversion_var03Controller, required optional_conversion_var04Controller/*xxxxx*/})
  //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
  { 
    return Center(
          child: Column(children: [
            const SizedBox(height: 60),
            const Text(
              'Blank',
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
              child: TextField(
                controller: required_var01Controller,
                //onSubmitted: (text){},
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Required Variable With Space #01"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: required_var02Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Required Variable With Space #02"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: required_conversion_var01Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Required Conversion Variable With Space #01"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: required_conversion_var02Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Required Conversion Variable With Space #02"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_var01Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Variable With Space #01"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_var02Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Variable With Space #02"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_var03Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Variable With Space #03"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_var04Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Variable With Space #04"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_conversion_var01Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Conversion Variable With Space #01"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_conversion_var02Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Conversion Variable With Space #02"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_conversion_var03Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Conversion Variable With Space #03"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxx!!!!
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: optional_conversion_var04Controller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Optional Conversion Variable With Space #04"),
              ),
            ),
            //xxxxxxxxxxxxxxxxxxxx!!!!
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
            //xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxx
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
        );}


  @override
  initState() {
    debugPrint("[UpdateBlankPage] Start");
  }

  @override
  Widget build(BuildContext context) {
    
    return PageWidget(pageName: "Update Blank With Space Page", body: [currentPage(/*xxxxx*/required_var01Controller: required_var01Controller, required_var02Controller: required_var02Controller/*xxxxx*//*xxxxx*/, required_conversion_var01Controller: required_conversion_var01Controller, required_conversion_var02Controller: required_conversion_var02Controller/*xxxxx*//*xxxxx*/, optional_var01Controller: optional_var01Controller, optional_var02Controller: optional_var02Controller, optional_var03Controller: optional_var03Controller, optional_var04Controller: optional_var04Controller/*xxxxx*//*xxxxx*/, optional_conversion_var01Controller: optional_conversion_var01Controller, optional_conversion_var02Controller: optional_conversion_var02Controller, optional_conversion_var03Controller: optional_conversion_var03Controller, optional_conversion_var04Controller: optional_conversion_var04Controller/*xxxxx*/)], thisUser: widget.thisUser,);
    
  }
}
