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
  List<ConsumedFood> consumedFoods = [];

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
    

    debugPrint("[Classes->User-> readStatusUpdates()] id = $_id");
    debugPrint("[Classes->User-> readStatusUpdates()] retrieving statusUpdates...");
    List<Map<String, dynamic>> matchingStatusUpdates = await _databaseHelper.getMatchingRows(tableName: "StatusUpdateTable", column: _databaseHelper.colUserID, value: _id!.toString());
    debugPrint("[Classes->User-> readStatusUpdates()] retrieved ${matchingStatusUpdates.length} statusUpdates");

    debugPrint("[Classes->User-> readStatusUpdates()] processing...");
    statusUpdates = matchingStatusUpdates.map((statusUpdate) => StatusUpdate.fromMap(statusUpdate)).toList();
    debugPrint("[Classes->User-> readStatusUpdates()] End");
  }
  Future<void> readConsumedFoods() async 
  {
    debugPrint("[Classes->User-> readConsumedFoods()] Start");
    consumedFoods.clear();
    

    debugPrint("[Classes->User-> readConsumedFoods()] id = $_id");
    debugPrint("[Classes->User-> readConsumedFoods()] retrieving consumedFoods...");
    List<Map<String, dynamic>> matchingConsumedFoods = await _databaseHelper.getMatchingRows(tableName: "ConsumedFoodTable", column: _databaseHelper.colUserID, value: _id!.toString());
    debugPrint("[Classes->User-> readConsumedFoods()] retrieved ${matchingConsumedFoods.length} consumedFoods");

    debugPrint("[Classes->User-> readConsumedFoods()] processing...");
    consumedFoods = matchingConsumedFoods.map((consumedFood) => ConsumedFood.fromMap(consumedFood)).toList();
    debugPrint("[Classes->User-> readConsumedFoods()] End");
  }

  Future<void> readLists() async
  {
    debugPrint("[Classes->User-> readLists()] Start");
    await readM2Os();
    debugPrint("[Classes->User-> readLists()] End");
  }
  
  Future<void> readM2Os() async
  {
    debugPrint("[Classes->User-> readM2Os()] Start");
    await readStatusUpdates();
    await readConsumedFoods();
    debugPrint("[Classes->User-> readM2Os()] End");
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

        debugPrint("[Classes->User-> readFromDatabase()] reading lists...");
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

    debugPrint("[CreateStatusUpdatePage_v2->submit()] statusUpdateMap: ${map.toString()}");

    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] processing id(${map["id"]})...");
    _id = map["id"];
    
    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] processing user_id(${map["user_id"]})...");
    userID = map["user_id"];
    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] processing title(${map["title"]})...");
    title = map["title"];
    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] processing timestamp(${map["timestamp"]})...");
    timestamp = DateTime.parse(map["timestamp"]);
    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] processing date_created(${map["date_created"]})...");
    dateCreated = DateTime.parse(map["date_created"]);
    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] processing date_modified(${map["date_modified"]})...");
    dateModified = DateTime.parse(map["date_modified"]);
    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] processing note(${map["note"]})...");
    note = map["note"];
    debugPrint("[Classes->StatusUpdate-> StatusUpdate.fromMap()] processing weight(${map["weight"]})...");
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


