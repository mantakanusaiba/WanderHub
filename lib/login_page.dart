import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'databaseService.dart';

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
        title: Text('Welcome to Login Page !'),
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
                decoration: InputDecoration(hintText: "Email"),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter your Email !';
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
                obscuringCharacter: '#',
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter Password !';
                  } else
                    return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: 30.0,
              ),

              // Login Button
              ElevatedButton(
                  onPressed: () async {
                    if (_formKeyLogin.currentState!.validate()) {
                      setState(() {
                        loadingVisible = true;
                      });
                      dynamic result = await DatabaseService().loginUser(emailController.text, passwordController.text);

                      if (result is! UserCredential){
                        setState(() {
                          loadingVisible = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                behavior: SnackBarBehavior.floating,
                                 content: Text("Login falied, try again !")
                            )
                        );
                      }
                    }
                  },
                  child: Text("Login")),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Account?"),
                  SizedBox(width: 10,),
                  GestureDetector(
                      onTap: () {
                        widget.togglePage();
                      },
                      child: Text("Register",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue
                        ),)
                  ),
                ],
              ),

              SizedBox(height: 20,),
              Visibility(
                visible: loadingVisible,
                child: SpinKitWave(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}