import 'login_page.dart';
import 'register.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool showLoginPage = true;
  togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (showLoginPage) {
      return LoginPage(togglePage: togglePage);
    } else {
      return Register(togglePage: togglePage);
    }
  }
}
