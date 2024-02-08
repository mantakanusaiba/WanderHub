import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanderhub/authListener.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailcontroller = TextEditingController();
  bool crossVisible1 = true;

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Password reset link sent to your email.',
            style: TextStyle(
              fontFamily: 'Pacifico-Regular',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.green,
        ),
      );

      ;
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              content: Text(
                e.message.toString(),
                style: TextStyle(
                  fontFamily: 'Pacifico-Regular',
                ),
              ),
            );
          });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: AppBar(
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthListener(),
                    ));
              },
            ),
            title: const Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'Pacifico-Regular',
                fontSize: 25,
              ),
            ),
            backgroundColor: Colors.cyan,
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Enter your email  \n\n We will send you a password reset link.',
              style: TextStyle(
                fontFamily: 'Pacifico-Regular',
                fontSize: 23,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                TextFormField(
              controller: emailcontroller,
              cursorColor: Colors.white,
              onTap: () {
                setState(() {
                  crossVisible1 = true;
                });
              },
              onTapOutside: (PointerDownEvent event) {
                FocusScope.of(context).requestFocus(FocusNode());
                setState(() {
                  crossVisible1 = false;
                });
              },
              onFieldSubmitted: (text) {
                setState(() {
                  crossVisible1 = false;
                });
              },
              validator: (value) {
                TextStyle(color: Colors.white);
                if (value!.trim().isEmpty) {
                  return 'Please enter your email!';
                } else
                  return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.cyan[700],
                  size: 32,
                ),
                hintText: "Enter your email.",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                errorStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pacifico-Regular',
                ),
                filled: true,
                fillColor: Colors.cyan[300],
                suffixIcon: Visibility(
                  visible: crossVisible1,
                  child: IconButton(
                    icon: Icon(Icons.clear, color: Colors.white),
                    onPressed: () {
                      emailcontroller.clear();
                    },
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: passwordReset,
            child: Text('Reset Password',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico-Regular',
                    fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              primary: Colors.cyan[
                  700],
            ),
          ),
        ],
      ),
    );
  }
}
