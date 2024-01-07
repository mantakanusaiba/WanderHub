import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wanderhub/main.dart';
import 'user.dart';
import 'databaseService.dart';
import 'dart:async';


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
  var numberController = TextEditingController();
  String? selectedRole;
  bool loadingVisible = false;
  final _formKeyRegister = GlobalKey<FormState>();
  DatabaseService _databaseService = DatabaseService();
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Now !',
          style: TextStyle(
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
        body: SingleChildScrollView(
       child: Container(
        padding: EdgeInsets.all(13.0),
        child: Form(
          key: _formKeyRegister,
          child: Column(
            children: [

              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () async {
                  final pickedFile =
                  await ImagePicker().getImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      profileImage = File(pickedFile.path);
                    });
                  }
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: profileImage != null
                          ? FileImage(profileImage!) as ImageProvider<Object>?
                          : NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2irsFFS2xbDT5vhBymqMRzykWjMkNirupdg&usqp=CAU') as ImageProvider<Object>?,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Name"),
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter Your Name :';
                  } else
                    return null;
                },
              ),
              SizedBox(
                height: 18.0,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Email"),
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter your Email :';
                  } else
                    return null;
                },
              ),
              SizedBox(
                height: 18.0,
              ),
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
                height: 18.0,
              ),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(hintText: "Phone No. "),
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter Your Phone no. :';
                  } else
                    return null;
                },
              ),
              SizedBox(
                height: 18.0,
              ),
              DropdownButtonFormField<String>(
                value: selectedRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Select Role',
                ),
                items: ['User', 'Owner-Hotel', 'Owner-Bus', 'Owner-Flight']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Select your role';
                  } else {
                    return null;
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
                SizedBox(
                height: 18.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKeyRegister.currentState!.validate()) {
                    setState(() {
                      loadingVisible = true;
                    });

                    dynamic result =
                    await _databaseService.registerUserWithPicture(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                      numberController.text,
                      selectedRole.toString(),
                      profileImage,
                    );

                    if (result is CustomUser) {
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
                            "Registration successful!",
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
                          duration: Duration(seconds: 4),
                          content: Text("Something went wrong, try again!"),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontFamily: 'Pacifico-Regular',
                    color:Colors.cyan[800],
                  ),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an Account?",
                    style: TextStyle(
                      fontFamily: 'Pacifico-Regular',
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      widget.togglePage();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.cyan[800],
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
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
        ),
    );
 }
}
