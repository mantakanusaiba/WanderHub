import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wanderhub/main.dart';
import 'databaseService.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  final togglePage;
  LoginPage({required this.togglePage});

  @override
  State<LoginPage> createState() => _LogInState();
}

class _LogInState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKeyLogin = GlobalKey<FormState>();
  bool loadingVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to Login Page !',
          style: TextStyle(
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKeyLogin,
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter your Email :';
                  } else
                    return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                obscuringCharacter: '*',
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter Password :';
                  } else
                    return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKeyLogin.currentState!.validate()) {
                    setState(() {
                      loadingVisible = true;
                    });
                    dynamic result = await DatabaseService().loginUser(
                      emailController.text,
                      passwordController.text,
                    );
                    if (result is UserCredential) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(p: true),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "Login successful!",
                            style: TextStyle(
                              fontFamily: 'Pacifico-Regular',
                            ),
                          ),
                        ),
                      );
                      Timer(Duration(seconds: 2), () {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      });
                    } else {
                      setState(() {
                        loadingVisible = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "Login failed, try again!",
                            style: TextStyle(
                              fontFamily: 'Pacifico-Regular',
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Pacifico-Regular',
                    color: Colors.cyan[800],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Account?",
                    style: TextStyle(
                      fontFamily: 'Pacifico-Regular',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.togglePage();
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.cyan[800],
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: loadingVisible,
                child: SpinKitWave(
                  color: Colors.cyan[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
