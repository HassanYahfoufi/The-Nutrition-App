import "package:flutter/material.dart";
import "package:nutrition_app/database_helper.dart";

import 'package:nutrition_app/models.dart'; 

/*
  Blank With Space = 
  Blank = 
  blank = 

  

  
  required_var01 = 
  requiredVar01_DataType = 
  Required_Var01 = 
  required_var_underscore01 = 
  Required Variable With Space #01 = 

  required_var02 = 
  requiredVar02_DataType = 
  Required_Var02 = 
  required_var_underscore02 = 
  Required Variable With Space #02 = 

  required_var03 = 
  requiredVar03_DataType = 
  Required_Var03 = 
  required_var_underscore03 = 
  Required Variable With Space #03 = 

  required_var04 = 
  requiredVar04_DataType = 
  Required_Var04 = 
  required_var_underscore04 = 
  Required Variable With Space #04 = 

  required_conversion_var01 = 
  required_conversionVar01_DataType = 
  Required_Conversion_Var01 = 
  required_conversion_var_underscore01 = 
  Required Conversion Variable With Space #01 = 


  optional_var01 = 
  optionalVar01_DataType = 
  Optional_Var01 = 
  optional_var_underscore01 = 
  Optional Variable With Space #01 = 

  optional_conversion_var01 = 
  optional_conversionVar01_DataType = 
  Optional_Conversion_Var01 = 
  optional_conversion_var_underscore01 = 
  Optional Conversion Variable With Space #01 = 


  nonDB_var01 = 
  nonDBVar01_DataType = 
  NonDB_Var01 = 

  m2o_var01 = 
  m2oVar01_DataType = 
  M2O_Var01 = 

  m2m_var01 = 
  m2mVar01_DataType = 
  M2M_Var01 = 
  
*/



