import 'package:flutter/material.dart';
import 'roomselectionpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'databaseService.dart';

void main() {
  runApp(MaterialApp(
    home: HotelPage(),
  ));
}

class HotelPage extends StatefulWidget {
  @override
  _HotelPageState createState() => _HotelPageState();
  //final DatabaseService databaseService = DatabaseService();
}

class _HotelPageState extends State<HotelPage> {

  String selectedCountry = 'Cox\'s Bazar';
  DateTime? checkInDate;
  DateTime? checkOutDate;
  DatabaseService6 databaseService6 = DatabaseService6();



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
            _buildCountryDropdown(context),
            SizedBox(height: 16),
            _buildDateSelection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryDropdown(BuildContext context) {
    List<String> countries = [
      'Cox\'s Bazar',
      'Rangamati',
      'Sylhet',
      'Sunamgonj',
      'Bandarban'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DropdownButton<String>(
                value: selectedCountry,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCountry = newValue!;
                  });
                },
                items: countries.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }




  Widget _buildDateSelection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Check-in Date: ${checkInDate?.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context, true),
              child: Text('Select Check-in'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Check-out Date: ${checkOutDate?.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context, false),
              child: Text('Select Check-out'),
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn ? checkInDate ?? DateTime.now() : checkOutDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          checkInDate = picked;
        } else {
          checkOutDate = picked;
        }
      });

      // Store selected dates using DatabaseService
      await databaseService6.storeSelectedDates(checkInDate, checkOutDate);

      // Show confirmation message
      final String message = isCheckIn
          ? 'Check-in date selected: ${picked.toLocal()}'
          : 'Check-out date selected: ${picked.toLocal()}';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate to the CountryDetailPage
      if (!isCheckIn && selectedCountry.isNotEmpty) {
        _onCountryBoxTapped(context, selectedCountry);
      }
    }
  }

  Future<void> _storeSelectedDates() async {
    try {
      // Reference to Firestore collection (you may need to replace 'dates' with your desired collection name)
      CollectionReference datesCollection = FirebaseFirestore.instance
          .collection('dates');

      // Store the selected dates in Firestore
      await datesCollection.add({
        'checkInDate': checkInDate,
        'checkOutDate': checkOutDate,
      });
    } catch (e) {
      print('Error storing dates: $e');
    }
  }
}

  void _onCountryBoxTapped(BuildContext context, String country) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CountryDetailPage(country),
    ),
  );
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
      body: _buildHotelBoxes(country),
    );
  }

  Widget _buildHotelBoxes(String country) {
    List<Map<String, dynamic>> hotels = getHotelData(country);

    return _buildHotelCardList(hotels);
  }

  List<Map<String, dynamic>> getHotelData(String country) {
    // Return hotel data based on the selected country
    // You can customize this method based on your actual data
    if (country == 'Cox\'s Bazar') {
      return [

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
    } else if (country == 'Rangamati') {
      return [
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
    } else if (country == 'Bandarban') {
      return [

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
    } else if (country == 'Sylhet') {
      return [
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
    } else if (country == 'Sunamgonj') {
      return [
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
    } else {
      return [];
    }
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
}
