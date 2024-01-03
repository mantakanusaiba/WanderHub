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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTourCard(
              context,

              'Place 1',
              'Coxs Bazar',
              'https://images.unsplash.com/photo-1591267770966-2938561e2608?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              'Description for Coxs Bazar tour. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              '2022-02-15',
              '\$120',
              Text('Explore Cox\'s Bazar', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Text('Tour Duration : 4 Nights 3 Days (2 Nights stay at Cox\'s Bazar)'),
              SizedBox(height: 16.0),
              Text('Day 01:'),
              Text('Leave Dhaka for Cox\'s Bazar by reserved car/coach - Overnight journey.'),
              SizedBox(height: 16.0),
              Text('Day 02:'),
              Text('Cox\'s Bazar at 08 am. Breakfast and short beach tour.'),
              Text('After lunch, start journey to Inani Beach, Himchhari Falls.'),
              Text('Back to Cox\'s Bazar sea beach. Enjoy Sunset and night beach, Overnight at Cox\'s Bazar.'),
              SizedBox(height: 16.0),
              Text('Day 03:'),
              Text('Enjoy the morning beach. After lunch, start for Moheshkhali Island by boat.'),
              Text('Back to Cox\'s Bazar and visit Barmiz market. Overnight at Cox\'s Bazar.'),
              SizedBox(height: 16.0),
              Text('Day 04:'),
              Text('After Breakfast, pack-up baggages and start for Dulahazara Safari Park.'),
              Text('Back to Cox\'s Bazar in the evening. Take dinner. Start for Dhaka by Night Coach. Overnight Journey.'),
              SizedBox(height: 16.0),
              Text('Day 05:'),
              Text('Reach Dhaka in the morning.'),
              SizedBox(height: 16.0),
              Text('- End of Tour -', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Text('Note: We need minimum 4 pax to execute this tour program.'),
              SizedBox(height: 16.0),
              Text('TOUR PACKAGE SERVICE INCLUDES:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('1) All Standard / Deluxe accommodation on Twin Sharing basis as per itinerary'),
              Text('AC / Non AC Transport / Ship / Local Transport / Boat / Trollar'),
              Text('All sightseeing, toll, tax and entry fees as per mentioned itinerary'),
              Text('Experienced Guide'),
              SizedBox(height: 16.0),
              Text('TOUR PACKAGE SERVICE EXCLUDES:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Food & Soft Drinks (let us know if you wish to include this)'),
              Text('Items of personal nature and items not mentioned above.'),
              SizedBox(height: 16.0),
              Text('Tour Package Terms & Condition', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Group size: 1-12 people'),
              Text('Destination: Cox\'s Bazar'),
              Text('Arrival on: Cox\'s Bazar'),
              Text('Meals: All meals'),
              Text('Accommodation: Standard hotels'),
            ),
            buildTourCard(
              context,

              'Place 2',
              'Sylhet',
              'https://images.unsplash.com/photo-1591267770966-2938561e2608?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              'Description for Sylhet tour. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              '2022-02-15',
              '\$120',
              Text('Explore Sylhet', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Text('Tour Duration : 4 Nights 3 Days (2 Nights stay at Sylhet)'),
              SizedBox(height: 16.0),
              Text('Day 01:'),
              Text('Leave Dhaka for Sylhet by reserved car/coach - Overnight journey.'),
              SizedBox(height: 16.0),
              Text('Day 02:'),
              Text('Sylhet at 08 am. Breakfast and short beach tour.'),
              Text('After lunch, start journey to Inani Beach, Himchhari Falls.'),
              Text('Back to  sea Sylhet. Enjoy Sunset and night beach, Overnight at Cox\'s Bazar.'),
              SizedBox(height: 16.0),
              Text('Day 03:'),
              Text('Enjoy the morning beach. After lunch, start for Moheshkhali Island by boat.'),
              Text('Back to Cox\'s Bazar and visit Barmiz market. Overnight at Cox\'s Bazar.'),
              SizedBox(height: 16.0),
              Text('Day 04:'),
              Text('After Breakfast, pack-up baggages and start for Dulahazara Safari Park.'),
              Text('Back to Cox\'s Bazar in the evening. Take dinner. Start for Dhaka by Night Coach. Overnight Journey.'),
              SizedBox(height: 16.0),
              Text('Day 05:'),
              Text('Reach Dhaka in the morning.'),
              SizedBox(height: 16.0),
              Text('- End of Tour -', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Text('Note: We need minimum 4 pax to execute this tour program.'),
              SizedBox(height: 16.0),
              Text('TOUR PACKAGE SERVICE INCLUDES:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('1) All Standard / Deluxe accommodation on Twin Sharing basis as per itinerary'),
              Text('AC / Non AC Transport / Ship / Local Transport / Boat / Trollar'),
              Text('All sightseeing, toll, tax and entry fees as per mentioned itinerary'),
              Text('Experienced Guide'),
              SizedBox(height: 16.0),
              Text('TOUR PACKAGE SERVICE EXCLUDES:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Food & Soft Drinks (let us know if you wish to include this)'),
              Text('Items of personal nature and items not mentioned above.'),
              SizedBox(height: 16.0),
              Text('Tour Package Terms & Condition', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Group size: 1-12 people'),
              Text('Destination: Sylhet'),
              Text('Arrival on: Sylhet'),
              Text('Meals: All meals'),
              Text('Accommodation: Standard hotels'),
            ),
            buildTourCard(
              context,
              'Place 3',
              'Rangamati',
              'https://upload.wikimedia.org/wikipedia/commons/7/73/Hanging_bridge_of_Rangamati%2C_Bangladesh._.jpg',
              'Description for Rangamati tour. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              '2022-03-30',
              '\$90',
              Text('Explore Rangamati', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Text('Tour Duration : 4 Nights 3 Days (2 Nights stay at Rangamati)'),
              SizedBox(height: 16.0),
              Text('Day 01:'),
              Text('Leave Dhaka for Rangamati by reserved car/coach - Overnight journey.'),
              SizedBox(height: 16.0),
              Text('Day 02:'),
              Text('Rangamati at 08 am. Breakfast and short beach tour.'),
              Text('After lunch, start journey to Inani Beach, Himchhari Falls.'),
              Text('Back to Rangamati. Enjoy Sunset and night beach, Overnight at Cox\'s Bazar.'),
              SizedBox(height: 16.0),
              Text('Day 03:'),
              Text('Enjoy the morning beach. After lunch, start for Moheshkhali Island by boat.'),
              Text('Back to Cox\'s Bazar and visit Barmiz market. Overnight at Cox\'s Bazar.'),
              SizedBox(height: 16.0),
              Text('Day 04:'),
              Text('After Breakfast, pack-up baggages and start for Dulahazara Safari Park.'),
              Text('Back to Cox\'s Bazar in the evening. Take dinner. Start for Dhaka by Night Coach. Overnight Journey.'),
              SizedBox(height: 16.0),
              Text('Day 05:'),
              Text('Reach Dhaka in the morning.'),
              SizedBox(height: 16.0),
              Text('- End of Tour -', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Text('Note: We need minimum 4 pax to execute this tour program.'),
              SizedBox(height: 16.0),
              Text('TOUR PACKAGE SERVICE INCLUDES:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('1) All Standard / Deluxe accommodation on Twin Sharing basis as per itinerary'),
              Text('AC / Non AC Transport / Ship / Local Transport / Boat / Trollar'),
              Text('All sightseeing, toll, tax and entry fees as per mentioned itinerary'),
              Text('Experienced Guide'),
              SizedBox(height: 16.0),
              Text('TOUR PACKAGE SERVICE EXCLUDES:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Food & Soft Drinks (let us know if you wish to include this)'),
              Text('Items of personal nature and items not mentioned above.'),
              SizedBox(height: 16.0),
              Text('Tour Package Terms & Condition', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Group size: 1-12 people'),
              Text('Destination: Rangamatir'),
              Text('Arrival on:Rangamati'),
              Text('Meals: All meals'),
              Text('Accommodation: Standard hotels'),
            ),
            buildTourCard(
              context,

              'Place 4',
              'Bandarban',
              'https://images.unsplash.com/photo-1651923675044-a25776b5a25f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWVnaGxhJTIwYmFuZGFyYmFufGVufDB8fDB8fHww',
              'Description for Bandarban tour. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              '2022-05-10',
              '\$150',
              Text('Explore Bandarban', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Text('Tour Duration : 4 Nights 3 Days (2 Nights stay at Cox\'s Bazar)'),
              SizedBox(height: 16.0),
              Text('Day 01:'),
              Text('Leave Dhaka for Bandarban by reserved car/coach - Overnight journey.'),
              SizedBox(height: 16.0),
              Text('Day 02:'),
              Text('Cox\'s Bazar at 08 am. Breakfast and short beach tour.'),
              Text('After lunch, start journey to Inani Beach, Himchhari Falls.'),
              Text('Back to Bandarban. Enjoy Sunset and night beach, Overnight at Cox\'s Bazar.'),
              SizedBox(height: 16.0),
              Text('Day 03:'),
              Text('Enjoy the morning beach. After lunch, start for Moheshkhali Island by boat.'),
              Text('Back to Cox\'s Bazar and visit Barmiz market. Overnight at Cox\'s Bazar.'),
              SizedBox(height: 16.0),
              Text('Day 04:'),
              Text('After Breakfast, pack-up baggages and start for Dulahazara Safari Park.'),
              Text('Back to Cox\'s Bazar in the evening. Take dinner. Start for Dhaka by Night Coach. Overnight Journey.'),
              SizedBox(height: 16.0),
              Text('Day 05:'),
              Text('Reach Dhaka in the morning.'),
              SizedBox(height: 16.0),
              Text('- End of Tour -', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Text('Note: We need minimum 4 pax to execute this tour program.'),
              SizedBox(height: 16.0),
              Text('TOUR PACKAGE SERVICE INCLUDES:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('1) All Standard / Deluxe accommodation on Twin Sharing basis as per itinerary'),
              Text('AC / Non AC Transport / Ship / Local Transport / Boat / Trollar'),
              Text('All sightseeing, toll, tax and entry fees as per mentioned itinerary'),
              Text('Experienced Guide'),
              SizedBox(height: 16.0),
              Text('TOUR PACKAGE SERVICE EXCLUDES:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Food & Soft Drinks (let us know if you wish to include this)'),
              Text('Items of personal nature and items not mentioned above.'),
              SizedBox(height: 16.0),
              Text('Tour Package Terms & Condition', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Group size: 1-12 people'),
              Text('Destination: Bandarban'),
              Text('Arrival on: Bandarban'),
              Text('Meals: All meals'),
              Text('Accommodation: Standard hotels'),
            ),
          ],
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
        // Navigate to the details page when the image is tapped
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
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: 200,
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
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
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
        title: Text('Tour Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Place: $place',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Description: $description',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Date: $date',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Tour Cost: $tourCost',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

            
                         
                      
