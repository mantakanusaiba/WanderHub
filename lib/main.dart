import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WanderHub', style: TextStyle(fontSize: 30.0, color: Colors.black.withOpacity(0.8))),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1498522437123-3a7624402acb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Text(
              'Welcome to WanderHub - Your Ultimate Travel Companion',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
