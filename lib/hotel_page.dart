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
      body: country == 'Cox\'s Bazar'
          ? _buildHotelBoxes()
          : country == 'Rangamati'
          ? _buildRangamatiHotelBoxes()
          : country == 'Bandarban'
          ? _buildBandarbanHotelBoxes()
          : country == 'Sylhet'
          ? _buildSylhetHotelBoxes()
          : country == 'Sunamgonj'
          ? _buildSunamgonjHotelBoxes()
          : Center(child: Text('No hotels for this location')),
    );
  }

  Widget _buildHotelBoxes() {
    List<Map<String, dynamic>> hotels = [
      {
        'name': '5-star Hotel',
        'image': 'https://pix10.agoda.net/hotelImages/119/1196495/1196495_17122303270060592537.jpg?ca=6&ce=1&s=702x392',
        'price': 20000
      },
      {
        'name': 'Paradise Hotel',
        'image': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/b1/c8/fc/ocean-paradise-hotel.jpg?w=700&h=-1&s=1',
        'price': 15000
      },
      {
        'name': 'Seagull Hotel',
        'image': 'https://media-cdn.tripadvisor.com/media/photo-s/0a/19/14/1a/birds-eye-view.jpg',
        'price': 11000
      },
      {
        'name': 'Hotel The Cox Today',
        'image': 'https://ak-d.tripcdn.com/images/0225712000bgwiybzC2D4_R_300_225_R5.jpg',
        'price': 10500
      },
      {
        'name': 'Hotel Sea Crown',
        'image': 'https://q-xx.bstatic.com/xdata/images/hotel/max500/120397144.jpg?k=7cf589167d9896fcd84b2808de217747e5cf5bdbe992757d148d81e467a30ca8&o=',
        'price': 5600
      }
    ];


    return _buildHotelCardList(hotels);
  }

  Widget _buildRangamatiHotelBoxes() {
    List<Map<String, dynamic>> hotels = [
      {
        'name': 'Nilanjana Boat Club & Resort',
        'image': 'https://lh3.googleusercontent.com/p/AF1QipNXHicm8ve0-tquDhETobLRZ-CqTT8n6F_2-zPX=w287-h192-n-k-rw-no-v1',

        'price': 18293
      },
      {
        'name': 'Hotel Mati Mahal',
        'image': 'https://lh3.googleusercontent.com/p/AF1QipNE2Hxumh1Y9XFpgsD4gLal8oF873teaFagnHOG=w287-h192-n-k-rw-no-v1',
        'price': 8500
      },
      {
        'name': 'Hotel Prince',
        'image': 'https://lh3.googleusercontent.com/p/AF1QipOywrk4mOR4b0RTPFsb6MEhxxepTiSPAgYqiBi7=w287-h192-n-k-rw-no-v1',
        'price': 5300
      },

    ];

    return _buildHotelCardList(hotels);
  }

  Widget _buildBandarbanHotelBoxes() {
    List<Map<String, dynamic>> hotels = [

      {
        'name': 'Hotel Royal Bengal',
        'image': 'https://lh3.googleusercontent.com/p/AF1QipNE2Hxumh1Y9XFpgsD4gLal8oF873teaFagnHOG=w287-h192-n-k-rw-no-v1',
        'price': 15600
      },
      {
        'name': 'Hotel Hill View',
        'image': 'https://lh3.googleusercontent.com/p/AF1QipPSVK77gdv7HSzpeVapby4o2qUip3ZIhmn4LaE=w287-h192-n-k-rw-no-v1',
        'price': 9000
      },
      {
        'name': 'Hotel Plaza Bandarban',
        'image': 'https://lh3.googleusercontent.com/p/AF1QipP6LSO-qy5JdeEUOMmfZYB-vqjhR4s6magGN_GZ=w287-h192-n-k-rw-no-v1',
        'price': 5300
      },
    ];

    return _buildHotelCardList(hotels);
  }

  Widget _buildSylhetHotelBoxes() {
    List<Map<String, dynamic>> hotels = [
      {
        'name': 'Grand Sylhet Hotel',
        'image': 'https://cf.bstatic.com/xdata/images/hotel/270x200/364031722.jpg?k=5e4db10f8054306702c1809864c3059ecc1103d2510e52cb3639f42b8f72d1a8&o=',
        'price': 18500
      },
      {
        'name': 'Nirvana Inn',
        'image': 'https://cf.bstatic.com/xdata/images/hotel/square200/55628117.webp?k=77ff65b92c89ac2f4ca5ec99c04c9064425042d61cefad24744117f563c6b924&o=',
        'price': 15000
      },
      {
        'name': 'Hotel Metro International',
        'image': 'https://cf.bstatic.com/xdata/images/hotel/square200/334101979.webp?k=cb9e4a902e98c68cdec1efe22b2772041932afdc2701d9dcbf85a4e47775774f&o=',
        'price': 13700
      },
      {
        'name': 'Hotel Star Specific',
        'image': 'https://cf.bstatic.com/xdata/images/hotel/270x200/304658253.jpg?k=f77adf1708b6f04d88fd3623191a14b6f59963f965099b588f16012afd269305&o=',
        'price': 10500
      },
      {
        'name': 'Hotel Supreme',
        'image': 'https://cf.bstatic.com/xdata/images/hotel/square200/115409352.webp?k=89caa48fbe098d5df7162b33ae8ed789a4699634a225b3e87dac0f71f82e256c&o=',
        'price': 6700
      }
    ];

    return _buildHotelCardList(hotels);
  }

  Widget _buildSunamgonjHotelBoxes() {
    List<Map<String, dynamic>> hotels = [
      {
        'name': 'Grand Hotel',
        'image': 'https://lh5.googleusercontent.com/p/AF1QipOPsjQH1PdvJm9BnyshhmKMdBBVO1WFTyWBAo4Q=s204-w204-h116-p-n-k-no',
        'price': 10000
      },
      {
        'name': 'Tribbo Trend Winsome',
        'image': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/27/68/09/61/treebo-trend-winsome.jpg?w=300&h=300&s=1',
        'price': 7000
      },
      {
        'name': 'La Mansion',
        'image': 'https://dynamic-media-cdn.tripadvisor.com/media/partner/bookingcom/photo-o/2a/e8/9e/dd/caption.jpg?w=300&h=300&s=1',
        'price': 4500
      },
    ];

    return _buildHotelCardList(hotels);
  }

  Widget _buildHotelCardList(List<Map<String, dynamic>> hotels) {
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
