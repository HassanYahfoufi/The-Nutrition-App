List<String> tableNames_nutritionApp = [
  ];

class TableInfo
{
  String name = "";
  String _type = "";
  List<String> _columnName = <String>[];
  Map<String, String> _columnType = Map<String, String>();
  Map<String, String> _specialColumnSQL = Map<String, String>(); 


  String _sqlInfo = "";


  //TableInfo(this.name, this.type, [this._sqlInfo = ""]);
  TableInfo({required this.name, required String type, List<String> inCols = const <String>[], List<String> inColInfo = const <String>[]})
  {
    this._type = type;

    if(tableNames_nutritionApp.contains(this.name) == false)
    {
      tableNames_nutritionApp.add(this.name);
    }
    for(int i=0; i<inCols.length; i++)
    {
      addColumn(inCols[i], inColInfo[i]);
    }
  }
  TableInfo.withoutNameTypeUpdate(String inName, String inType, {List<String> inCols = const <String>[], List<String> inColInfo = const <String>[]})
  {
    this.name = inName;
    this._type = inType;

    for(int i=0; i<inCols.length; i++)
    {
      addColumn(inCols[i], inColInfo[i]);
    }
  }

  

  String get type => _type;

  void addColumn(String name, String type)
  {
    int index = _columnName.length;
    _columnName.add(name);   
    _columnType[_columnName[index]] = type;

    //"id"
    //"id" : "INTEGER PRIMARY KEY AUTOINCREMENT"
  }

  void addForeignKey(String name, String sql)
  {
    int index = _columnName.length;
    _columnName.add(name);   
    _columnType[_columnName[index]] = "FOREIGN KEY";//
    _specialColumnSQL[_columnName[index]] = sql;


    //"id"
    //"id" : "INTEGER PRIMARY KEY AUTOINCREMENT"
  }

  String get sqlInfo => _sqlInfo;

  void updateInfo()
  {
    this._sqlInfo = "CREATE TABLE $type(";
    //this._sqlInfo = this._sqlInfo + _columnName[0] + " " + _columnType[_columnName[0]]!;
    String seperator = "";
    for(int i=0; i<_columnName.length; i++)
    {
      if(i == 1)
        seperator = ", ";

      if(_columnType[_columnName[i]] == "FOREIGN KEY")
      {
        this._sqlInfo = this._sqlInfo + seperator + _columnName[i] + " " + "INTEGER";
        this._sqlInfo = this._sqlInfo + seperator + _specialColumnSQL[_columnName[i]]!;
      }
      else
      {
        this._sqlInfo = this._sqlInfo + seperator + _columnName[i] + " " + _columnType[_columnName[i]]!;
      }
    }
    this._sqlInfo = this._sqlInfo + ")";

    //CREATE TABLE $tableType($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)
  }
  
}