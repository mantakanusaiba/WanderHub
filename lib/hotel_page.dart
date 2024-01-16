import 'package:flutter/material.dart';
import 'roomselectionpage.dart';

class HotelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hotel Booking',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Pacifico-Regular',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Where Would You\nLike To Go?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Center(
                child: _buildCountryBoxes(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryBoxes(BuildContext context) {
    List<String> countries = ['Cox\'s Bazar', 'Rangamati', 'Bandarban', 'Sylhet', 'Sunamgonj'];

    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _onCountryBoxTapped(context, countries[index]);
          },
          child: _buildCountryBox(countries[index]),
        );
      },
    );
  }

  Widget _buildCountryBox(String countryName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        countryName,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  void _onCountryBoxTapped(BuildContext context, String country) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountryDetailPage(country),
      ),
    );
  }
}

class CountryDetailPage extends StatelessWidget {
  final String country;

  CountryDetailPage(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country),
      ),
      body: country == 'Cox\'s Bazar' ? _buildHotelBoxes() : Center(
          child: Text('No hotels for this location')),
    );
  }

  Widget _buildHotelBoxes() {
    List<Map<String, dynamic>> hotels = [
      {
        'name': '5-star Hotel',
        'image': 'https://pix10.agoda.net/hotelImages/119/1196495/1196495_17122303270060592537.jpg?ca=6&ce=1&s=702x392',
        'price': 100
      },
      {
        'name': 'Paradise Hotel',
        'image': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/b1/c8/fc/ocean-paradise-hotel.jpg?w=700&h=-1&s=1',
        'price': 120
      },
      {
        'name': 'Seagull Hotel',
        'image': 'https://media-cdn.tripadvisor.com/media/photo-s/0a/19/14/1a/birds-eye-view.jpg',
        'price': 80
      },
      {
        'name': 'Hotel The Cox Today',
        'image': 'https://ak-d.tripcdn.com/images/0225712000bgwiybzC2D4_R_300_225_R5.jpg',
        'price': 150
      },
      {
        'name': 'Hotel Sea Crown',
        'image': 'https://q-xx.bstatic.com/xdata/images/hotel/max500/120397144.jpg?k=7cf589167d9896fcd84b2808de217747e5cf5bdbe992757d148d81e467a30ca8&o=',
        'price': 70
      }
    ];

    return ListView.builder(
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        return _buildHotelCard(context, hotels[index]);
      },
    );
  }

  Widget _buildHotelCard(BuildContext context, Map<String, dynamic> hotel) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.network(
            hotel['image']!,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hotel['name']!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Price: \$${hotel['price']}',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _onSelectRoomPressed(context, hotel);
            },
            child: Text('Select Room'),
          ),
        ],
      ),
    );
  }
  void _onSelectRoomPressed(BuildContext context, Map<String, dynamic> hotel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomSelectionPage(hotel),
      ),
    );
  }
  
  void main() {
    runApp(MaterialApp(
      home: HotelPage(),
    ));
  }
}
