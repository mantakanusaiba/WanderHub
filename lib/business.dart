import 'package:flutter/material.dart';
import 'package:wanderhub/authListener.dart';

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'For business',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '\n Grow your business with WanderHub !\n',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Terms and Conditions for Travel Service Providers:\n\n'
                  '1. Acceptance of Terms\n'
                  '2. Registration and Account Security\n'
                  '3. Service Listing\n'
                  '4. Pricing and Availability\n'
                  '5. Booking Confirmation and Cancellation\n'
                  '6. Customer Service and Dispute Resolution\n'
                  '7. Confidentiality\n',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                               context,
                      MaterialPageRoute(builder: (context) => AuthListener()),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.hotel),
                      SizedBox(width: 8),
                      Text('Hotel'),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuthListener()),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.airplane_ticket),
                      SizedBox(width: 8),
                      Text('Ticket'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
