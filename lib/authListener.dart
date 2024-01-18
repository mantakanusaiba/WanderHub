import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'global_variables.dart';

class AuthListener extends StatelessWidget {
  const AuthListener({super.key});

  @override
  Widget build(BuildContext context) {

    final FirebaseAuth _auth = FirebaseAuth.instance;

    return StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            login=true;
            final result = snapshot.data;
            return Home(result!.uid);
          } else {
            login=false;
            return Authentication();
          }
        }
    );
  }
}