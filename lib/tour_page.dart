import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanderhub/home2.dart';
import 'package:wanderhub/messagePage.dart';
import 'authListener.dart';
import 'databaseService.dart';


class TourPage extends StatelessWidget {
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    String uid = getCurrentUser()?.uid ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Group Tour',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTourCard(
                context,
                'Place1',
                'Coxs Bazar',
                'https://images.unsplash.com/photo-1591267770966-2938561e2608?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'Cox Bazar is a beautiful place with pristine beaches and crystal-clear waters. ',
                '2022-02-15',
                '\Tk6200',

              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Have you registered?",
                  style: TextStyle(
                    fontFamily: 'Pacifico-Regular',
                  ),),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home2(uid)),
                      );
                    },
                    child: Text("Yes",
                    style: TextStyle(
              fontFamily: 'Pacifico-Regular',
                      color:Colors.green,
                      fontSize:15,
              ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text("No",
                      style: TextStyle(
                        fontFamily: 'Pacifico-Regular',
                        color:Colors.red,
                        fontSize:15,
                      ),),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.chat, color: Colors.white, size: 30,),
        backgroundColor: Colors.cyan,
      ),


    );
  }

  Widget buildTourCard(
      BuildContext context,
      String place,
      String name,
      String imageUrl,
      String description,
      String date,
      String tourCost,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TourDetailsPage(
              place: place,
              name: name,
              imageUrl: imageUrl,
              description: description,
              date: date,
              tourCost: tourCost,
            ),
          ),
        );
      },
      child: Card(
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Pacifico-Regular',
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Pacifico-Regular',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TourDetailsPage extends StatelessWidget {
  final String place;
  final String name;
  final String imageUrl;
  final String description;
  final String date;
  final String tourCost;

  TourDetailsPage({
    required this.place,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.date,
    required this.tourCost,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Details',
            style: TextStyle(fontFamily: 'Pacifico-Regular')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Place: $place',
              style: TextStyle(fontSize: 20,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 20,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Description: $description',
              style: TextStyle(fontSize: 20,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Date: $date',
              style: TextStyle(fontSize: 20,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Tour Cost: $tourCost',
              style: TextStyle(fontSize: 20,
                  fontFamily: 'Pacifico-Regular'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TourPage(),
  ));
}