class FoodItem{
  FoodItem(
    {ID,
    required int UserId,
    required String FoodName,
    required double Amount,
    required String Nutrient,
    required String Ingredient,
    required String Allergen,

}){
  //
  if(ID != null){
    _id = ID;
  }

  userID = UserId;
  foodName = FoodName;
  amount = Amount;
  nutrient = Nutrient;
  ingredient = Ingredient;
  allergen = Allergen;


}
int? _id;
late int userID;
late String foodName;
late double amount;
late String nutrient;
late String ingredient;
late String allergen;

DatabaseHelper _databaseHelper = DatabaseHelper();
int? get id => _id;

Future<int> countMatching() async {
    debugPrint("[Classes->FoodItem->countMatching()] Entered");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    matchConditions[_databaseHelper.colUserID] = userID;
    matchConditions[_databaseHelper.colFoodName] = foodName;
    matchConditions[_databaseHelper.colAmount] = amount;
    matchConditions[_databaseHelper.colTimestamp] = nutrient;
    matchConditions[_databaseHelper.colIngredient] = ingredient;
    matchConditions[_databaseHelper.ColAllergen] = allergen;

    
    List<Map<String, dynamic>> matchingFoodItem =
        await _databaseHelper.getMatchingRows_WhereColumns(
            tableName: "FoodItemTable", conditions: matchConditions);
     if (matchingFoodItem.length == 1) {
      debugPrint("[Classes->FoodItem->countMatching()] End");
      return 1;
    } else if (matchingFoodItem.length > 1) {
      debugPrint(
          "[Classes->FoodItem->countMatching()] Error more than 1 FoodItem found but there should only be 1 or 0.");
      debugPrint("[Classes->FoodItem->countMatching()] End");
      return matchingFoodItem.length;
    } else {
      debugPrint("[Classes->FoodItem->countMatching()] End");
      return 0;
    }
        

}

Future<void> readID() async {
    debugPrint("[Classes->FoodItem-> readID()] Start");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    matchConditions[_databaseHelper.colUserID] = userID;
    matchConditions[_databaseHelper.colFoodName] = foodName;
    matchConditions[_databaseHelper.colAmount] = amount;
    matchConditions[_databaseHelper.colTimestamp] = nutrient;
    matchConditions[_databaseHelper.colIngredient] = ingredient;
    matchConditions[_databaseHelper.ColAllergen] = allergen;
        
        List<String> outputColumns = [_databaseHelper.colID];

    debugPrint("[Classes->FoodItem-> readID()] retrieving data from database ...");
    //a list of matching rows except only the requested columns of each row are output.
    List<Map<String, dynamic>> output =
        await _databaseHelper.getMatchingColumns_WhereColumns(
            tableName: "FoodItemTable",
            conditions: matchConditions,
            outputColumns: outputColumns);

    debugPrint("[Classes->FoodItem-> readID()] processing ...");
    if(output.length == 1)
    {
      _id = output[0][_databaseHelper.colID];
    }
    else
    {
      if(output.length == 0)
      {
        debugPrint("[Classes->FoodItem-> readID()] ERROR: No matching users found!");
      }
      else
      {
        debugPrint("[Classes->FoodItem-> readID()] ERROR: ${output.length} matching users found!");
      }
      

}
debugPrint("[Classes->FoodItem-> readID()] End");

}

Future<int> create() async {
    debugPrint("[Classes->FoodItem-> create()] Start");

    debugPrint("[Classes->FoodItem-> create()] inserting new FoodItem into database ...");
    int result = await _databaseHelper.insert(tableName: "FoodItemTable", objectAsMap: toMap());
    debugPrint("[Classes->FoodItem-> create()] Insertion COMPLETE. result = ${result}");

    debugPrint("[Classes->FoodItem-> create()] End");
    return result;
  }

  Future<bool> readFromDatabase() async {
    debugPrint("[Classes->FoodItem-> readFromDatabase()] Start");
    if (_id == null) {
      Map<String, dynamic> matchConditions = Map<String, dynamic>();
      
      matchConditions[_databaseHelper.colUserID] = userID;
    matchConditions[_databaseHelper.colFoodName] = foodName;
    matchConditions[_databaseHelper.colAmount] = amount;
    matchConditions[_databaseHelper.colTimestamp] = nutrient;
    matchConditions[_databaseHelper.colIngredient] = ingredient;
    matchConditions[_databaseHelper.ColAllergen] = allergen;

      
      debugPrint("[Classes->FoodItem-> readFromDatabase()] Retrieving data from database (using required variables)...");
      
      List<Map<String, dynamic>> matchingFoodItem = await _databaseHelper.getMatchingRows_WhereColumns( tableName: "FoodItemTable", conditions: matchConditions);

      if (matchingFoodItem.length == 1) 
      {
        debugPrint("[Classes->FoodItem-> readFromDatabase()] processing data...");
        readFromMap(matchingFoodItem[0]);
        

        return true;
      } 
      else if (matchingFoodItem.length > 1) 
      {
        debugPrint("[Classes->FoodItem-> readFromDatabase()] Error more than 1 FoodItem found but there should only be 1 or 0.");
        debugPrint("[Classes->FoodItem-> readFromDatabase()] End");
        return false;
      } 
      else 
      {
        debugPrint("[Classes->FoodItem-> readFromDatabase()] No matching FoodItems found!");
        debugPrint("[Classes->FoodItem-> readFromDatabase()] End");
        return false;
      }
    } else {
      debugPrint(
          "[Classes->FoodItem-> readFromDatabase()] Retrieving data from database (using id)...");
      List<Map<String, dynamic>> matchingFoodItem =
          await _databaseHelper.getMatchingRows(
              tableName: "FoodItemTable",
              column: _databaseHelper.colID,
              value: _id.toString());

      debugPrint("[Classes->FoodItem-> readFromDatabase()] processing data...");
      readFromMap(matchingFoodItem[0]);
      debugPrint("[Classes->FoodItem-> readFromDatabase()] End");
      return true;
    }
  }
  
