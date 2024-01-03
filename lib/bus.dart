import 'package:flutter/material.dart';

class BusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Booking',
          style: TextStyle(fontSize: 24,
              fontFamily: 'Pacifico-Regular'),
        ),
      ),
      body: Center(
        child: Text('This is the Ticket page'),
      ),
    );
  }
}
