import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/database_helper.dart';

class User {
  User({ID, required String Username, required String Password, String? Name, DateTime? DateOfBirth, int? Sex, double? Weight, double? Height, double? BMI})
  {
    debugPrint("[Classes->User-> CONSTRUCTOR] Start");
    if(ID != null)
    {
      _id = ID;
    }
    username = Username;
    password = password;
    name = Name;
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
  String? name;
  DateTime? dob;
  int? sex;
  double? weight;
  double? height;
  double? bmi;
  //List<StatusUpdate> statusUpdates;
  //List<ConsumedFodd> consumedFoods;

  DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<int> countMatching() async
  {
    debugPrint("[Classes->User-> countMatchingUser()] Entered");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    matchConditions[_databaseHelper.colUsername] = username;
    matchConditions[_databaseHelper.colPassword] = password;
    List<Map<String, dynamic>> matchingUsers = await _databaseHelper.getMatchingRows_WhereColumns(tableName: "UserTable", conditions: matchConditions);
    
    
    if(matchingUsers.length == 1)
    {
      debugPrint("[Classes->User-> countMatchingUser()] End");
      return 1;
    }
    else if(matchingUsers.length > 1)
    {
      debugPrint("[Classes->User-> countMatchingUser()] Error more than 1 account found but there should only be 1 or 0.");
      debugPrint("[Classes->User-> countMatchingUser()] End");
      return matchingUsers.length;
    }
    else
    {
      debugPrint("[Classes->User-> countMatchingUser()] End");
      return 0;
    }
    
  }


  Future<void> readID() async
  {
    debugPrint("[Classes->User-> readID()] Start");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    matchConditions[_databaseHelper.colUsername] = username;
    matchConditions[_databaseHelper.colPassword] = password;

    List<String> outputColumns = [_databaseHelper.colID];

    debugPrint("[Classes->User-> readID()] retrieving data from database ...");
    //a list of matching rows except only the requested columns of each row are output.
    List<Map<String, dynamic>> output = await _databaseHelper.getMatchingColumns_WhereColumns(tableName: "UserTable", conditions: matchConditions, outputColumns: outputColumns);
    
    debugPrint("[Classes->User-> readID()] processing ...");
    _id = output[0][_databaseHelper.colID];
    
    debugPrint("[Classes->User-> readID()] End");
  }

  









  Future<int> createUser() async
  {
    int result = 0;

    return result;
  }



  Future<void> readUserFromDatabase() async
  {

  }
  User.fromMap(Map<String, dynamic> map)
  {

  }
  void readUserFromMap(Map<String, dynamic> map)
  {

  }
  Map<String, dynamic> UserToMap()
  {
    Map<String, dynamic> map = Map<String, dynamic>();

    return map;
  }



  Future<int> updateUserInDB() async
  {
    int result = 0;

    return result;
  }



  Future<int> deleteUserFromDB() async
  {
    int result = 0;

    return result;
  }
  
}