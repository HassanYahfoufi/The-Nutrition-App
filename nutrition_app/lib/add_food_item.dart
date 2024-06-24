import 'package:flutter/material.dart';
import 'package:nutrition_app/custom_widgets.dart';

class AddNewFoodItem extends StatefulWidget {
  const AddNewFoodItem({super.key});

  @override
  State<AddNewFoodItem> createState() => _AddNewFoodItemState();
}

class _AddNewFoodItemState extends State<AddNewFoodItem> {
  double buttonHeight = 25;
  double buttonWidth = 250;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PageWidget(home: () {}, pageName: "Add New Food Item", body: [
      Column(
        children: [
          SingleChildScrollView(child: 
            Form(
              key: _formKey,
              child: Column(children: [
                Column(children: [
                  SizedBox(height: buttonHeight, width: buttonWidth, child: 
                    Row(children: [
                      Text("Name"),
                      OutlinedButton(onPressed: () {}, child: Text(""))
                    ]),
                  )
                ]), 
                SingleChildScrollView(child: Column()), 
                SingleChildScrollView(child: Column()), 
                SingleChildScrollView(child: Column()),
              ]),  
            ),
          ),
        ],
      )
    ]);
  }
}

/*
Column(
              mainAxisSize: MainAxisSize.min, //!!!!!!!!!!!got this from youtube
              children: [
                //buildTitle(),
                TextField(controller: appointmentSubject, decoration: InputDecoration(labelText: "Appointment subject")),//String subject;TextField(controller: appointmentSubject),
                TextField(controller: appointmentNotes, decoration: InputDecoration(labelText: "Appointment notes")),//String notes;TextField(controller: appointmentNotes),
                buildFrom(),
                buildTo(),
              
              
              ElevatedButton(onPressed: submit, child: Text("Submit")),
              ElevatedButton(onPressed: checkAppointments, child: Text("Check Appointments")),
              ]),
 */