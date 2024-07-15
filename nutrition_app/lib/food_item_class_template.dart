import "package:flutter/material.dart";
import "package:nutrition_app/database_helper.dart";

import 'package:nutrition_app/models.dart'; 

/*
  Food Item
  FoodItem
  foodItem

  

  
  name
  String
  Name
  name
  Name

  required_conversion_var01
  required_conversionVar01_DataType
  Required_Conversion_Var01
  required_conversion_var_underscore01
  Required Conversion Variable With Space #01


  note
  String
  Note
  note
  Note

  optional_conversion_var01
  optional_conversionVar01_DataType
  Optional_Conversion_Var01
  optional_conversion_var_underscore01
  Optional Conversion Variable With Space #01


  nonDB_var01
  nonDBVar01_DataType
  NonDB_Var01

  nutrients
  Nutrient
  Nutrients

  m2m_var01
  m2mVar01_DataType
  M2M_Var01
  
*/













class Nutrient {
  int? _foodItemID;

  int? get foodItemID => _foodItemID;

  Nutrient.fromMap(Map<String, dynamic> map) 
  {
    debugPrint("[Classes->Nutrient-> Nutrient.fromMap()] Start");

    

    debugPrint("[Classes->Nutrient-> Nutrient.fromMap()] End");
  }


  Map<String, dynamic> toMap() 
  {
    Map<String, dynamic> map = Map<String, dynamic>();

    
    

    return map;
  }
}
