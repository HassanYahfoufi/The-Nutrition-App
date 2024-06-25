import 'package:flutter/material.dart';
import 'package:nutrition_app/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:nutrition_app/classes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late User inputUser;

  DatabaseHelper databaseHelper = DatabaseHelper();

  void signIn(String userName, String password) async {
    debugPrint("[LoginPage-> signIn()] Start");
    debugPrint("[LoginPage-> signIn()] Logging in...");
    //if username exists: continue with sign in
    debugPrint(
        "[LoginPage-> signIn()] Excecuting: inputAccount = Account(userName, password);...");
    inputUser = User(Username: userName, Password: password);

    debugPrint("[LoginPage-> signIn()] searching for matching accounts...");
    int numMatchingAccounts = await inputUser.countMatching();
    debugPrint(
        "[LoginPage-> signIn()] matching accounts: $numMatchingAccounts");
    if (numMatchingAccounts == 1) {
      debugPrint(
          "[LoginPage-> signIn()] user already exists and there is only 1 matching account");
      //await inputAccount.updateFromDatabase();

      debugPrint("Signing in...");
      Navigator.pushNamed(context, '/homepage');

      return;
    } else if (numMatchingAccounts == 0) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Sign in failed!"),
                  content: Text(
                      "The Username Password combo didnt match any xisting users."),
                ));
      });
    } else {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Sign in failed!"),
                  content: Text(
                      "ERROR: Multiple matching accounts. Contact support (Deveelopers: check database and delete duplicate accounts.)"),
                ));
        //A potential solution is to use the oldest account
        //You could also combine all information into one account and then delete the duplicates
        //Then switch pages
      });
    }
  }

  Future<void> createNewDatabases(List<String> currTableNames) async {
    debugPrint("[LoginPage-> createNewDatabases()] Start");

    DatabaseHelper databaseHelper = DatabaseHelper();
    debugPrint("[LoginPage-> createNewDatabases()] getting database...");
    Database? db = await databaseHelper.getDatabase();
    String tempTableType;
    for (String tableName
        in databaseHelper.table.values.map((table) => table.name)) {
      tempTableType = databaseHelper.table[tableName]!.type;
      if (currTableNames.contains(tempTableType) == false) {
        debugPrint(
            "[LoginPage-> createNewDatabases()] creating $tableName table...");
        await databaseHelper.createTable(db!, tableName);
      }
    }

    debugPrint("[LoginPage-> createNewDatabases()] End");
  }

  Future<void> setUp() async {
    debugPrint("[LoginPage-> setUp()] Start");
    /*List<String> deleteTableNames = [tableInfoName["Catagory"]!, M2MName["SuperCat-SubCat"]!];

    for (String deleteTableName in deleteTableNames) {
      debugPrint("Deleting ${deleteTableName} database ...");
      await databaseHelper.deleteTable(deleteTableName);
    }*/

    debugPrint("\t[LoginPage-> setUp()] Table names:");
    List<String> currentTables_names = await databaseHelper.getTableNames();
    for (String name in currentTables_names) {
      debugPrint("\t\t$name");
    }

    debugPrint(
        "\t[LoginPage-> setUp()] Excecuting: await createNewDatabases();...");
    await createNewDatabases(currentTables_names);

    //!!!!!!!!!!!!!!!!!!
    debugPrint("[LoginPage-> setUp()] Retrieving the User table...");
    //User tempUser = User(Username: "Username", Password: "Password");
    //databaseHelper.getEntireTable(tableName: "UserTable", maptoObject: tempUser.fromMap);
    List<Map<String, dynamic>> userTable =
        await databaseHelper.getEntireTable_asMap(tableName: "UserTable");
    debugPrint("[LoginPage-> setUp()] Printing...");
    for (Map<String, dynamic> user in userTable) {
      debugPrint("\t${user["username"]}");
    }
    //!!!!!!!!!!!!!!!!!!
  }

  @override
  initState() {
    //currentPage = Center(child: Text("Loading..."));!
    debugPrint("[LoginPage] Start");
    setUp().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 60),
            const Icon(
              Icons.rice_bowl,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 60),
            const Text(
              'Welcome to Nutrition',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),

            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Username"),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                String userName = usernameController.text;
                String password = passwordController.text;
                signIn(userName, password);
                //signIn(usernameController.text, passwordController.text);
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                    child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
              ),
            ),
            const SizedBox(height: 60),
            Text("Not a user? Register here:"),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registerpage'); //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                    child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
