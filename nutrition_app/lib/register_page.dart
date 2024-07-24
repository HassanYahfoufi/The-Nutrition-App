import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrition_app/classes.dart';
import 'package:nutrition_app/database_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String oldvalue = "Male";

  DatabaseHelper databaseHelper = DatabaseHelper();

  late User newUser;

  void signUp(/*String userName, String password*/) async {
    debugPrint("[Register Page-> signUp()] Start");
    newUser = User(
        Username: usernameController.text, Password: passwordController.text);
    //User(userName, password);

    debugPrint("[Register Page-> signUp()] Validating...");
    if (await newUser.countMatching() >= 1) {
      setState(() {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Sign up failure!"),
                  content:
                      Text("User ${usernameController.text} already exists"),
                ));
        debugPrint(
            "[Register Page-> signUp()]sign up fail! User already existsxxxxxxxxxxxxxxxxxxxx");
      });
    } else //if you are here then the username and password combo hasn't been used yet
    {
      debugPrint(
          "[Register Page-> signUp()] the username and password combo hasn't been used yet");
      //User newUser = User(userName, password);

      int insertResult = await newUser.create();

      if (insertResult != 0) {
        setState(() {
          Navigator.pushNamed(context,
              '/homepage'); //change pages xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx!
        });
      } else {
        setState(() {
          debugPrint("[Register Page-> signUp()] Sign up failed!");
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Sign in failed!"),
                    content: Text("Insert operation failed!"),
                  ));
          debugPrint("[Register Page-> signUp()] Sign up failed!");
        });
      }
    }
  }

  @override
  initState() {
    debugPrint("[RegisterPage] Start");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    const Icon(
                      Icons.rice_bowl,
                      size: 100,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 60),
                    const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "First Name"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Last Name"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: dobController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Date of Birth"),
                      readOnly: true,
                      onTap: (){
                        DateSeletctor();
                      }
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: sexController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Sex"),
                            readOnly: true,
                            onTap: (){
                              showModalBottomSheet( // substitue for dropdownmenu
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min, // allows it to where the menu doesn't block the screen
                                      children: <Widget>[
                                        ListTile(
                                          title: Text('Male'),
                                          onTap: () {
                                            setState(() {
                                              oldvalue = 'Male';
                                              sexController.text = oldvalue;
                                            });
                                           Navigator.pop(context); // allows it to where the menu goes away once user makes selection
                                          },
                                        ),
                                        ListTile(
                                          title: Text('Female'),
                                          onTap: () {
                                            setState(() {
                                              oldvalue = 'Female';
                                              sexController.text = oldvalue;
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: Text('Prefer Not to Say'),
                                          onTap: () {
                                            setState(() {
                                              oldvalue = 'Prefer Not to Say';
                                              sexController.text = oldvalue; // saves
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                                          
                      ),
                    ),

                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: heightController,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Height (must be numerical)"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: weightController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ], 
                            keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Weight (must be numerical)"),
                      ),
                    ),
                    SizedBox(height: 10),
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
                    SizedBox(height: 10),
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
                            hintText: "Password"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        signUp();
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                            child: Text('Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ))),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Text("Have an User? login here:"),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/loginpage');
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
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                      ),
                    ),
                  ]
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
Future<void> DateSeletctor() async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1940),
    lastDate: DateTime(2025),



  );

  if (picked != null){
    setState(() {

      dobController.text = picked.toString().split(" ")[0];

    });
  }

}
}
                            