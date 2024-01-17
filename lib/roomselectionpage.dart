import 'package:flutter/material.dart';

class RoomSelectionPage extends StatelessWidget {
  final Map<String, dynamic> hotel;

  RoomSelectionPage(this.hotel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Selection'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Card 1 - Selected Hotel
              buildHotelCard({
                'name': 'Deluxe Room',
                'price': 150,
                'image':
                'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/10/b4/05/the-cox-today-limited.jpg?w=300&h=200&s=1',
              }),

              // Card 2 - Example Hotel 2
              buildHotelCard({
                'name': 'Deluxe Twin Room',
                'price': 150,
                'image':
                'https://www.momondo.com/himg/3c/7c/4b/expediav2-713372-d206e5-950457.jpg',
              }),

              // Card 3 - Example Hotel 3
              buildHotelCard({
                'name': 'Superior Double Room',
                'price': 200,
                'image':
                'https://q-xx.bstatic.com/xdata/images/hotel/max500/243701987.jpg?k=c7c1fe6c4010c987a3564aab5496e60437e107bbd4c20d04345d4651f1c7276c&o=',
              }),

              // Card 4 - Example Hotel 4
              buildHotelCard({
                'name': 'Family Room',
                'price': 180,
                'image':
                'https://www.momondo.com/himg/3c/7c/4b/expediav2-713372-d206e5-950457.jpg',
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHotelCard(Map<String, dynamic> hotelData) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    hotelData['image'],
                    width: 260,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelData['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Price: \$${hotelData['price']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Icons for Facilities
            FacilityRow([
              FacilityIconButton(Icons.hotel, 'Extra Bed'),
              FacilityIconButton(Icons.iron, 'Iron Facilities'),
              FacilityIconButton(Icons.local_drink, 'Bottled Water'),
            ]),
            FacilityRow([
              FacilityIconButton(Icons.wifi, 'Wi-Fi'),
              FacilityIconButton(Icons.bathtub, 'Shower'),
              FacilityIconButton(Icons.tv, 'TV'),
            ]),
            FacilityRow([
              FacilityIconButton(Icons.free_breakfast, 'Tea'),
              FacilityIconButton(Icons.local_cafe, 'Coffee Maker'),
              FacilityIconButton(Icons.ac_unit, 'Air Conditioning'),
            ]),
            FacilityRow([
              FacilityIconButton(Icons.kitchen, 'Fridge'),
              FacilityIconButton(Icons.bathroom, 'Personal Bathroom'),
            ]),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic for the "Book Now" button
                },
                child: Text('Book Now'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FacilityRow extends StatelessWidget {
  final List<Widget> children;

  FacilityRow(this.children);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}

class FacilityIconButton extends StatelessWidget {
  final IconData icon;
  final String facility;

  FacilityIconButton(this.icon, this.facility);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {

      },
      icon: Column(
        children: [
          Icon(icon),
          SizedBox(height: 4),
          Text(facility),
        ],
      ),
      color: Colors.blueGrey,
      tooltip: facility,
    );
  }
}
