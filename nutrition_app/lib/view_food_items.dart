import 'package:flutter/material.dart';

class ViewFoodItems extends StatefulWidget {
  const ViewFoodItems({super.key});

  @override
  State<ViewFoodItems> createState() => _ViewFoodItemsState();
}

class _ViewFoodItemsState extends State<ViewFoodItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Food Items"),
        backgroundColor: Colors.green,
      )
    );
  }
}
