import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class User {
  User({ID, required Username, required Password, FirstName, LastName, DateOfBirth, Sex, Weight, Height, BMI})
  {
    debugPrint("[Classes->User-> CONSTRUCTOR] Start");
    if(ID != null)
    {
      _id = ID;
    }
    username = Username;
    password = password;
    firstName = FirstName;
    lastName = LastName;
    dob = DateOfBirth;
    sex = Sex;
    weight = Weight;
    height = Height;
    bmi = BMI;

    debugPrint("[Classes->User-> CONSTRUCTOR] End");
  }

  int? _id;
  late String username;
  late String password;
  String? firstName;
  String? lastName;
  DateTime? dob;
  int? sex;
  double? weight;
  double? height;
  double? bmi;
  //List<StatusUpdate> statusUpdates;
  //List<ConsumedFodd> consumedFoods;


  bool userAlreadyExists()
  {
    return false;
  }

  int createUser()
  {
    return 0;
  }



}