  FoodItem.fromMap(Map<String, dynamic> map) {
    debugPrint("[Classes->FoodItem-> FoodItem.fromMap()] Start");

    _id = map["id"];
    
    userID = map["user_id"];
    foodName = map["FoodName"];
    amount = map["amount"];
    nutrient = map["nutrient"];
    ingredient = map["nutrient"];
    allergen = map["allergen"];
    
    
    
    

    debugPrint("[Classes->FoodItem-> FoodItem.fromMap()] End");
  }
  Future<void> readFromMap(Map<String, dynamic> map) async 
  {
    debugPrint("[Classes->FoodItem-> readFoodItemFromMap()] Start");

    _id = map["id"];
    userID = map["user_id"];
    foodName = map["FoodName"];
    amount = map["amount"];
    nutrient = map["nutrient"];
    ingredient = map["ingredient"];
    allergen = map["allergen"];
    

    debugPrint("[Classes->FoodItem-> readFoodItemFromMap()] End");
  }
  
  Future<FoodItem> fromMap(Map<String, dynamic> map) async {
    debugPrint("[Classes->FoodItem-> readFoodItemFromMap()] Start");

    FoodItem tempFoodItem = FoodItem.fromMap(map);

    
    debugPrint("[Classes->FoodItem-> readFoodItemFromMap()] End");
    return tempFoodItem;
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    if (_id != null) {
      map['id'] = _id;
    }
    map["user_id"] = this.userID;
    map["foodName"] = this.foodName;
    map["amount"] = this.amount;
    map["nutrient"] = this.nutrient;
    map["ingredient"] = this.ingredient;
    map["allergen"] = this.allergen;
     

    return map;
  }
  
  Future<int> update() async {
    debugPrint("[Classes->FoodItem-> update()] Start");
    int result = 0;

    debugPrint("[Classes->FoodItem-> update()] updating...");
    result = await _databaseHelper.update(tableName: "FoodItemTable", tableRow: this);
    //result = await _databaseHelper.update_fromMap(tableName: "FoodItemTable", values: toMap());
    debugPrint("[Classes->FoodItem-> update()] update result: $result");

    
    debugPrint("[Classes->FoodItem-> update()] end");
    return result;
  }

  Future<int> delete() async {
    int result = 0;

    return result;
  }


}

class ConsumedFood {
  ConsumedFood(
      {ID,
      required int UserID,
      required int FoodItemID,
      required double Amount,
      required DateTime Timestamp,
      required DateTime DateCreated,
      required DateTime DateModified,
      String? Note,
      }) {
    debugPrint("[Classes->ConsumedFood-> CONSTRUCTOR] Start");
    if (ID != null) {
      _id = ID;
    }
    userID = UserID;
    foodItemID = FoodItemID;
    amount = Amount;
    timestamp = Timestamp;
    dateCreated = DateCreated;
    dateModified = DateModified;
    note = Note;

    debugPrint("[Classes->ConsumedFood-> CONSTRUCTOR] End");
  }
 

  int? _id;
  late int userID;
  late int foodItemID;
  late double amount;
  late DateTime timestamp;
  late DateTime dateCreated;
  late DateTime dateModified;
  String? note;
  

  DatabaseHelper _databaseHelper = DatabaseHelper();


  int? get id => _id;



