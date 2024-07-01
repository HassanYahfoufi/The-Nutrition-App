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
  List<StatusUpdate> statusUpdates = [];
  //List<ConsumedFodd> consumedFoods = [];

  DatabaseHelper _databaseHelper = DatabaseHelper();

  int? get id => _id;

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



  Future<void> readStatusUpdates() async 
  {
    debugPrint("[Classes->User-> readStatusUpdates()] Start");
    statusUpdates.clear();
    


    debugPrint("[Classes->Account-> readStatusUpdates()] retrieving statusUpdates...");
    List<Map<String, dynamic>> matchingStatusUpdates = await _databaseHelper.getMatchingRows(tableName: "StatusUpdateTable", column: "user_id", value: _id!.toString());

    statusUpdates = matchingStatusUpdates.map((statusUpdate) => StatusUpdate.fromMap(statusUpdate)).toList();
    debugPrint("[Classes->User-> readStatusUpdates()] End");
  }

  Future<void> readLists() async
  {
    await readM2Os();
  }
  
  Future<void> readM2Os() async
  {
    
    await readStatusUpdates();
    
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
    if (_id == null) 
    {
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

        await readLists();
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

      debugPrint("[Classes->User-> readFromDatabase()] retrieving lists from database (i.e. await readLists())...");
      await readLists();

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
    //bmi = map["bmi"];

    debugPrint("[Classes->User-> User.fromMap()] End");
  }
  Future<void> readFromMap(Map<String, dynamic> map) async {
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

    await readLists();

    debugPrint("[Classes->User-> readUserFromMap()] End");
  }

  Future<User> fromMap(Map<String, dynamic> map) async {
    debugPrint("[Classes->User-> readUserFromMap()] Start");

    User tempUser = User.fromMap(map);

    await tempUser.readLists();

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
    //map["bmi"] = bmi;

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

  Future<int> update() async {
    debugPrint("[Classes->User-> update()] Start");
    int result = 0;

    debugPrint("[Classes->User-> update()] updating...");
    result = await _databaseHelper.update(tableName: "UserTable", tableRow: this);
    //result = await _databaseHelper.update_fromMap(tableName: "UserTable", values: toMap());
    debugPrint("[Classes->User-> update()] update result: $result");

    
    debugPrint("[Classes->User-> update()] end");
    return result;
  }

  Future<int> delete() async {
    int result = 0;

    return result;
  }
}


class StatusUpdate {
  StatusUpdate(
      {ID,
      required int UserID,
      required String Title,
      required DateTime Timestamp,
      required DateTime DateCreated,
      required DateTime DateModified,
      String? Note,
      double? Weight,
      }) {
    debugPrint("[Classes->StatusUpdate-> CONSTRUCTOR] Start");
    if (ID != null) {
      _id = ID;
    }
    userID = UserID;
    title = Title;
    timestamp = Timestamp;
    dateCreated = DateCreated;
    dateModified = DateModified;
    note = Note;
    weight = Weight;
    
    debugPrint("[Classes->StatusUpdate-> CONSTRUCTOR] End");
  }
 

  int? _id;

  late int userID;
  late String title;
  late DateTime timestamp;
  late DateTime dateCreated;
  late DateTime dateModified;
  String? note;
  double? weight;

  

  DatabaseHelper _databaseHelper = DatabaseHelper();


  int? get id => _id;
  


  
  Future<int> countMatching() async {
    debugPrint("[Classes->StatusUpdate->countMatching()] Entered");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    
    matchConditions[_databaseHelper.colUserID] = userID;
    matchConditions[_databaseHelper.colTitle] = title;
    matchConditions[_databaseHelper.colTimestamp] = timestamp;
    matchConditions[_databaseHelper.colDateCreated] = dateCreated;
    matchConditions[_databaseHelper.colDateModified] = dateModified;
    
    //A list of rows that matched the given criteria from the target table
    List<Map<String, dynamic>> matchingStatusUpdates =
        await _databaseHelper.getMatchingRows_WhereColumns(
            tableName: "StatusUpdateTable", conditions: matchConditions);

    if (matchingStatusUpdates.length == 1) {
      debugPrint("[Classes->StatusUpdate->countMatching()] End");
      return 1;
    } else if (matchingStatusUpdates.length > 1) {
      debugPrint(
          "[Classes->StatusUpdate->countMatching()] Error more than 1 statusUpdate found but there should only be 1 or 0.");
      debugPrint("[Classes->StatusUpdate->countMatching()] End");
      return matchingStatusUpdates.length;
    } else {
      debugPrint("[Classes->StatusUpdate->countMatching()] End");
      return 0;
    }
  }
  

  Future<void> readID() async {
    debugPrint("[Classes->StatusUpdate-> readID()] Start");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    matchConditions[_databaseHelper.colUserID] = userID;
    matchConditions[_databaseHelper.colTitle] = title;
    matchConditions[_databaseHelper.colTimestamp] = timestamp;
    matchConditions[_databaseHelper.colDateCreated] = dateCreated;
    matchConditions[_databaseHelper.colDateModified] = dateModified;
    
    List<String> outputColumns = [_databaseHelper.colID];

    debugPrint("[Classes->StatusUpdate-> readID()] retrieving data from database ...");
    //a list of matching rows except only the requested columns of each row are output.
    List<Map<String, dynamic>> output =
        await _databaseHelper.getMatchingColumns_WhereColumns(
            tableName: "StatusUpdateTable",
            conditions: matchConditions,
            outputColumns: outputColumns);

    debugPrint("[Classes->StatusUpdate-> readID()] processing ...");
    if(output.length == 1)
    {
      _id = output[0][_databaseHelper.colID];
    }
    else
    {
      if(output.length == 0)
      {
        debugPrint("[Classes->StatusUpdate-> readID()] ERROR: No matching users found!");
      }
      else
      {
        debugPrint("[Classes->StatusUpdate-> readID()] ERROR: ${output.length} matching users found!");
      }
      
    }

    debugPrint("[Classes->StatusUpdate-> readID()] End");
  }
  
  

  

  



  Future<int> create() async {
    debugPrint("[Classes->StatusUpdate-> create()] Start");

    debugPrint("[Classes->StatusUpdate-> create()] inserting new statusUpdate into database ...");
    int result = await _databaseHelper.insert(tableName: "StatusUpdateTable", objectAsMap: toMap());
    debugPrint("[Classes->StatusUpdate-> create()] Insertion COMPLETE. result = ${result}");
    

    debugPrint("[Classes->StatusUpdate-> create()] End");
    return result;
  }

  Future<bool> readFromDatabase() async {
    debugPrint("[Classes->StatusUpdate-> readFromDatabase()] Start");
    if (_id == null) {
      Map<String, dynamic> matchConditions = Map<String, dynamic>();
      
      matchConditions[_databaseHelper.colUserID] = userID;
      matchConditions[_databaseHelper.colTitle] = title;
      matchConditions[_databaseHelper.colTimestamp] = timestamp;
      matchConditions[_databaseHelper.colDateCreated] = dateCreated;
      matchConditions[_databaseHelper.colDateModified] = dateModified;
      
      
      debugPrint("[Classes->StatusUpdate-> readFromDatabase()] Retrieving data from database (using required variables)...");
      
      List<Map<String, dynamic>> matchingStatusUpdates = await _databaseHelper.getMatchingRows_WhereColumns( tableName: "StatusUpdateTable", conditions: matchConditions);

      if (matchingStatusUpdates.length == 1) 
      {
        debugPrint("[Classes->StatusUpdate-> readFromDatabase()] processing data...");
        readFromMap(matchingStatusUpdates[0]);
        

        return true;
      } 
      else if (matchingStatusUpdates.length > 1) 
      {
        debugPrint("[Classes->StatusUpdate-> readFromDatabase()] Error more than 1 statusUpdate found but there should only be 1 or 0.");
        debugPrint("[Classes->StatusUpdate-> readFromDatabase()] End");
        return false;
      } 
      else 
      {
        debugPrint("[Classes->StatusUpdate-> readFromDatabase()] No matching statusUpdates found!");
        debugPrint("[Classes->StatusUpdate-> readFromDatabase()] End");
        return false;
      }
    } else {
      debugPrint(
          "[Classes->StatusUpdate-> readFromDatabase()] Retrieving data from database (using id)...");
      List<Map<String, dynamic>> matchingStatusUpdates =
          await _databaseHelper.getMatchingRows(
              tableName: "StatusUpdateTable",
              column: _databaseHelper.colID,
              value: _id.toString());

      debugPrint("[Classes->StatusUpdate-> readFromDatabase()] processing data...");
      readFromMap(matchingStatusUpdates[0]);
      debugPrint("[Classes->StatusUpdate-> readFromDatabase()] End");
      return true;
    }
  }
  
  StatusUpdate.fromMap(Map<String, dynamic> map) {
    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] Start");

    _id = map["id"];
    
    userID = map["user_id"];
    title = map["title"];
    timestamp = DateTime.parse(map["timestamp"]);
    dateCreated = DateTime.parse(map["date_created"]);
    dateModified = DateTime.parse(map["date_modified"]);
    note = map["note"];
    weight = map["weight"];
    
    

    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] End");
  }
  Future<void> readFromMap(Map<String, dynamic> map) async 
  {
    debugPrint("[Classes->StatusUpdate-> readStatusUpdateFromMap()] Start");

    _id = map["id"];
    userID = map["user_id"];
    title = map["title"];
    timestamp = DateTime.parse(map["timestamp"]);
    dateCreated = DateTime.parse(map["date_created"]);
    dateModified = DateTime.parse(map["date_modified"]);
    note = map["note"];
    weight = map["weight"];
    

    debugPrint("[Classes->StatusUpdate-> readStatusUpdateFromMap()] End");
  }
  
  Future<StatusUpdate> fromMap(Map<String, dynamic> map) async {
    debugPrint("[Classes->StatusUpdate-> readStatusUpdateFromMap()] Start");

    StatusUpdate tempStatusUpdate = StatusUpdate.fromMap(map);

    debugPrint("[Classes->StatusUpdate-> readStatusUpdateFromMap()] End");
    return tempStatusUpdate;
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    if (_id != null) {
      map['id'] = _id;
    }
    map["user_id"] = this.userID;
    map["title"] = this.title;
    map["timestamp"] = timestamp.toString();
    map["date_created"] = dateCreated.toString();
    map["date_modified"] = dateModified.toString();
    map["note"] = note;
    map["weight"] = weight;
    

    return map;
  }
  
  Future<int> update() async {
    debugPrint("[Classes->StatusUpdate-> update()] Start");
    int result = 0;

    debugPrint("[Classes->StatusUpdate-> update()] updating...");
    result = await _databaseHelper.update(tableName: "StatusUpdateTable", tableRow: this);
    //result = await _databaseHelper.update_fromMap(tableName: "StatusUpdateTable", values: toMap());
    debugPrint("[Classes->StatusUpdate-> update()] update result: $result");

    
    debugPrint("[Classes->StatusUpdate-> update()] end");
    return result;
  }

  Future<int> delete() async {
    int result = 0;

    return result;
  }
}


