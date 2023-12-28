import 'user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'databaseService.dart';

class Register extends StatefulWidget {
  final togglePage;
  Register({required this.togglePage});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool loadingVisible = false;
  final _formKeyLogin = GlobalKey<FormState>();
  DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Now !'),
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
              // for Name
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Name"),
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter Your Name !';
                  } else
                    return null;
                },
              ),

              SizedBox(
                height: 30.0,
              ),
              // for email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Email"),
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter your Email !';
                  } else
                    return null;
                },
              ),
              SizedBox(
                height: 30.0,
              ),

              // for password
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                obscureText: true,
                obscuringCharacter: '*',
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter Password !';
                  } else
                    return null;
                },
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
                      dynamic result = await _databaseService.registerUser(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                         );

                      if (result is! CustomUser){
                        setState(() {
                          loadingVisible = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 4),
                                content: Text("Something went wrong, try again !"),
                            )
                        );
                      }
                    }
                  },
                  child: Text("Register")),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have an Account?"),
                  SizedBox(width: 10,),
                  GestureDetector(
                      onTap: () {
                        widget.togglePage();
                      },
                      child: Text("Login",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.lightBlueAccent
                        ),)
                  ),
                ],
              ),

              SizedBox(height: 10,),
              Visibility(
                visible: loadingVisible,
                child: SpinKitWave(
                  color: Colors.lightBlueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