  Future<int> countMatching() async {
    debugPrint("[Classes->ConsumedFood->countMatching()] Entered");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    matchConditions[_databaseHelper.colUserID] = userID;
    matchConditions[_databaseHelper.colFoodItemID] = foodItemID;
    matchConditions[_databaseHelper.colAmount] = amount;
    matchConditions[_databaseHelper.colTimestamp] = timestamp;
    matchConditions[_databaseHelper.colDateCreated] = dateCreated;
    matchConditions[_databaseHelper.colDateModified] = dateModified;
    
    //A list of rows that matched the given criteria from the target table
    List<Map<String, dynamic>> matchingConsumedFoods =
        await _databaseHelper.getMatchingRows_WhereColumns(
            tableName: "ConsumedFoodTable", conditions: matchConditions);

    if (matchingConsumedFoods.length == 1) {
      debugPrint("[Classes->ConsumedFood->countMatching()] End");
      return 1;
    } else if (matchingConsumedFoods.length > 1) {
      debugPrint(
          "[Classes->ConsumedFood->countMatching()] Error more than 1 consumedFood found but there should only be 1 or 0.");
      debugPrint("[Classes->ConsumedFood->countMatching()] End");
      return matchingConsumedFoods.length;
    } else {
      debugPrint("[Classes->ConsumedFood->countMatching()] End");
      return 0;
    }
  }
  
  Future<void> readID() async {
    debugPrint("[Classes->ConsumedFood-> readID()] Start");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    matchConditions[_databaseHelper.colUserID] = userID;
    matchConditions[_databaseHelper.colFoodItemID] = foodItemID;
    matchConditions[_databaseHelper.colAmount] = amount;
    matchConditions[_databaseHelper.colTimestamp] = timestamp;
    matchConditions[_databaseHelper.colDateCreated] = dateCreated;
    matchConditions[_databaseHelper.colDateModified] = dateModified;

    List<String> outputColumns = [_databaseHelper.colID];

    debugPrint("[Classes->ConsumedFood-> readID()] retrieving data from database ...");
    //a list of matching rows except only the requested columns of each row are output.
    List<Map<String, dynamic>> output =
        await _databaseHelper.getMatchingColumns_WhereColumns(
            tableName: "ConsumedFoodTable",
            conditions: matchConditions,
            outputColumns: outputColumns);

    debugPrint("[Classes->ConsumedFood-> readID()] processing ...");
    if(output.length == 1)
    {
      _id = output[0][_databaseHelper.colID];
    }
    else
    {
      if(output.length == 0)
      {
        debugPrint("[Classes->ConsumedFood-> readID()] ERROR: No matching users found!");
      }
      else
      {
        debugPrint("[Classes->ConsumedFood-> readID()] ERROR: ${output.length} matching users found!");
      }
      
    }

    debugPrint("[Classes->ConsumedFood-> readID()] End");
  }
  
  

  

  


  Future<int> create() async {
    debugPrint("[Classes->ConsumedFood-> create()] Start");

    debugPrint("[Classes->ConsumedFood-> create()] inserting new consumedFood into database ...");
    int result = await _databaseHelper.insert(tableName: "ConsumedFoodTable", objectAsMap: toMap());
    debugPrint("[Classes->ConsumedFood-> create()] Insertion COMPLETE. result = ${result}");

    debugPrint("[Classes->ConsumedFood-> create()] End");
    return result;
  }

