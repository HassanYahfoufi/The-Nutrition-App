import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  SafeArea(
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

             const Text ('Welcome to Nutrition',
                style: TextStyle(color: Colors.black,
                fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),

               Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: GlobalKey<FormState>(),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(labelText: 'Username',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                          fillColor: Colors.white,
                          filled: true
                        ), 
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter your username';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),

                ),
              ),
              const SizedBox(height: 10),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Form(
              key: GlobalKey<FormState>(),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        obscureText: true,
                        controller: TextEditingController(),
                        decoration: InputDecoration(labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                          fillColor: Colors.white,
                          filled: true
                        ), 
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),

                ),
              ),
             const  SizedBox(height: 20),
              TextButton(
                onPressed : (){
                  
                  Navigator.pushNamed(context, '/homepage');
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text('Log in', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    )
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Text("Not a user? Register here:"),
              
              const SizedBox(height: 10),

              TextButton(
                onPressed : (){
                  Navigator.pushNamed(context, '/registerpage');
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

