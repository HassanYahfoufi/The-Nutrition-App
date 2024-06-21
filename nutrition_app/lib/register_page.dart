import 'package:flutter/material.dart';
import 'package:nutrition_app/classes.dart';

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

  late User newUser;


  
  void signUp(String userName, String password) async {
    debugPrint("[Register Page-> signUp()]^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      newUser =  User(Username: usernameController, Password: passwordController);
      //User(userName, password);

      if (await newUser.userAlreadyExists()) 
      {
        setState(() {
          showDialog(context: context, builder: (_)=>AlertDialog(title: Text("Sign up failure!"), content: Text("User $userName already exists"),));
          debugPrint("[Register Page-> signUp()]sign in fail! User already exists!!!!!!!!!!!!!!!!!!!!");
        });
        
      } 
      else //if you are here then the username hasn't been used yet
      {
        
        debugPrint("[Register Page-> signUp()] username hasn't been used yet");
        //User newUser = User(userName, password);

        int insertResult = await newUser.createUser();
        
        if(insertResult != 0)
        {
          setState(() {
            //change pages !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          });
        }
        else
        {
          setState(() {
            debugPrint("[Register Page-> signUp()] Sign up failed!");
            showDialog(context: context, builder: (_)=>AlertDialog(title: Text("Sign in failed!"), content: Text("Insert operation failed!"),));
            debugPrint("[Register Page-> signUp()] Sign up failed!");
          });
        }
          
          
        
        
      }
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),

              const Icon(
                Icons.rice_bowl,
                size: 100,
                color: Colors.green,
              ),
              const SizedBox(height: 60),

              const Text ('Register',
                style: TextStyle(color: Colors.black,
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
                    hintText: "First Name"
                    
                  ),

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
                    hintText: "Last Name"
                  ),
        
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
                    hintText: "Date of Birth"
                  ),
        
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
                    hintText: "Sex"
                  ),
        
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Height"
                  ),
        
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Weight"
                  ),
        
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
                    hintText: "Username"
                  ),
        
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
                    hintText: "Password"
                  ),
        
                ),
              ),
              const SizedBox(height: 20),

              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/homepage');
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text('Register', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ))
                  ),
                  ),
                ),
              
              const SizedBox(height: 60),
              Text("Have an User? login here:"),
              
              const SizedBox(height: 10),

              TextButton(
                onPressed : (){
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
                    child: Text('Login', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    )
                  ),
                ),
              ),

            ]
          ),
        ),
      ),

    );
  }
}