  Future<bool> readFromDatabase() async {
    debugPrint("[Classes->ConsumedFood-> readFromDatabase()] Start");
    if (_id == null) {
      Map<String, dynamic> matchConditions = Map<String, dynamic>();
      
      matchConditions[_databaseHelper.colUserID] = userID;
      matchConditions[_databaseHelper.colFoodItemID] = foodItemID;
      matchConditions[_databaseHelper.colAmount] = amount;
      matchConditions[_databaseHelper.colTimestamp] = timestamp;
      matchConditions[_databaseHelper.colDateCreated] = dateCreated;
      matchConditions[_databaseHelper.colDateModified] = dateModified;

      
      debugPrint("[Classes->ConsumedFood-> readFromDatabase()] Retrieving data from database (using required variables)...");
      
      List<Map<String, dynamic>> matchingConsumedFoods = await _databaseHelper.getMatchingRows_WhereColumns( tableName: "ConsumedFoodTable", conditions: matchConditions);

      if (matchingConsumedFoods.length == 1) 
      {
        debugPrint("[Classes->ConsumedFood-> readFromDatabase()] processing data...");
        readFromMap(matchingConsumedFoods[0]);
        

        return true;
      } 
      else if (matchingConsumedFoods.length > 1) 
      {
        debugPrint("[Classes->ConsumedFood-> readFromDatabase()] Error more than 1 consumedFood found but there should only be 1 or 0.");
        debugPrint("[Classes->ConsumedFood-> readFromDatabase()] End");
        return false;
      } 
      else 
      {
        debugPrint("[Classes->ConsumedFood-> readFromDatabase()] No matching consumedFoods found!");
        debugPrint("[Classes->ConsumedFood-> readFromDatabase()] End");
        return false;
      }
    } else {
      debugPrint(
          "[Classes->ConsumedFood-> readFromDatabase()] Retrieving data from database (using id)...");
      List<Map<String, dynamic>> matchingConsumedFoods =
          await _databaseHelper.getMatchingRows(
              tableName: "ConsumedFoodTable",
              column: _databaseHelper.colID,
              value: _id.toString());

      debugPrint("[Classes->ConsumedFood-> readFromDatabase()] processing data...");
      readFromMap(matchingConsumedFoods[0]);
      debugPrint("[Classes->ConsumedFood-> readFromDatabase()] End");
      return true;
    }
  }
  
  ConsumedFood.fromMap(Map<String, dynamic> map) {
    debugPrint("[Classes->ConsumedFood-> ConsumedFood.fromMap()] Start");

    _id = map["id"];
    
    userID = map["user_id"];
    if(map["food_item_id"] != null)
    {
      foodItemID = map["food_item_id"];
    }
    else
    {
      foodItemID = 0;
    }
    amount = map["amount"];
    timestamp = DateTime.parse(map["timestamp"]);
    dateCreated = DateTime.parse(map["date_created"]);
    dateModified = DateTime.parse(map["date_modified"]);
    note = map["note"];
    
    
    

    debugPrint("[Classes->ConsumedFood-> ConsumedFood.fromMap()] End");
  }
  Future<void> readFromMap(Map<String, dynamic> map) async 
  {
    debugPrint("[Classes->ConsumedFood-> readConsumedFoodFromMap()] Start");

    _id = map["id"];
    userID = map["user_id"];
    foodItemID = map["food_item_id"];
    amount = map["amount"];
    timestamp = DateTime.parse(map["timestamp"]);
    dateCreated = DateTime.parse(map["date_created"]);
    dateModified = DateTime.parse(map["date_modified"]);
    note = map["note"];
    

    debugPrint("[Classes->ConsumedFood-> readConsumedFoodFromMap()] End");
  }
  
  Future<ConsumedFood> fromMap(Map<String, dynamic> map) async {
    debugPrint("[Classes->ConsumedFood-> readConsumedFoodFromMap()] Start");

    ConsumedFood tempConsumedFood = ConsumedFood.fromMap(map);

    
    debugPrint("[Classes->ConsumedFood-> readConsumedFoodFromMap()] End");
    return tempConsumedFood;
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    if (_id != null) {
      map['id'] = _id;
    }
    map["user_id"] = this.userID;
    map["user_id"] = this.foodItemID;
    map["amount"] = this.amount;
    map["timestamp"] = timestamp.toString();
    map["date_created"] = dateCreated.toString();
    map["date_modified"] = dateModified.toString();
    map["note"] = note;
    

    return map;
  }
  
  Future<int> update() async {
    debugPrint("[Classes->ConsumedFood-> update()] Start");
    int result = 0;

    debugPrint("[Classes->ConsumedFood-> update()] updating...");
    result = await _databaseHelper.update(tableName: "ConsumedFoodTable", tableRow: this);
    //result = await _databaseHelper.update_fromMap(tableName: "ConsumedFoodTable", values: toMap());
    debugPrint("[Classes->ConsumedFood-> update()] update result: $result");

    
    debugPrint("[Classes->ConsumedFood-> update()] end");
    return result;
  }

  Future<int> delete() async {
    int result = 0;

    return result;
  }

}