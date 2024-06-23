import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/database_helper.dart';

class User {
  User(
      {ID,
      required String Username,
      required String Password,
      String? Name,
      DateTime? DateOfBirth,
      int? Sex,
      double? Weight,
      double? Height,
      double? BMI}) {
    debugPrint("[Classes->User-> CONSTRUCTOR] Start");
    if (ID != null) {
      _id = ID;
    }
    username = Username;
    password = Password;
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

  Future<int> countMatching() async {
    debugPrint("[Classes->User-> countMatchingUser()] Entered");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    matchConditions[_databaseHelper.colUsername] = username;
    matchConditions[_databaseHelper.colPassword] = password;
    List<Map<String, dynamic>> matchingUsers =
        await _databaseHelper.getMatchingRows_WhereColumns(
            tableName: "UserTable", conditions: matchConditions);

    if (matchingUsers.length == 1) {
      debugPrint("[Classes->User-> countMatchingUser()] End");
      return 1;
    } else if (matchingUsers.length > 1) {
      debugPrint(
          "[Classes->User-> countMatchingUser()] Error more than 1 account found but there should only be 1 or 0.");
      debugPrint("[Classes->User-> countMatchingUser()] End");
      return matchingUsers.length;
    } else {
      debugPrint("[Classes->User-> countMatchingUser()] End");
      return 0;
    }
  }

  Future<void> readID() async {
    debugPrint("[Classes->User-> readID()] Start");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    matchConditions[_databaseHelper.colUsername] = username;
    matchConditions[_databaseHelper.colPassword] = password;

    List<String> outputColumns = [_databaseHelper.colID];

    debugPrint("[Classes->User-> readID()] retrieving data from database ...");
    //a list of matching rows except only the requested columns of each row are output.
    List<Map<String, dynamic>> output =
        await _databaseHelper.getMatchingColumns_WhereColumns(
            tableName: "UserTable",
            conditions: matchConditions,
            outputColumns: outputColumns);

    debugPrint("[Classes->User-> readID()] processing ...");
    _id = output[0][_databaseHelper.colID];

    debugPrint("[Classes->User-> readID()] End");
  }

  Future<int> create() async {
    debugPrint("[Classes->User-> create()] Start");

    debugPrint(
        "[Classes->User-> create()] inserting new user into database ...");
    int result = await _databaseHelper.insert(
        tableName: "UserTable", objectAsMap: toMap());
    debugPrint(
        "[Classes->User-> create()] Insertion COMPLETE. result = ${result}");

    debugPrint("[Classes->User-> create()] End");
    return result;
  }

  Future<bool> readFromDatabase() async {
    debugPrint("[Classes->User-> readFromDatabase()] Start");
    if (_id == null) {
      Map<String, dynamic> matchConditions = Map<String, dynamic>();
      matchConditions[_databaseHelper.colUsername] = username;
      matchConditions[_databaseHelper.colPassword] = password;

      debugPrint(
          "[Classes->User-> readFromDatabase()] Retrieving data from database (using username and password)...");
      List<Map<String, dynamic>> matchingUsers =
          await _databaseHelper.getMatchingRows_WhereColumns(
              tableName: "UserTable", conditions: matchConditions);

      if (matchingUsers.length == 1) {
        debugPrint("[Classes->User-> readFromDatabase()] processing data...");
        readFromMap(matchingUsers[0]);
        return true;
      } else if (matchingUsers.length > 1) {
        debugPrint(
            "[Classes->User-> readFromDatabase()] Error more than 1 account found but there should only be 1 or 0.");
        debugPrint("[Classes->User-> readFromDatabase()] End");
        return false;
      } else {
        debugPrint(
            "[Classes->User-> readFromDatabase()] No matching users found!");
        debugPrint("[Classes->User-> readFromDatabase()] End");
        return false;
      }
    } else {
      debugPrint(
          "[Classes->User-> readFromDatabase()] Retrieving data from database (using id)...");
      List<Map<String, dynamic>> matchingUsers =
          await _databaseHelper.getMatchingRows(
              tableName: "UserTable",
              column: _databaseHelper.colID,
              value: _id.toString());

      debugPrint("[Classes->User-> readFromDatabase()] processing data...");
      readFromMap(matchingUsers[0]);
      debugPrint("[Classes->User-> readFromDatabase()] End");
      return true;
    }
  }

  User.fromMap(Map<String, dynamic> map) {
    debugPrint("[Classes->User-> User.fromMap()] Start");

    _id = map["id"];
    username = map["username"];
    password = map["password"];
    name = map["name"];
    dob = map["dob"];
    sex = map["sex"];
    weight = map["weight"];
    height = map["height"];
    bmi = map["bmi"];

    debugPrint("[Classes->User-> User.fromMap()] End");
  }
  void readFromMap(Map<String, dynamic> map) {
    debugPrint("[Classes->User-> readUserFromMap()] Start");

    _id = map["id"];
    username = map["username"];
    password = map["password"];
    name = map["name"];
    dob = map["dob"];
    sex = map["sex"];
    weight = map["weight"];
    height = map["height"];
    bmi = map["bmi"];

    debugPrint("[Classes->User-> readUserFromMap()] End");
  }

  User fromMap(Map<String, dynamic> map) {
    debugPrint("[Classes->User-> readUserFromMap()] Start");

    User tempUser = User.fromMap(map);

    debugPrint("[Classes->User-> readUserFromMap()] End");
    return tempUser;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    if (_id != null) {
      map['id'] = _id;
    }
    map["username"] = this.username;
    map["password"] = this.password;
    map["name"] = name;
    map["dob"] = dob;
    map["sex"] = sex;
    map["weight"] = weight;
    map["height"] = height;
    map["bmi"] = bmi;

    /*
    if(name != null)
    {
      map["name"] = name;
    }
    if(dob != null)
    {
      map["dob"] = dob;
    }
    if(sex != null)
    {
      map["sex"] = sex;
    }
    if(weight != null)
    {
      map["weight"] = weight;
    }
    if(height != null)
    {
      map["height"] = height;
    }
    if(bmi != null)
    {
      map["bmi"] = bmi;
    }
    */

    return map;
  }

  Future<int> updateUserInDB() async {
    int result = 0;

    return result;
  }

  Future<int> deleteUserFromDB() async {
    int result = 0;

    return result;
  }
}
