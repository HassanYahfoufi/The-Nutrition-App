import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:nutrition_app/models.dart';

//import 'package:goals_analyzer/classes.dart';

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;
  //String accountTable = "account_table"; String colDate = "date"; String colPriority = "priority";
  //static Map<String, Database> _databases = Map<String, Database>();
  Map<String, TableInfo> table = Map<String, TableInfo>();

  //-------------------------------------

  String colID = "id";
  String col = "";
  String colUsername = "username";
  String colPassword = "password";
  String colName = "name";
  String colDescription = "description";
  String colTitle = "title";
  String colBody = "body";
  String colSummary = "summary";
  String colDateCreated = "date_created";
 
  //-------------------------------------
  //-----------Status Update--------------
  String colUserID = "user_id";
  //String colTitle = "title";

  String colTimestamp = "timestamp";
  //String colDateCreated = "dateCreated";
  String colDateModified = "date_modified";
  
  String colNote = "note";
  String colFoodItemID = "food_item_id";
  String colAmount = "amount";
  //-------------------------------------
 
  String colFoodName = "foodName";
  String colIngredient = "ingredient";
  String ColAllergen = "allergen";
  
  //--------------- DELETE ---------------
  
  String colRequired_Var01 = "required_var01";
  String colRequired_Var02 = "required_var02";

  String colRequired_Conversion_Var01 = "required_conversion_var01";
  String colRequired_Conversion_Var02 = "required_conversion_var02";

  String colOptional_Var01 = "optional_var01";
  String colOptional_Var02 = "optional_var02";
  String colOptional_Var03 = "optional_var03";
  String colOptional_Var04 = "optional_var04";

  String colOptional_Conversion_Var01 = "optional_conversion_var01";
  String colOptional_Conversion_Var02 = "optional_conversion_var02";
  String colOptional_Conversion_Var03 = "optional_conversion_var03";
  String colOptional_Conversion_Var04 = "optional_conversion_var04";

  String colnonDB_Var01 = "nonDB_var01";
  String colnonDB_Var02 = "nonDB_var02";
  //--------------- DELETE ---------------
  DatabaseHelper._createInstance();

  void printTableVarKeys() {
    debugPrint("[DatabaseHelper -> printTableVarKeys()] Start");
    for (String key in table.keys) {
      debugPrint("[DatabaseHelper -> printTableVarKeys()] key: $key");
    }
    debugPrint("[DatabaseHelper -> printTableVarKeys()] End");
  }

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
      //_databaseHelper!.initializeStandardTables();
    }
    return _databaseHelper!;
  }

  Future<Database?> getDatabase() async {
    debugPrint("[DatabaseHelper -> getDatabase()] Start");

    if (_database == null) {
      _database = await initializeDatabase();
    } else if (1 == 0) {
      Directory directory = await getApplicationDocumentsDirectory();
      debugPrint("[DatabaseHelper -> getDatabase()] path: ${directory.path}");
    }

    debugPrint("[DatabaseHelper -> getDatabase()] End");

    return _database;
  }

  Future<Database> initializeDatabase() async {
    debugPrint("[DatabaseHelper -> initializeDatabase()] Start");

    debugPrint(
        "[DatabaseHelper -> initializeDatabase()] excecuting: Directory directory = await getApplicationDocumentsDirectory();...");
    Directory directory = await getApplicationDocumentsDirectory();

    debugPrint("     [initializeDatabase()] before: path");
    String path = directory.path + "/NutritionApp.db";
    debugPrint("     [initializeDatabase()] path: $path");

    debugPrint("     [initializeDatabase()] before: ... openDatabase(...");
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        debugPrint("\tCalling _createDb... ~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        _createDb(db, version);
      },
    );

    debugPrint("[DatabaseHelper -> initializeDatabase()] End");
    return database;
  }

  /*
  void _createDb(Database db, int newVersion, String tableName) async
  {
    debugPrint("[DatabaseHelper -> _createDb(..., $tableName)] Start");
    if(table[tableName] != null)
    {
      table[tableName]!.updateInfo();
      String sqlCommand = table[tableName]!.sqlInfo;
      debugPrint("db.execute($sqlCommand)");

      await db.execute(sqlCommand);

      //await db.execute("CREATE TABLE $tableType($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)");
      debugPrint("$tableName table created!WWWWWWWWWWWWWWWWWWWWWWWWWWW");
    }
    else
    {
      debugPrint("$tableName table NOT created!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
    debugPrint("[DatabaseHelper -> _createDb(..., $tableName)] End");
  }
  */

  void _createDb(Database db, int newVersion) async {
    debugPrint("[DatabaseHelper -> _createDb()] Start");
    //debugPrint("[DatabaseHelper -> _createDb()] (Test) creating ${table[tableInfoName["Account"]]!.type}...");
    //await createTable(db, tableInfoName["Account"]!);
    for (TableInfo itTable in table.values) {
      debugPrint("[DatabaseHelper -> _createDb()] creating ${itTable.type}...");
      debugPrint("\t${itTable.name}");
      await createTable(db, itTable.name);
    }
    debugPrint("[DatabaseHelper -> _createDb()] End");
  }

  Future<void> createTable(Database db, String tableName,
      {int tabs = 0}) async {
    String space = "";
    for (int i = 1; i <= tabs;) {
      space = space + "\t";
    }

    debugPrint("$space[DatabaseHelper -> createTable($tableName)] Start");
    if (table[tableName] != null) {
      debugPrint(
          "$space[DatabaseHelper -> createTable($tableName)] checkpoint 1");
      table[tableName]!.updateInfo();
      debugPrint(
          "$space[DatabaseHelper -> createTable($tableName)] checkpoint 2");
      String sqlCommand = table[tableName]!.sqlInfo;
      debugPrint(
          "$space[DatabaseHelper -> createTable($tableName)] db.execute($sqlCommand)...");

      await db.execute(sqlCommand);

      //await db.execute("CREATE TABLE $tableType($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)");
      debugPrint(
          "$space[DatabaseHelper -> createTable($tableName)] $tableName table created!WWWWWWWWWWWWWWWWWWWWWWWWWWW");
    } else {
      debugPrint(
          "$space[DatabaseHelper -> createTable($tableName)] $tableName table NOT created!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
    debugPrint("$space[DatabaseHelper -> createTable($tableName)] End");
  }

  Future<int> insert(
      {required String tableName,
      required Map<String, dynamic> objectAsMap,
      int? recursiveIterationCount}) async {
    String space = "";
    if (recursiveIterationCount != null) {
      space = "-";
    }
    debugPrint("$space[DatabaseHelper -> insert()] Start");

    if (table[tableName] == null) {
      debugPrint("[DatabaseHelper -> insert()] table[$tableName] == null");
      return 0;
    }
    String tableType =
        table[tableName]!.type; //String tableType = tableTypes[tableName]!;
    debugPrint("$space[DatabaseHelper -> insert()] After getting tableType");
    //Database? db = getDatabase();
    Database? db = await getDatabase();
    debugPrint(
        "$space[DatabaseHelper -> insert()] After getting the $tableName database");
    int result = 0;

    debugPrint("$space[DatabaseHelper -> insert()] Adding to $tableName.....");
    result = await db!
        .insert(tableType, objectAsMap); //!!!!!!! replace with raw query
    if (result != 0) {
      debugPrint(
          "$space[DatabaseHelper -> insert()]  added successfully!!!!!!!!!!!!!!!!!!!");
    } else {
      debugPrint(
          "$space[DatabaseHelper -> insert()] Failed!  couldn't be added XXXXXXXXXX");
    }

    debugPrint("$space[DatabaseHelper -> insert()] End");
    return result;
  }

  Future<int> databaseCount() async {
    debugPrint("[DatabaseHelper-> databaseCount()] Start");
    List<String> names = await getTableNames();
    int count = names.length;
    if (names.contains("android_metadata")) //!!!!!!!!!!!!!
    {
      count--;
    } //!!!!!!!!!!!!!!!!
    debugPrint("Current number of databases: $count");
    debugPrint("[DatabaseHelper-> databaseCount()] End");
    return count;
  }

  Future<List<String>> getTableNames() async {
    debugPrint("[DatabaseHelper -> getTableNames()] Start");
    Database? db = await getDatabase();

    debugPrint("[DatabaseHelper -> getTableNames()] getting table names...");
    List<Map<String, dynamic>> result = await db!.rawQuery(
        "SELECT name FROM sqlite_master WHERE type ='table' AND name NOT LIKE 'sqlite_%'");
    List<String> names = [];
    int index = 0;

    //loop through every key in result
    for (Map<String, dynamic> item in result) {
      index++;
      debugPrint("item $index:");

      for (String key in item.keys) {
        debugPrint(
            "\tkey: $key\tvalue: ${item[key]}\ttype:${item[key].runtimeType}");
        //if the key is "name" and the value is a String add it to the list of names
        /*if(key == "name" && item[key].runtimeType == String)
        {
          names.add(item["name"]);
        }*/
      }
      //if the value isn't already in the list of names add it
      if (names.contains(item["name"]) == false) {
        names.add(item["name"]);
      }
    }
    debugPrint("[DatabaseHelper -> getTableNames()] End");
    return names;
  }

  Future<int?> getCount({required String tableName}) async {
    debugPrint("[DatabaseHelper -> getCount($tableName)] Start");
    //String tableType = tableTypes[tableName]!;
    debugPrint(
        "[DatabaseHelper -> getCount($tableName)] excecuting: String tableType = table[tableName]!.type;...");
    if (table.isEmpty) {
      debugPrint("[DatabaseHelper -> getCount($tableName)] table is empty");
      return -1;
    }

    String tableType = table[tableName]!.type;
    debugPrint(
        "[DatabaseHelper -> getCount($tableName)] String tableType = table[tableName]!.type; COMPLETE");
    Database? db = await getDatabase();
    debugPrint(
        "[DatabaseHelper -> getCount($tableName)] excecuting: List<Map<String, dynamic>> x = await db!.rawQuery(\"SELECT COUNT (*) from $tableType\");...");
    List<Map<String, dynamic>> x =
        await db!.rawQuery("SELECT COUNT (*) from $tableType");
    debugPrint(
        "[DatabaseHelper -> getCount($tableName)] excecuting: int? result = Sqflite.firstIntValue(x);...");
    int? result = Sqflite.firstIntValue(x);

    debugPrint("[DatabaseHelper -> getCount($tableName)] End");

    return result;
  }

  Future<bool> doesExist(
      {required String tableName,
      required String column,
      required String value}) async {
    debugPrint(
        "[DatabaseHelper -> doesExist($tableName, $column, $value)] Start");

    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    //var result = await db!.rawQuery("SELECT $colID FROM $tableType WHERE $column = $value");
    var result = await db!
        .rawQuery("SELECT $colID FROM $tableType WHERE $column=?", [value]);
    bool valueExists = result.isNotEmpty;
    debugPrint(
        "[DatabaseHelper -> doesExist($tableName, $column, $value)] End");
    return valueExists;
  }

  Future<List<Map<String, dynamic>>> getMatchingRows(
      {required String tableName,
      required String column,
      required String value}) async {
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    //List<Map<String, dynamic>> result = await db!.rawQuery("SELECT * FROM $tableType WHERE $column = $value");
    List<Map<String, dynamic>> result =
        await db!.rawQuery("SELECT * FROM $tableType WHERE $column=?", [value]);
    return result;
  }

  Future<List<Map<String, dynamic>>> getMatchingRows_WhereColumnInValues(
      {required String tableName,
      required String column,
      required List<String> values}) async {
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();

    String listSQL;
    listSQL = "(${values.elementAt(0)}";
    debugPrint(
        "[DatabaseHelper -> getMatchingRowsWhereColumnInValues()] listSQL: $listSQL");
    for (int i = 1; i < values.length; i++) {
      listSQL = "$listSQL, ${values.elementAt(i)}";
    }
    debugPrint(
        "[DatabaseHelper -> getMatchingRowsWhereColumnInValues()] listSQL: $listSQL");
    listSQL = "$listSQL)";
    debugPrint(
        "[DatabaseHelper -> getMatchingRowsWhereColumnInValues()] listSQL: $listSQL");
    debugPrint(
        "[DatabaseHelper -> getMatchingRowsWhereColumnInValues()] SELECT * FROM $tableType WHERE $column IN ${values.toString()}...");
    List<Map<String, dynamic>> result = await db!
        .rawQuery("SELECT * FROM $tableType WHERE $column IN $listSQL");
    return result;
  }

  Future<List<Map<String, dynamic>>> getMatchingRows_WhereColumns(
      {required String tableName,
      required Map<String, dynamic> conditions}) async {
    debugPrint("[DatabaseHelper -> getMatchingRows_WhereColumns()] Start");
    String connditionSQL = "";
    conditions.forEach((key, value) {
      if (value != null) {
        connditionSQL = "$connditionSQL AND $key = '${value.toString()}'";
      } else {
        connditionSQL = "$connditionSQL AND $key ISNULL";
      }
    });
    if (connditionSQL.startsWith(" AND ")) {
      debugPrint("\tconnditionSQL(before): $connditionSQL");
      connditionSQL = connditionSQL.substring(5);
      debugPrint("\tconnditionSQL(after): $connditionSQL");
    }
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    //List<Map<String, dynamic>> result = await db!.rawQuery("SELECT * FROM $tableType WHERE $column = $value");
    debugPrint(
        "[DatabaseHelper -> getMatchingRows_WhereColumns()] SELECT * FROM $tableType WHERE $connditionSQL...");
    List<Map<String, dynamic>> result =
        await db!.rawQuery("SELECT * FROM $tableType WHERE $connditionSQL");
    debugPrint("[DatabaseHelper -> getMatchingRows_WhereColumns()] End");
    return result;
  }

  Future<List<Map<String, dynamic>>> getMatchingColumns(
      {required String tableName,
      required String column,
      required String value,
      required List<String> outputColumns}) async {
    debugPrint("[DatabaseHelper -> getMatchingColumns()] Start");
    String outputColumnsSQL = "";

    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    outputColumnsSQL = "${outputColumns[0]}";
    for (int i = 1; i < outputColumns.length; i++) {
      outputColumnsSQL = ", ${outputColumns[i]}";
    } //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    //List<Map<String, dynamic>> result = await db!.rawQuery("SELECT * FROM $tableType WHERE $column = $value");
    debugPrint(
        '[DatabaseHelper -> getMatchingColumns()] SELECT $outputColumnsSQL FROM $tableType WHERE $column=?", [value]...');
    List<Map<String, dynamic>> result = await db!.rawQuery(
        "SELECT $outputColumnsSQL FROM $tableType WHERE $column=?", [value]);
    debugPrint("[DatabaseHelper -> getMatchingColumns()] End");
    return result;
  }

  Future<List<Map<String, dynamic>>> getMatchingColumns_WhereColumns(
      {required String tableName,
      required Map<String, dynamic> conditions,
      required List<String> outputColumns}) async {
    debugPrint(
        "[DatabaseHelper -> getMatchingColumns_WhereColumns()] Start"); //!!!!!!!!!!!!!!!!!!!!!!!
    String connditionSQL = "";
    //List<String> conditionsList = conditions.forEach((key, value) {return key;});
    conditions.forEach((key, value) {
      connditionSQL = "$connditionSQL AND $key = ${value.toString()}";
    });
    if (connditionSQL.startsWith(" AND ")) {
      debugPrint("\tconnditionSQL(before): $connditionSQL");
      //debugPrint("substring: ${connditionSQL.substring(5)}");
      connditionSQL = connditionSQL.substring(5);

      debugPrint("\tconnditionSQL(after): $connditionSQL");
    } else {
      debugPrint(
          "[DatabaseHelper -> getMatchingColumns_WhereColumns()] ERROR!");
    }
    String outputColumnsSQL = "";

    outputColumnsSQL = "${outputColumns[0]}";
    for (int i = 1; i < outputColumns.length; i++) {
      outputColumnsSQL = ", ${outputColumns[i]}";
    }
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    //List<Map<String, dynamic>> result = await db!.rawQuery("SELECT * FROM $tableType WHERE $column = $value");
    debugPrint(
        "[DatabaseHelper -> getMatchingColumns_WhereColumns()] SELECT $outputColumnsSQL FROM $tableType WHERE $connditionSQL...");
    List<Map<String, dynamic>> result = await db!.rawQuery(
        "SELECT $outputColumnsSQL FROM $tableType WHERE $connditionSQL");
    debugPrint("[DatabaseHelper -> getMatchingColumns_WhereColumns()] End");
    return result;
  }

  Future<List<Map<String, dynamic>>> getMatchingRows_FromM2M(
      {required String tableName,
      required String column,
      required List<String> values}) async {
    debugPrint("[DatabaseHelper -> getMatchingRows_FromM2M()] Start");
    if (values.isEmpty) {
      debugPrint("[DatabaseHelper -> getMapList()] End");
      return [];
    }
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    debugPrint(
        "[DatabaseHelper -> getMatchingRows_FromM2M()] Database retrieved");
    String listSQL;
    listSQL = "(${values.elementAt(0)}";
    debugPrint(
        "[DatabaseHelper -> getMatchingRows_FromM2M()] listSQL: $listSQL");
    for (int i = 1; i < values.length; i++) {
      listSQL = "$listSQL, ${values.elementAt(i)}";
    }
    debugPrint(
        "[DatabaseHelper -> getMatchingRows_FromM2M()] listSQL: $listSQL");
    listSQL = "$listSQL)";
    debugPrint(
        "[DatabaseHelper -> getMatchingRows_FromM2M()] listSQL: $listSQL");
    //List<Map<String, dynamic>> result = await db!.rawQuery("SELECT * FROM $tableType WHERE $column = $value");
    debugPrint(
        "[DatabaseHelper -> getMatchingRows_FromM2M()] SELECT * FROM $tableType WHERE $column IN ${values.toString()}...");
    List<Map<String, dynamic>> result = await db!
        .rawQuery("SELECT * FROM $tableType WHERE $column IN $listSQL");
    debugPrint("[DatabaseHelper -> getMatchingRows_FromM2M()] End");
    return result;
  }

  //Change from account to User
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<List<Map<String, dynamic>>> getRowsFromAccount_WhereColumns(
      {required String tableName,
      required String column,
      required int accountID,
      required String tableName_M2M,
      required String column_M2M}) async {
    //get list of ids account_id = widget.account.id
    Map<String, int> condition = <String, int>{};
    condition["account_id"] = accountID;
    debugPrint(
        "[Database Helper -> getRowsFromAccount_WhereColumns()] Getting object ids...");
    List<Map<String, dynamic>> objectIDsFromDatabase =
        await getMatchingColumns_WhereColumns(
            tableName: tableName_M2M,
            conditions: condition,
            outputColumns: [column_M2M]);
    List<String> objectIDs = objectIDsFromDatabase
        .map((objectFromDatabase) => objectFromDatabase[column_M2M].toString())
        .toList();
    debugPrint("$column_M2M: ${objectIDs.toString()}");

    debugPrint(
        "[Database Helper -> getRowsFromAccount_WhereColumns()] Getting catagories from database...");
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();

    List<String> values = objectIDs;

    String listSQL;
    listSQL = "(${values.elementAt(0)}";
    debugPrint(
        "[DatabaseHelper -> getRowsFromAccount_WhereColumns()] listSQL: $listSQL");
    for (int i = 1; i < values.length; i++) {
      listSQL = "$listSQL, ${values.elementAt(i)}";
    }
    debugPrint(
        "[DatabaseHelper -> getRowsFromAccount_WhereColumns()] listSQL: $listSQL");
    listSQL = "$listSQL)";
    debugPrint(
        "[DatabaseHelper -> getRowsFromAccount_WhereColumns()] listSQL: $listSQL");
    debugPrint(
        "[DatabaseHelper -> getRowsFromAccount_WhereColumns()] SELECT * FROM $tableType WHERE $column IN ${values.toString()}...");
    List<Map<String, dynamic>> result = await db!
        .rawQuery("SELECT * FROM $tableType WHERE $column IN $listSQL");

    debugPrint("[Database Helper -> getRowsFromAccount_WhereColumns()] End");
    return result;
  }

  Future<List<Map<String, dynamic>>> getColumnsFromAccount_WhereColumns(
      {required String tableName,
      required Map<String, dynamic> conditions,
      required List<String> outputColumns}) async {
    debugPrint(
        "[DatabaseHelper -> getMatchingColumns_WhereColumns()] Start"); //!!!!!!!!!!!!!!!!!!!!!!!
    String connditionSQL = "";
    //List<String> conditionsList = conditions.forEach((key, value) {return key;});
    conditions.forEach((key, value) {
      connditionSQL = "$connditionSQL AND $key = ${value.toString()}";
    });
    if (connditionSQL.startsWith(" AND ")) {
      debugPrint("\tconnditionSQL(before): $connditionSQL");
      //debugPrint("substring: ${connditionSQL.substring(5)}");
      connditionSQL = connditionSQL.substring(5);

      debugPrint("\tconnditionSQL(after): $connditionSQL");
    } else {
      debugPrint(
          "[DatabaseHelper -> getMatchingColumns_WhereColumns()] ERROR!");
    }
    String outputColumnsSQL = "";

    outputColumnsSQL = "${outputColumns[0]}";
    for (int i = 1; i < outputColumns.length; i++) {
      outputColumnsSQL = ", ${outputColumns[i]}";
    }
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    //List<Map<String, dynamic>> result = await db!.rawQuery("SELECT * FROM $tableType WHERE $column = $value");
    debugPrint(
        "[DatabaseHelper -> getMatchingColumns_WhereColumns()] SELECT $outputColumnsSQL FROM $tableType WHERE $connditionSQL...");
    List<Map<String, dynamic>> result = await db!.rawQuery(
        "SELECT $outputColumnsSQL FROM $tableType WHERE $connditionSQL");
    debugPrint("[DatabaseHelper -> getMatchingColumns_WhereColumns()] End");
    return result;
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  Future<List<Map<String, dynamic>>> getMapList(
      {required String tableName, String orderByCol = ""}) async {
    debugPrint("[DatabaseHelper -> getMapList()] Start");
    //String tableType = tableTypes[tableName]!;
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    String SqlCommand_orderBy = "";
    if (orderByCol != "") {
      SqlCommand_orderBy = " order by $orderByCol ASC";
    }
    debugPrint("[DatabaseHelper -> getMapList()] getting list ...");
    var result =
        await db!.rawQuery("SELECT * FROM $tableType$SqlCommand_orderBy");

    debugPrint("[DatabaseHelper -> getMapList()] End");
    return result;
  }

  Future<List<dynamic>> getEntireTable(
      {required String tableName, required Function maptoObject}) async {
    //int size = await getCount(tableName: tableName) as int;
    debugPrint(
        "[DatabaseHelper -> getEntireTable(...)] Start\n\tGetting list ...");
    debugPrint(
        "[DatabaseHelper -> getEntireTable(...)] before Database? db = await getDatabase()");
    Database? db = await getDatabase();
    debugPrint(
        "[DatabaseHelper -> getEntireTable(...)] before ...mapList = await getMapList...");
    List<Map<String, dynamic>> mapList = await getMapList(
        tableName: tableName); // as List<Map<String, dynamic>>;
    debugPrint("[DatabaseHelper -> getEntireTable(...)] converting...");
    List<dynamic> table = <dynamic>[];
    for (int i = 0; i < mapList.length; i++) {
      table.add(maptoObject(mapList[i]));
    }

    debugPrint("[DatabaseHelper -> getEntireTable(...)] End");
    return table;
  }

  Future<List<Map<String, dynamic>>> getEntireTable_asMap(
      {required String tableName}) async {
    //int size = await getCount(tableName: tableName) as int;
    debugPrint(
        "[DatabaseHelper -> getEntireTable(...)] Start\n\tGetting list ...");
    debugPrint(
        "[DatabaseHelper -> getEntireTable(...)] before Database? db = await getDatabase()");
    Database? db = await getDatabase();
    debugPrint(
        "[DatabaseHelper -> getEntireTable(...)] before ...mapList = await getMapList...");
    List<Map<String, dynamic>> mapList = await getMapList(
        tableName: tableName); // as List<Map<String, dynamic>>;

    debugPrint("[DatabaseHelper -> getEntireTable(...)] End");
    return mapList;
  }

  Future<int> update(
      {required String tableName, required dynamic tableRow}) async {
    //String tableType = tableTypes[tableName]!;
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    var result = await db!.update(tableType, tableRow.toMap(),
        where: "$colID = ?", whereArgs: [tableRow.id]);

    return result;
  }
  Future<int> update_fromMap(
      {required String tableName, required Map<String, Object?> values}) async {
    //String tableType = tableTypes[tableName]!;
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    var result = await db!.update(tableType, values,
        where: "$colID = ?", whereArgs: [values[colID]]);

    return result;
  }

  Future<int> delete({required String tableName, required int id}) async {
    //String tableType = tableTypes[tableName]!;
    String tableType = table[tableName]!.type;
    Database? db = await getDatabase();
    //var result = await db!.rawDelete("DELETE FROM $tableType WHERE $colID = $id")
    var result =
        await db!.rawDelete("DELETE FROM $tableType WHERE $colID=?", [id]);

    return result;
  }

  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<void> deleteTable(String tableName) async {
    debugPrint("[DatabaseHelper -> deleteTable()] Start");
    String tableType;

    debugPrint(
        "[DatabaseHelper -> deleteTable()] calculating present count of databases...");
    final int originalCount = await databaseCount();
    int currentCount;

    debugPrint(
        "[DatabaseHelper -> deleteTable()] getting the Application Documents Directory...");
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "/$tableName.db";

    debugPrint("[DatabaseHelper -> deleteTable()] Checking files");
    List<FileSystemEntity> files = directory.listSync();
    bool exists = false;
    for (FileSystemEntity file in files) {
      if (file.path == path) {
        exists = true;
        debugPrint("[DatabaseHelper -> deleteTable()] The file exists");
      }
    }
    if (!exists) {
      debugPrint(
          "[DatabaseHelper -> deleteTable()] The file does not exist in the directory!!!");
    }

    /*if(exists/*_databases[tableName] != null*/)
    {*/

    if (table[tableName] != null) {
      debugPrint("[DatabaseHelper -> deleteTable()] getting database...");
      Database? db = await getDatabase();

      debugPrint("[DatabaseHelper -> deleteTable()] getting table type...");

      tableType = table[tableName]!.type;
      debugPrint("[DatabaseHelper -> deleteTable()] deleting table...");
      await db!.execute("DROP TABLE IF EXISTS $tableType");
      //Why does this not work???????????????????????????????????????????????????????

      currentCount = await databaseCount();

      if ((originalCount - currentCount) == 1) {
        debugPrint(
            "[DatabaseHelper -> deleteTable()] Removing other table/database info");
        table.remove(tableName);
      } else {
        debugPrint(
            "[DatabaseHelper -> deleteTable()] Delete operation (DROP TABLE IF EXISTS $tableType) was called but failed!!!!!!!!!!");
        debugPrint("db.path: ${db.path}");

        debugPrint(
            "[DatabaseHelper -> deleteTable()] Trying again with another method...");
        await databaseFactory.deleteDatabase(db.path);
        currentCount = await databaseCount();

        if ((originalCount - currentCount) == 1) {
          debugPrint(
              "[DatabaseHelper -> deleteTable()] Removing other table/database info");
          table.remove(tableName);
        }
      }
    } else {
      debugPrint(
          "[DatabaseHelper -> deleteTable()] Delete failed! table[$tableName] = null");

      debugPrint(
          "-----------------------------------------------------------------");
      debugPrint("table keys:");
      for (String key in table.keys) {
        debugPrint("\t$key");
        if (table[key] == null) {
          debugPrint("\t\tNULL!!!!!");
        }
      }
      debugPrint(
          "-----------------------------------------------------------------");
    }
    /*}
    else
    {
      
      debugPrint("[DatabaseHelper -> deleteTable()] Apparently $tableName database is empty. Please check directory to verify.");
      //try to delete from goals table
    }
    debugPrint("[DatabaseHelper -> deleteTable()] End");*/
  }

  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