class Blank {
  Blank(
      {ID,
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*//*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      required requiredVar01_DataType Required_Var01,
      required requiredVar02_DataType Required_Var02,
      required requiredVar03_DataType Required_Var03,
      required requiredVar04_DataType Required_Var04,
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      required required_conversionVar01_DataType Required_Conversion_Var01,
      required required_conversionVar02_DataType Required_Conversion_Var02,
      required required_conversionVar03_DataType Required_Conversion_Var03,
      required required_conversionVar04_DataType Required_Conversion_Var04,
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      optionalVar01_DataType? Optional_Var01,
      optionalVar02_DataType? Optional_Var02,
      optionalVar03_DataType? Optional_Var03,
      optionalVar04_DataType? Optional_Var04,
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      optional_conversionVar01_DataType? Optional_Conversion_Var01,
      optional_conversionVar02_DataType? Optional_Conversion_Var02,
      optional_conversionVar03_DataType? Optional_Conversion_Var03,
      optional_conversionVar04_DataType? Optional_Conversion_Var04,
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      nonDBVar01_DataType? NonDB_Var01,
      nonDBVar02_DataType? NonDB_Var02,
      nonDBVar03_DataType? NonDB_Var03,
      nonDBVar04_DataType? NonDB_Var04,
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*//*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      }) {
    debugPrint("[Classes->Blank-> CONSTRUCTOR] Start");
    if (ID != null) {
      _id = ID;
    }
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*//*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    required_var01 = Required_Var01;
    required_var02 = Required_Var02;
    required_var03 = Required_Var03;
    required_var04 = Required_Var04;
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    required_conversion_var01 = Required_Conversion_Var01;
    required_conversion_var02 = Required_Conversion_Var02;
    required_conversion_var03 = Required_Conversion_Var03;
    required_conversion_var04 = Required_Conversion_Var04;/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    optional_var01 = Optional_Var01;
    optional_var02 = Optional_Var02;
    optional_var03 = Optional_Var03;
    optional_var04 = Optional_Var04;
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    optional_conversion_var01 = Optional_Conversion_Var01;
    optional_conversion_var02 = Optional_Conversion_Var02;
    optional_conversion_var03 = Optional_Conversion_Var03;
    optional_conversion_var04 = Optional_Conversion_Var04;
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    _nonDB_var01 = NonDB_Var01;
    _nonDB_var02 = NonDB_Var02;
    _nonDB_var03 = NonDB_Var03;
    _nonDB_var04 = NonDB_Var04;
    
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
    /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*//*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/

    debugPrint("[Classes->Blank-> CONSTRUCTOR] End");
  }
 

  int? _id;

  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  late requiredVar01_DataType required_var01;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  late requiredVar02_DataType required_var02;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  late requiredVar03_DataType required_var03;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  late requiredVar04_DataType required_var04;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  late required_conversionVar01_DataType required_conversion_var01;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  late required_conversionVar02_DataType required_conversion_var02;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  late required_conversionVar03_DataType required_conversion_var03;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  late required_conversionVar04_DataType required_conversion_var04;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  optionalVar01_DataType? optional_var01;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  optionalVar02_DataType? optional_var02;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  optionalVar03_DataType? optional_var03;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  optionalVar04_DataType? optional_var04;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  optional_conversionVar01_DataType? optional_conversion_var01;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  optional_conversionVar02_DataType? optional_conversion_var02;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  optional_conversionVar03_DataType? optional_conversion_var03;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  optional_conversionVar04_DataType? optional_conversion_var04;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  nonDBVar01_DataType? _nonDB_var01;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  nonDBVar02_DataType? _nonDB_var02;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  nonDBVar03_DataType? _nonDB_var03;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  nonDBVar04_DataType? _nonDB_var04;
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  List<m2oVar01_DataType> _m2o_var01s = <m2oVar01_DataType>[];
  List<m2oVar01_DataType> newM2O_Var01s = <m2oVar01_DataType>[];
  List<m2oVar01_DataType> updatedM2O_Var01s = <m2oVar01_DataType>[];
  List<m2oVar01_DataType> deleteM2O_Var01s = <m2oVar01_DataType>[];
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  List<m2oVar02_DataType> _m2o_var02 = <m2oVar02_DataType>[];
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  List<int> _m2m_var01IDs = [];//add getter function for array and single item
  List<m2mVar01_DataType> _m2m_var01s = <m2mVar01_DataType>[];
  List<m2mVar01_DataType> newM2M_Var01s = <m2mVar01_DataType>[];
  List<m2mVar01_DataType> updatedM2M_Var01s = <m2mVar01_DataType>[];
  List<m2mVar01_DataType> deleteM2M_Var01s = <m2mVar01_DataType>[];
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!
  List<int> _m2m_var02IDs = [];//add getter function for array and single item
  List<m2mVar02_DataType> m2m_var02s = <m2mVar02_DataType>[];
  //!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  

  DatabaseHelper _databaseHelper = DatabaseHelper();


  int? get id => _id;
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  nonDBVar01_DataType? get nonDB_var01 => _nonDB_var01;
  nonDBVar02_DataType? get nonDB_var02 => _nonDB_var02;
  nonDBVar03_DataType? get nonDB_var03 => _nonDB_var03;
  nonDBVar04_DataType? get nonDB_var04 => _nonDB_var04;
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!



  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<int> countMatching() async {
    debugPrint("[Classes->Blank->countMatching()] Entered");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!
    matchConditions[_databaseHelper.colRequired_Var01] = required_var01;
    matchConditions[_databaseHelper.colRequired_Var02] = required_var02;
    matchConditions[_databaseHelper.colRequired_Var03] = required_var03;
    matchConditions[_databaseHelper.colRequired_Var04] = required_var04;
    //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!
    matchConditions[_databaseHelper.colRequired_Conversion_Var01] = required_conversion_var01;
    matchConditions[_databaseHelper.colRequired_Conversion_Var02] = required_conversion_var02;
    matchConditions[_databaseHelper.colRequired_Conversion_Var03] = required_conversion_var03;
    matchConditions[_databaseHelper.colRequired_Conversion_Var04] = required_conversion_var04;
    //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!

    //A list of rows that matched the given criteria from the target table
    List<Map<String, dynamic>> matchingBlanks =
        await _databaseHelper.getMatchingRows_WhereColumns(
            tableName: "BlankTable", conditions: matchConditions);

    if (matchingBlanks.length == 1) {
      debugPrint("[Classes->Blank->countMatching()] End");
      return 1;
    } else if (matchingBlanks.length > 1) {
      debugPrint(
          "[Classes->Blank->countMatching()] Error more than 1 blank found but there should only be 1 or 0.");
      debugPrint("[Classes->Blank->countMatching()] End");
      return matchingBlanks.length;
    } else {
      debugPrint("[Classes->Blank->countMatching()] End");
      return 0;
    }
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<void> readID() async {
    debugPrint("[Classes->Blank-> readID()] Start");
    Map<String, dynamic> matchConditions = Map<String, dynamic>();
    //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!
    matchConditions[_databaseHelper.colRequired_Var01] = required_var01;
    matchConditions[_databaseHelper.colRequired_Var02] = required_var02;
    matchConditions[_databaseHelper.colRequired_Var03] = required_var03;
    matchConditions[_databaseHelper.colRequired_Var04] = required_var04;
    //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!
    matchConditions[_databaseHelper.colRequired_Conversion_Var01] = required_conversion_var01;
    matchConditions[_databaseHelper.colRequired_Conversion_Var02] = required_conversion_var02;
    matchConditions[_databaseHelper.colRequired_Conversion_Var03] = required_conversion_var03;
    matchConditions[_databaseHelper.colRequired_Conversion_Var04] = required_conversion_var04;
    //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!

    List<String> outputColumns = [_databaseHelper.colID];

    debugPrint("[Classes->Blank-> readID()] retrieving data from database ...");
    //a list of matching rows except only the requested columns of each row are output.
    List<Map<String, dynamic>> output =
        await _databaseHelper.getMatchingColumns_WhereColumns(
            tableName: "BlankTable",
            conditions: matchConditions,
            outputColumns: outputColumns);

    debugPrint("[Classes->Blank-> readID()] processing ...");
    if(output.length == 1)
    {
      _id = output[0][_databaseHelper.colID];
    }
    else
    {
      if(output.length == 0)
      {
        debugPrint("[Classes->Blank-> readID()] ERROR: No matching users found!");
      }
      else
      {
        debugPrint("[Classes->Blank-> readID()] ERROR: ${output.length} matching users found!");
      }
      
    }

    debugPrint("[Classes->Blank-> readID()] End");
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

  

  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!
  void addM2O_Var01(m2oVar01_DataType newM2O_Var01)
  {
    newM2O_Var01s.add(newM2O_Var01);
  }
  void removeM2O_Var01(m2oVar01_DataType m2o_var01)
  {
    if(_m2o_var01s.contains(m2o_var01))
    {
      //_m2o_var01s.remove(m2o_var01);//There is no need to remove it from this list. It would cause an issue if you wanted to add it later after you removed it initially(the object wouldn't be able to tell if it is an entity from the database, updated, or new and therefore wouldn't know what to do with it)
      deleteM2O_Var01s.add(m2o_var01);
    }
    else if(newM2O_Var01s.contains(m2o_var01))
    {
      newM2O_Var01s.remove(m2o_var01);
    }
    else if(updatedM2O_Var01s.contains(m2o_var01))
    {
      updatedM2O_Var01s.remove(m2o_var01);
    }
  }
  List<m2oVar01_DataType> get m2o_var01s => _m2o_var01s;

  Future<List<int>> createM2O_Var01s() async
  {
    debugPrint("[Classes->Blank-> createM2O_Var01s()] Start");
    List<int> results = [];
    for (m2oVar01_DataType newM2O_Var01 in newM2O_Var01s) 
    { 
      debugPrint("[Classes->Blank-> createM2O_Var01s()] inserting new m2o_var01 into database ...");
      int result = await _databaseHelper.insert(tableName: "BlankM2O_Var01Table", objectAsMap: newM2O_Var01.toMap());
      debugPrint("[Classes->Blank-> createM2O_Var01s()] Insertion COMPLETE. result = ${result}");
      results.add(result);

    }

    debugPrint("[Classes->Blank-> createM2O_Var01s()] End");
    return results;
  }
  Future<void> readM2O_Var01s() async 
  {
    debugPrint("[Classes->Blank-> readM2O_Var01()] Start");
    _m2o_var01s.clear();
    


    debugPrint("[Classes->Account-> readM2O_Var01()] retrieving m2o_var01s...");
    List<Map<String, dynamic>> matchingM2O_Var01s = await _databaseHelper.getMatchingRows(tableName: "M2O_Var01Table", column: "blank_id", value: _id!.toString());

    _m2o_var01s = matchingM2O_Var01s.map((m2o_var01) => m2oVar01_DataType.fromMap(m2o_var01)).toList();
    debugPrint("[Classes->Blank-> readM2O_Var01()] End");
  } 
  /*Future<int> updateM2O_Var01()
  {
    
  }
  Future<int> deleteM2O_Var01()
  {
    
  }*/
  //!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!
  void addM2M_Var01(m2mVar01_DataType newM2M_Var01)
  {
    newM2M_Var01s.add(newM2M_Var01);
  }
  void removeM2M_Var01(m2mVar01_DataType m2m_var01)
  {
    if(_m2m_var01s.contains(m2m_var01))
    {
      //_m2m_var01s.remove(m2m_var01);//There is no need to remove it from this list. It would cause an issue if you wanted to add it later after you removed it initially(the object wouldn't be able to tell if it is an entity from the database, updated, or new and therefore wouldn't know what to do with it)
      deleteM2M_Var01s.add(m2m_var01);
    }
    else if(newM2M_Var01s.contains(m2m_var01))
    {
      newM2M_Var01s.remove(m2m_var01);
    }
    else if(updatedM2M_Var01s.contains(m2m_var01))
    {
      updatedM2M_Var01s.remove(m2m_var01);
    }
  }
  List<m2mVar01_DataType> get m2m_var01s => _m2m_var01s;

  Future<List<int>> createM2M_Var01s() async
  {
    debugPrint("[Classes->Blank-> createM2M_Var01s()] Start");
    List<int> results = [];
    for (m2mVar01_DataType newM2M_Var01 in newM2M_Var01s) 
    { 
      BlankM2M_Var01Connection newBlankM2M_Var01Connection = BlankM2M_Var01Connection(_id!, newM2M_Var01.id!);
      debugPrint("[Classes->Blank-> createM2M_Var01s()] inserting new m2m_var01 into database ...");
      int result = await _databaseHelper.insert(tableName: "BlankM2M_Var01ConnectionTable", objectAsMap: newBlankM2M_Var01Connection.toMap());
      debugPrint("[Classes->Blank-> createM2M_Var01s()] Insertion COMPLETE. result = ${result}");
      results.add(result);

    }

    debugPrint("[Classes->Blank-> createM2M_Var01s()] End");
    return results;
  }
  Future<void>  readM2M_Var01IDs() async
  {
    debugPrint("[Classes->Blank-> readM2M_Var01IDs()] Start");

    _m2m_var01IDs.clear();
    //get ids of matching M2M_Var01s using the id of this Blank, from the BlankM2M_var01Connection Table
    late List<Map<String, dynamic>> matchingIDs;
    matchingIDs = await _databaseHelper.getMatchingColumns(tableName: "BlankM2M_Var01ConnectionTable", column: "blank_id", value: _id.toString(), outputColumns: ["m2m_var01_id"]);

    _m2m_var01IDs = matchingIDs.map((match) => match["m2m_var01_id"] as int).toList();
    debugPrint("[Classes->Blank-> readM2M_Var01IDs()] m2m_var01IDs: ${_m2m_var01IDs}");

    debugPrint("[Classes->Blank-> readM2M_Var01IDs()] End");
  }
  Future<void> readM2M_Var01s() async
  {
    debugPrint("[Classes->Blank-> readM2M_Var01()] Start");
    _m2m_var01s.clear();
    if(_m2m_var01IDs.isEmpty)
    {
      debugPrint("[Classes->Blank-> readM2M_Var01()] ERROR _m2m_var01IDs is empty!");
      debugPrint("[Classes->Blank-> readM2M_Var01()] End");
    }

    List<String> _m2m_var01IDs_string = _m2m_var01IDs.map((ID) => ID.toString()).toList();

    debugPrint("[Classes->Blank-> readM2M_Var01()] retrieving m2m_var01s...");
    List<Map<String, dynamic>> matchingM2M_Var01s = await _databaseHelper.getMatchingRows_WhereColumnInValues(tableName: "M2M_Var01Table", column: _databaseHelper.colID, values: _m2m_var01IDs_string);

    _m2m_var01s = matchingM2M_Var01s.map((m2m_var01) => m2mVar01_DataType.fromMap(m2m_var01)).toList();
    debugPrint("[Classes->Blank-> readM2M_Var01()] End");
  }
  /*Future<int> updateM2M_Var01()
  {
    
  }
  Future<int> deleteM2M_Var01()
  {
    
  }*/
  //!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!


  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<void> createLists() async
  {
    await createM2Os();
    await createM2Ms();
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<void> createM2Os() async
  {
    
    //!!!!!!!!!!!!!!!!!!!!!!!!
    await createM2O_Var01s();
    //!!!!!!!!!!!!!!!!!!!!!!!!
    
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<void> createM2Ms() async
  {
    
    //!!!!!!!!!!!!!!!!!!!!!!!!
    await createM2M_Var01s();
    //!!!!!!!!!!!!!!!!!!!!!!!!
    
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<void> readLists() async
  {
    await readM2Os();
    await readM2Ms();
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<void> readM2Os() async
  {
    
    //!!!!!!!!!!!!!!!!!!!!!!!!
    await readM2O_Var01s();
    //!!!!!!!!!!!!!!!!!!!!!!!!
    
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<void> readM2Ms() async
  {
    
    //!!!!!!!!!!!!!!!!!!!!!!!!
    await readM2M_Var01IDs();
    await readM2M_Var01s();
    //!!!!!!!!!!!!!!!!!!!!!!!!
    
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  



  Future<int> create() async {
    debugPrint("[Classes->Blank-> create()] Start");

    debugPrint("[Classes->Blank-> create()] inserting new blank into database ...");
    int result = await _databaseHelper.insert(tableName: "BlankTable", objectAsMap: toMap());
    debugPrint("[Classes->Blank-> create()] Insertion COMPLETE. result = ${result}");
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    if(result >= 1)
    {
      
      await createLists();
      
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

    debugPrint("[Classes->Blank-> create()] End");
    return result;
  }

  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<bool> readFromDatabase() async {
    debugPrint("[Classes->Blank-> readFromDatabase()] Start");
    if (_id == null) {
      Map<String, dynamic> matchConditions = Map<String, dynamic>();
      
      //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!
      matchConditions[_databaseHelper.colRequired_Var01] = required_var01;
      matchConditions[_databaseHelper.colRequired_Var02] = required_var02;
      matchConditions[_databaseHelper.colRequired_Var03] = required_var03;
      matchConditions[_databaseHelper.colRequired_Var04] = required_var04;
      //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!
      //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!
      matchConditions[_databaseHelper.colRequired_Conversion_Var01] = required_conversion_var01;
      matchConditions[_databaseHelper.colRequired_Conversion_Var02] = required_conversion_var02;
      matchConditions[_databaseHelper.colRequired_Conversion_Var03] = required_conversion_var03;
      matchConditions[_databaseHelper.colRequired_Conversion_Var04] = required_conversion_var04;
      //!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!

      
      debugPrint("[Classes->Blank-> readFromDatabase()] Retrieving data from database (using required variables)...");
      
      List<Map<String, dynamic>> matchingBlanks = await _databaseHelper.getMatchingRows_WhereColumns( tableName: "BlankTable", conditions: matchConditions);

      if (matchingBlanks.length == 1) 
      {
        debugPrint("[Classes->Blank-> readFromDatabase()] processing data...");
        readFromMap(matchingBlanks[0]);
        //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
        await readLists();
        //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
        

        return true;
      } 
      else if (matchingBlanks.length > 1) 
      {
        debugPrint("[Classes->Blank-> readFromDatabase()] Error more than 1 blank found but there should only be 1 or 0.");
        debugPrint("[Classes->Blank-> readFromDatabase()] End");
        return false;
      } 
      else 
      {
        debugPrint("[Classes->Blank-> readFromDatabase()] No matching blanks found!");
        debugPrint("[Classes->Blank-> readFromDatabase()] End");
        return false;
      }
    } else {
      debugPrint(
          "[Classes->Blank-> readFromDatabase()] Retrieving data from database (using id)...");
      List<Map<String, dynamic>> matchingBlanks =
          await _databaseHelper.getMatchingRows(
              tableName: "BlankTable",
              column: _databaseHelper.colID,
              value: _id.toString());

      debugPrint("[Classes->Blank-> readFromDatabase()] processing data...");
      readFromMap(matchingBlanks[0]);
      debugPrint("[Classes->Blank-> readFromDatabase()] End");
      return true;
    }
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Blank.fromMap(Map<String, dynamic> map) {
    debugPrint("[Classes->Blank-> Blank.fromMap()] Start");

    _id = map["id"];

    
    
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    required_var01 = map["required_var_underscore01"];
    required_var02 = map["required_var_underscore02"];
    required_var03 = map["required_var_underscore03"];
    required_var04 = map["required_var_underscore04"];
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    required_conversion_var01 = required_conversionVar01_DataType.parse(map["required_conversion_var_underscore01"]);
    required_conversion_var02 = required_conversionVar02_DataType.parse(map["required_conversion_var_underscore02"]);
    required_conversion_var03 = required_conversionVar03_DataType.parse(map["required_conversion_var_underscore03"]);
    required_conversion_var04 = required_conversionVar04_DataType.parse(map["required_conversion_var_underscore04"]);
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    optional_var01 = map["optional_var_underscore01"];
    optional_var02 = map["optional_var_underscore02"];
    optional_var03 = map["optional_var_underscore03"];
    optional_var04 = map["optional_var_underscore04"];
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    optional_conversion_var01 = optional_conversionVar01_DataType.parse(map["optional_conversion_var_underscore01"]);
    optional_conversion_var02 = optional_conversionVar02_DataType.parse(map["optional_conversion_var_underscore02"]);
    optional_conversion_var03 = optional_conversionVar03_DataType.parse(map["optional_conversion_var_underscore03"]);
    optional_conversion_var04 = optional_conversionVar04_DataType.parse(map["optional_conversion_var_underscore04"]);
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    
    

    debugPrint("[Classes->Blank-> Blank.fromMap()] End");
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<void> readFromMap(Map<String, dynamic> map) async 
  {
    debugPrint("[Classes->Blank-> readBlankFromMap()] Start");

    _id = map["id"];
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    required_var01 = map["required_var_underscore01"];
    required_var02 = map["required_var_underscore02"];
    required_var03 = map["required_var_underscore03"];
    required_var04 = map["required_var_underscore04"];
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    required_conversion_var01 = required_conversionVar01_DataType.parse(map["required_conversion_var_underscore01"]);
    required_conversion_var02 = required_conversionVar02_DataType.parse(map["required_conversion_var_underscore02"]);
    required_conversion_var03 = required_conversionVar03_DataType.parse(map["required_conversion_var_underscore03"]);
    required_conversion_var04 = required_conversionVar04_DataType.parse(map["required_conversion_var_underscore04"]);
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    optional_var01 = map["optional_var_underscore01"];
    optional_var02 = map["optional_var_underscore02"];
    optional_var03 = map["optional_var_underscore03"];
    optional_var04 = map["optional_var_underscore04"];
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    optional_conversion_var01 = optional_conversionVar01_DataType.parse(map["optional_conversion_var_underscore01"]);
    optional_conversion_var02 = optional_conversionVar02_DataType.parse(map["optional_conversion_var_underscore02"]);
    optional_conversion_var03 = optional_conversionVar03_DataType.parse(map["optional_conversion_var_underscore03"]);
    optional_conversion_var04 = optional_conversionVar04_DataType.parse(map["optional_conversion_var_underscore04"]);
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    await readLists();
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    

    debugPrint("[Classes->Blank-> readBlankFromMap()] End");
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<Blank> fromMap(Map<String, dynamic> map) async {
    debugPrint("[Classes->Blank-> readBlankFromMap()] Start");

    Blank tempBlank = Blank.fromMap(map);

    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    await tempBlank.readLists();
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

    debugPrint("[Classes->Blank-> readBlankFromMap()] End");
    return tempBlank;
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    if (_id != null) {
      map['id'] = _id;
    }
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    map["required_var_underscore01"] = this.required_var01;
    map["required_var_underscore02"] = this.required_var02;
    map["required_var_underscore03"] = this.required_var03;
    map["required_var_underscore04"] = this.required_var04;
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    map["required_conversion_var_underscore01"] = required_conversion_var01.toString();
    map["required_conversion_var_underscore02"] = required_conversion_var02.toString();
    map["required_conversion_var_underscore03"] = required_conversion_var03.toString();
    map["required_conversion_var_underscore04"] = required_conversion_var04.toString();
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    map["optional_var_underscore01"] = optional_var01;
    map["optional_var_underscore02"] = optional_var02;
    map["optional_var_underscore03"] = optional_var03;
    map["optional_var_underscore04"] = optional_var04;
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
    map["optional_conversion_var_underscore01"] = optional_conversion_var01.toString();
    map["optional_conversion_var_underscore02"] = optional_conversion_var02.toString();
    map["optional_conversion_var_underscore03"] = optional_conversion_var03.toString();
    map["optional_conversion_var_underscore04"] = optional_conversion_var04.toString();
    //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

    return map;
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

  Future<int> update() async {
    debugPrint("[Classes->Blank-> update()] Start");
    int result = 0;

    debugPrint("[Classes->Blank-> update()] updating...");
    result = await _databaseHelper.update(tableName: "BlankTable", tableRow: this);
    //result = await _databaseHelper.update_fromMap(tableName: "BlankTable", values: toMap());
    debugPrint("[Classes->Blank-> update()] update result: $result");

    
    debugPrint("[Classes->Blank-> update()] end");
    return result;
  }

  Future<int> delete() async {
    int result = 0;

    return result;
  }
}







main()
{
  DatabaseHelper databaseHelper = DatabaseHelper();
  //TEXT  INTEGER   REAL

 
  debugPrint("[main.dart-> setUpDatabase()] setting up Blank table ...");
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  databaseHelper.table["BlankTable"] = TableInfo(name: "BlankTable", type: "blank_table_v1");
  databaseHelper.table["BlankTable"]!.addColumn("id", "INTEGER PRIMARY KEY AUTOINCREMENT"); //replace id with account_id
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  databaseHelper.table["BlankTable"]!.addColumn("required_var_underscore01", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("required_var_underscore02", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("required_var_underscore03", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("required_var_underscore04", "BLOB");
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  databaseHelper.table["BlankTable"]!.addColumn("required_conversion_var_underscore01", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("required_conversion_var_underscore02", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("required_conversion_var_underscore03", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("required_conversion_var_underscore04", "BLOB");
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  databaseHelper.table["BlankTable"]!.addColumn("optional_var_underscore01", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_var_underscore02", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_var_underscore03", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_var_underscore04", "BLOB");
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  databaseHelper.table["BlankTable"]!.addColumn("optional_conversion_var_underscore01", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_conversion_var_underscore02", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_conversion_var_underscore03", "BLOB");
  databaseHelper.table["BlankTable"]!.addColumn("optional_conversion_var_underscore04", "BLOB");
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!
  //!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!//!!!!!!!!!!!!!!!!!!!!!!!!!

}












class requiredVar01_DataType {
  static requiredVar01_DataType parse(String input)
  {

    return requiredVar01_DataType();
  }
}
class requiredVar02_DataType {
  static requiredVar02_DataType parse(String input)
  {

    return requiredVar02_DataType();
  }
  
}
class requiredVar03_DataType {
  static requiredVar03_DataType parse(String input)
  {

    return requiredVar03_DataType();
  }
}
class requiredVar04_DataType {
  static requiredVar04_DataType parse(String input)
  {

    return requiredVar04_DataType();
  }
  
}

class required_conversionVar01_DataType {
  static required_conversionVar01_DataType parse(String input)
  {

    return required_conversionVar01_DataType();
  }
}
class required_conversionVar02_DataType {
  static required_conversionVar02_DataType parse(String input)
  {

    return required_conversionVar02_DataType();
  }
  
}
class required_conversionVar03_DataType {
  static required_conversionVar03_DataType parse(String input)
  {

    return required_conversionVar03_DataType();
  }
}
class required_conversionVar04_DataType {
  static required_conversionVar04_DataType parse(String input)
  {

    return required_conversionVar04_DataType();
  }
  
}



class optionalVar01_DataType {
  static optionalVar01_DataType parse(String input)
  {

    return optionalVar01_DataType();
  }
  
}
class optionalVar02_DataType {
  static optionalVar02_DataType parse(String input)
  {

    return optionalVar02_DataType();
  }
}
class optionalVar03_DataType {
  static optionalVar03_DataType parse(String input)
  {

    return optionalVar03_DataType();
  }
}
class optionalVar04_DataType {
  static optionalVar04_DataType parse(String input)
  {

    return optionalVar04_DataType();
  }
}

class optional_conversionVar01_DataType {
  static optional_conversionVar01_DataType parse(String input)
  {

    return optional_conversionVar01_DataType();
  }
  
}
class optional_conversionVar02_DataType {
  static optional_conversionVar02_DataType parse(String input)
  {

    return optional_conversionVar02_DataType();
  }
}
class optional_conversionVar03_DataType {
  static optional_conversionVar03_DataType parse(String input)
  {

    return optional_conversionVar03_DataType();
  }
}
class optional_conversionVar04_DataType {
  static optional_conversionVar04_DataType parse(String input)
  {

    return optional_conversionVar04_DataType();
  }
}


class nonDBVar01_DataType {
  
}
class nonDBVar02_DataType {
  
}
class nonDBVar03_DataType {
  
}
class nonDBVar04_DataType {
  
}



class m2oVar01_DataType {
  int? _blankID;

  int? get blankID => _blankID;

  m2oVar01_DataType.fromMap(Map<String, dynamic> map) 
  {
    debugPrint("[Classes->m2oVar01_DataType-> m2oVar01_DataType.fromMap()] Start");

    

    debugPrint("[Classes->m2oVar01_DataType-> m2oVar01_DataType.fromMap()] End");
  }


  Map<String, dynamic> toMap() 
  {
    Map<String, dynamic> map = Map<String, dynamic>();

    
    

    return map;
  }
}
class m2oVar02_DataType {
  int? _blankID;

  int? get blankID => _blankID;

  m2oVar02_DataType.fromMap(Map<String, dynamic> map) 
  {
    debugPrint("[Classes->m2oVar02_DataType-> m2oVar02_DataType.fromMap()] Start");

    

    debugPrint("[Classes->m2oVar02_DataType-> m2oVar02_DataType.fromMap()] End");
  }


  Map<String, dynamic> toMap() 
  {
    Map<String, dynamic> map = Map<String, dynamic>();

    
    

    return map;
  }
}

class m2mVar01_DataType {

  int? _id;

  int? get id => _id;

  m2mVar01_DataType.fromMap(Map<String, dynamic> map)
  {
    debugPrint("[Classes->m2mVar01_DataType-> m2mVar01_DataType.fromMap()] Start");

    

    debugPrint("[Classes->m2mVar01_DataType-> m2mVar01_DataType.fromMap()] End");
  }

  Map<String, dynamic> toMap() 
  {
    Map<String, dynamic> map = Map<String, dynamic>();

    
    

    return map;
  }
}
class m2mVar02_DataType {
  int? _id;

  int? get id => _id;
  m2mVar02_DataType.fromMap(Map<String, dynamic> map) 
  {
    debugPrint("[Classes->m2mVar02_DataType-> m2mVar02_DataType.fromMap()] Start");

    

    debugPrint("[Classes->m2mVar02_DataType-> m2mVar02_DataType.fromMap()] End");
  }
  
  Map<String, dynamic> toMap() 
  {
    Map<String, dynamic> map = Map<String, dynamic>();

    
    

    return map;
  }
}
class BlankM2M_Var01Connection
{
  BlankM2M_Var01Connection(this._blankID, this._m2m_var01ID);
  late int _blankID;
  late int _m2m_var01ID;
  List<int> _testList = [];

  int get blankID => _blankID;
  int get m2m_var01ID => _m2m_var01ID;

  BlankM2M_Var01Connection.fromMap(Map<String, dynamic> map)
  {
    _blankID = map['blank_id'];
    _m2m_var01ID = map["m2m_var01_id"];
  }
  Map<String, dynamic> toMap()
  {
    var map = Map<String, dynamic>();
    map["blank_id"] = this._blankID;
    map["m2m_var01_id"] = this._m2m_var01ID;

    return map;
  }
}
class BlankM2M_Var02Connection
{
  BlankM2M_Var02Connection(this._blankID, this._m2m_var02ID);
  late int _blankID;
  late int _m2m_var02ID;

  int get blankID => _blankID;
  int get m2m_var02ID => _m2m_var02ID;

  BlankM2M_Var02Connection.fromMap(Map<String, dynamic> map)
  {
    _blankID = map['blank_id'];
    _m2m_var02ID = map["m2m_var02_id"];
  }
  Map<String, dynamic> toMap()
  {
    var map = Map<String, dynamic>();
    map["blank_id"] = this._blankID;
    map["m2m_var02_id"] = this._m2m_var02ID;

    return map;
  }
}