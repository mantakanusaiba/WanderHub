import 'package:flutter/material.dart';

class TourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Group Tour',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Pacifico-Regular',
          ),
        ),
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
              buildTourCard(
                context,
                'Place2',
                'Sylhet',
                'https://upload.wikimedia.org/wikipedia/commons/4/4d/Jaflong_Sylhet.jpg',
                'Sylhet, a picturesque region in northeastern Bangladesh, is known for its lush green landscapes, tea gardens, and cultural richness.',
                '2022-02-15',
                '\Tk5400',
              ),
              buildTourCard(
                context,
                'Place3',
                'Rangamati',
                'https://upload.wikimedia.org/wikipedia/commons/7/73/Hanging_bridge_of_Rangamati%2C_Bangladesh._.jpg',
                'Rangamati is a picturesque district located in the Chittagong Hill Tracts of Bangladesh. ',
                '2022-03-30',
                '\Tk6000',
              ),
              buildTourCard(
                context,
                'Place3',
                'Bandarban',
                'https://images.unsplash.com/photo-1651923675044-a25776b5a25f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWVnaGxhJTIwYmFuZGFyYmFufGVufDB8fDB8fHww',
                'Welcome to Bandarban, a mesmerizing destination nestled in the Chittagong Hill Tracts.',
                '2022-05-10',
                '\Tk5150',
              ),
            ],
          ),
        ),
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
