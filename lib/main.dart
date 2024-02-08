import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wanderhub/notificationDestinationPage.dart';
import 'chat_screen.dart';
import 'package:wanderhub/databaseService.dart';
import 'package:wanderhub/home.dart';
import 'package:wanderhub/login_page.dart';
import 'authListener.dart';
import 'firebase_options.dart';
import 'tour_page.dart';
import 'hotel_page.dart';
import 'bus.dart';
import 'flight.dart';
import 'others_page.dart';
import 'business.dart';
import 'global_variables.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  MaterialApp(
    debugShowCheckedModeBanner: false,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthListener(),
      routes: {
        '/notice_page': (context) => NotificationDestination(),
      },
    );
  }
}


class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _handleLoginButtonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthListener()),
    );
  }



  void _handleHotelButtonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HotelPage()),
    );
  }

  void _handleTourButtonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TourPage()),
    );
  }

  void _handleBusButtonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BusBookingPage()),
    );
  }

  void _handleFlightButtonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FlightBookingPage()),
    );
  }

  void _handleBusinessButtonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BusinessPage()),
    );
  }

  void _handleOthersButtonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OthersPage()),
    );
  }

  Widget buildContainer(BuildContext context, String imageUrl, String title,
      Widget destinationPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        margin: EdgeInsets.all(25),
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico-Regular',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WanderHub',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black.withOpacity(0.8),
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan[300],
              ),
              child: Text(
                'WanderHub',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Pacifico-Regular',
                ),
              ),
            ),
            _buildLoginTile(() {
              _handleLoginButtonPress(context);
            }),
            ListTile(
              leading:
                  Icon(Icons.business_center_outlined, color: Colors.cyan[800]),
              title: Text(
                'For Business',
                style: TextStyle(
                  fontFamily: 'Pacifico-Regular',
                ),
              ),
              onTap: () {
                _handleBusinessButtonPress(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.question_mark, color: Colors.cyan[800]),
              title: Text(
                'Others',
                style: TextStyle(
                  fontFamily: 'Pacifico-Regular',
                ),
              ),
              onTap: () {
                _handleOthersButtonPress(context);
              },
            ),
        _buildLogoutTile(context),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1498522437123-3a7624402acb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 80,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to WanderHub!\nYour Ultimate Travel Companion',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            _handleBusButtonPress(context);
                          },
                          icon: Row(
                            children: [
                              Icon(
                                Icons.directions_bus_filled_rounded,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Bus',
                                style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            _handleFlightButtonPress(context);
                          },
                          icon: Row(
                            children: [
                              Icon(
                                Icons.airplane_ticket_rounded,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Flight',
                                style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            _handleHotelButtonPress(context);
                          },
                          icon: Row(
                            children: [
                              Icon(Icons.hotel),
                              SizedBox(width: 8.0),
                              Text(
                                'Hotel',
                                style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            _handleTourButtonPress(context);
                          },
                          icon: Row(
                            children: [
                              Icon(Icons.beach_access_rounded),
                              SizedBox(width: 8.0),
                              Text(
                                'Tour',
                                style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Explore Bangladesh',
            style: TextStyle(
              fontFamily: 'Pacifico-Regular',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildContainer(
                  context,
                  'https://images.unsplash.com/photo-1414609245224-afa02bfb3fda?q=80&w=1889&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D.jpg',
                  'Cox Bazar',
                  DestinationPage1(),
                ),
                buildContainer(
                  context,
                  'https://images.unsplash.com/photo-1636553353871-e02bf0afb7da?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHJhbmdhbWF0aXxlbnwwfHwwfHx8MA%3D%3D',
                  'Rangamati',
                  DestinationPage2(),
                ),
                buildContainer(
                  context,
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/06/e2/71/sangu-river.jpg?w=500&h=400&s=1',
                  'Bandarban',
                  DestinationPage3(),
                ),
                buildContainer(
                  context,
                  'https://upload.wikimedia.org/wikipedia/commons/4/4d/Jaflong_Sylhet.jpg',
                  'Sylhet',
                  DestinationPage4(),
                ),
                buildContainer(
                  context,
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO4lq5w7DU-OwyIp0NL12nKg942tFLQScGvw&usqp=CAU',
                  'Sunamgonj',
                  DestinationPage5(),
                ),
              ],
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
          },
          child: Icon(Icons.chat,
          color:Colors.white,
          size: 30,),
            backgroundColor:Colors.cyan,
        )
    );
  }
}



Widget _buildLoginTile(VoidCallback onTapCallback) {
  return ListTile(
    leading: Icon(Icons.person, color: Colors.cyan[800]),
    title: Text(
     'View Profile',
      style: TextStyle(
        fontFamily: 'Pacifico-Regular',
      ),
    ),
    onTap: onTapCallback,
  );
}

Widget _buildLogoutTile(BuildContext context) {
  return ListTile(
    leading: Icon(Icons.exit_to_app_rounded, color: Colors.cyan[800]),
    title: Text(
      'Log Out',
      style: TextStyle(
        fontFamily: 'Pacifico-Regular',
      ),
    ),
    onTap: () async {
      bool? logoutConfirmed = await _showLogoutConfirmationDialog(context);
      if (logoutConfirmed==true) {
        await DatabaseService().logoutUser();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'You are logged out.',
              style: TextStyle(
                fontFamily: 'Pacifico-Regular',
              ),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red[600],
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      }
    },
  );
}

Future<bool?> _showLogoutConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Are you sure you want to logout?',
          style: TextStyle(
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Pacifico-Regular',
                color: Colors.green,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'Pacifico-Regular',
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    },
  );
}



Widget buildContainer(BuildContext context, String imageUrl, String title,
    Widget destinationPage) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destinationPage),
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

class DestinationPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cox Bazar',
          style: TextStyle(fontFamily: 'Pacifico-Regular'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1608958435020-e8a7109ba809?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y294JTIwYmF6YXIlMjBzZWElMjBiZWFjaHxlbnwwfHwwfHx8MA%3D%3D',
              height: 200,
              width: 480,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Cox\'s Bazar, a haven for beach enthusiasts!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Cox Bazar is a beautiful place with pristine beaches and crystal-clear waters. '
              'Enjoy your time on this tropical paradise, known for its breathtaking landscapes and vibrant culture. Here are some must-visit attractions:',
              style: TextStyle(fontSize: 18, fontFamily: 'Dancing Script'),
            ),
            SizedBox(height: 20),
            buildAttraction(
                '1.Cox\'s Bazar Beach',
                'Embark on an unforgettable seaside experience along one of the world\'s longest sandy stretches.',
                'https://images.unsplash.com/photo-1687340148555-e060afb6aee1?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction(
                '2.Himchari National Park',
                'Immerse yourself in nature with hiking trails and glimpses of diverse wildlife.',
                'https://images.hive.blog/0x0/https://files.peakd.com/file/peakd-hive/sid-rahman/246G4diJfHrXcsxFWwm2QpAhNQqJxwpQtp6c3ZnVb2RhxyGFazjtwoatwxBUJ2DqWg2tW.jpg'),
            buildAttraction(
                '3.Inani Beach',
                'Escape the crowds and enjoy the serene beauty of this less-explored coastal gem.',
                'https://media.licdn.com/dms/image/C5612AQECwV0Mz-lmSw/article-cover_image-shrink_600_2000/0/1520123385570?e=2147483647&v=beta&t=0gbOwlLEa07fzvsBlMTGraq9FfnU5-26Bb-_J-li7E0'),
            buildAttraction(
                '4.Laboni Point and Sea Beach',
                'Witness breathtaking sunsets and soak in the lively local atmosphere.',
                'https://3.bp.blogspot.com/-ePoJKzSaRfU/VWsLv9xeEJI/AAAAAAAAAP8/0neU0qDw0IQ/s640/%253B.jpg'),
            buildAttraction(
                '5.Burmese Market',
                'It is a highly attractive place in Cox’s Bazar. A group of tribe people from Burma mainly settled their business here.',
                'https://www.shutterstock.com/image-photo/traditional-burmese-umbrellas-colorful-street-600nw-637765711.jpg'),
            buildAttraction(
                '6.Marine Drive',
                'Take a scenic drive or leisurely stroll along the picturesque beachside road.',
                'https://images.squarespace-cdn.com/content/v1/6102abeba9fd55174a180768/10a1784d-d574-4aa3-84fa-672feaf6ed70/Marine+drive+road.jpg'),
            SizedBox(height: 20),
            Text(
              'Indulge in the vibrant local markets and savor traditional Bangladeshi cuisine to complete your memorable stay!',
              style: TextStyle(fontSize: 16, fontFamily: 'Pacifico-Regular'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAttraction(String title, String description, String imageUrl) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.lightBlue[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' $title:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 15, fontFamily: 'Dancing Script'),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class DestinationPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rangamati',
          style: TextStyle(fontFamily: 'Pacifico-Regular'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1697560000533-02df4c5a1a47?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              height: 200,
              width: 480,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Rangamati!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Rangamati is a picturesque district located in the Chittagong Hill Tracts of Bangladesh. '
              'It is known for its stunning landscapes, serene lakes, and vibrant indigenous cultures. Here are some places you might want to visit in Rangamati:',
              style: TextStyle(fontSize: 18, fontFamily: 'Dancing Script'),
            ),
            SizedBox(height: 20),
            buildAttraction2(
                '1.Kaptai Lake',
                'This is the largest man-made lake in Bangladesh which offers breathtaking views of the surrounding hills and is a popular spot for boat rides.',
                'https://images.unsplash.com/photo-1576419326170-74f6f9451993?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction2(
                '2.Shuvolong Waterfall',
                'Located near Kaptai Lake, Shuvolong is a beautiful waterfall surrounded by lush greenery.',
                'https://images.unsplash.com/photo-1525824236856-8c0a31dfe3be?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction2(
                '3.Jhulonto Bridge',
                'It\'s a great place to take a leisurely stroll while enjoying the scenic beauty of the Karnaphuli river and the hills.',
                'https://upload.wikimedia.org/wikipedia/commons/7/73/Hanging_bridge_of_Rangamati%2C_Bangladesh._.jpg'),
            SizedBox(height: 20),
            Text(
              'Moreover, explore Rangamati\'s history at Rajbari museum, tranquility at Rajbon Bihar, and scenic views from Peda Ting Ting hill. Discover indigenous cultures at the Tribal Museum. Stay uniquely at Borkol Eco Cottage or Tuk Tuk Eco Village for a compact yet diverse Rangamati experience.',
              style: TextStyle(fontSize: 16, fontFamily: 'Pacifico-Regular'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildAttraction2(String title, String description, String imageUrl) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    color: Colors.lightBlue[100],
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' $title:',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico-Regular'),
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 15, fontFamily: 'Dancing Script'),
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}

class DestinationPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bandarban',
          style: TextStyle(fontFamily: 'Pacifico-Regular'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1631642386603-5618fa038ad1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YmFuZGFyYmFufGVufDB8fDB8fHww',
              height: 200,
              width: 480,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Bandarban, a mesmerizing destination nestled in the Chittagong Hill Tracts.',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Enjoy a captivating destination known for its scenic landscapes, indigenous cultures, and natural attractions:',
              style: TextStyle(fontSize: 18, fontFamily: 'Dancing Script'),
            ),
            SizedBox(height: 20),
            buildAttraction3(
                '1.Nilgiri Hills',
                'Welcome to Nilgiri, where the clouds dance with the mountains. Enjoy panoramic views and cool breezes from one of the highest peaks in Bangladesh.',
                'https://images.unsplash.com/photo-1624485871361-65454b13edfa?q=80&w=2058&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction3(
                '2.Meghla Tourist Complex',
                'Discover the Meghla Tourist Complex, offering a variety of attractions such as a zoo, boat rides, and a hanging bridge. ',
                'https://images.unsplash.com/photo-1651923675044-a25776b5a25f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWVnaGxhJTIwYmFuZGFyYmFufGVufDB8fDB8fHww'),
            buildAttraction3(
                '3.Nafakhum Waterfall',
                'Embrace the serenity of Nafakhum, the largest waterfall in Bangladesh.',
                'https://images.unsplash.com/photo-1558673810-9b0b6316d4f4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction3(
                '4.Sangu River',
                'A significant waterway surrounded by hills covered with dense forests.',
                'https://images.unsplash.com/photo-1586948298331-a07cd866d3bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bWVnaGxhJTIwYmFuZGFyYmFufGVufDB8fDB8fHww'),
            buildAttraction3(
                '5.Chimbuk Hill',
                'Revel in the breathtaking views of the surrounding hills and landscapes.',
                'https://upload.wikimedia.org/wikipedia/commons/1/1b/Chimbuk_Hill_-_panoramio.jpg'),
            buildAttraction3(
                '6.Nilachol',
                'A mesmerizing hill station known for its panoramic views, mist-covered peaks, and lush green landscapes.',
                'https://images.unsplash.com/photo-1578599133584-d632fdcaa733?q=80&w=2038&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            SizedBox(height: 20),
            Text(
              'As you embark on your journey through Bandarban, may each destination leave you with lasting memories of natural beauty and cultural diversity!',
              style: TextStyle(fontSize: 16, fontFamily: 'Pacifico-Regular'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildAttraction3(String title, String description, String imageUrl) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    color: Colors.lightBlue[100],
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' $title:',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico-Regular'),
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 15, fontFamily: 'Dancing Script'),
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}

class DestinationPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sylhet',
          style: TextStyle(fontFamily: 'Pacifico-Regular'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://cdn-gdpal.nitrocdn.com/wYTsNDvTtivyqMQKozkdeShFCCdGExJz/assets/images/source/rev-b1c501a/wp-content/uploads/2022/07/2.jpg-1.png',
              height: 200,
              width: 480,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Sylhet!',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Sylhet, a picturesque region in northeastern Bangladesh, is known for its lush green landscapes, tea gardens, and cultural richness. '
              'Here\'s a short description of some notable places to visit in Sylhet:',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Dancing Script',
              ),
            ),
            SizedBox(height: 20),
            buildAttraction4(
                '1.Jaflong',
                'Jaflong is known for its breathtaking views and the Dawki River, providing a tranquil setting for visitors.',
                'https://images.unsplash.com/photo-1591267770966-2938561e2608?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction4(
                '2.Ratargul Swamp Forest',
                'Visitors can explore the serene surroundings by boat, enjoying the tranquility and spotting various species of flora and fauna.',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-JfM29IUGYamyBP7E2DfX7HFU1YTqLfPTug&usqp=CAU'),
            buildAttraction4(
                '3.Lakkatura Tea Garden',
                'Lakkatura provides guided tours, allowing visitors to learn about tea cultivation amidst beautiful surroundings.',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdLyM9ZtE7sZBWI1g_oUKQ8WIqyMtSkpCAP_ekrHyu7QM4MtXJmRl7tdCsNiWZxJoTqjA&usqp=CAU'),
            buildAttraction4(
                '4.Lalakhal',
                'Visitors can take boat rides to appreciate the scenic beauty, and the nearby Ratnodweep offers a serene retreat.',
                'https://i.redd.it/6vn40gmf33l61.jpg'),
            buildAttraction4(
                '5.Sada Pathor',
                'Visitors can explore the unique rock formations and witness the crystal-clear water flowing over the smooth white stones.',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE12XSWbSzo7q2YIE9uDXT3WF_-1TtN45GU0nzNmGQuEDTh8vtPvBfymZ937e2i8QI918&usqp=CAU'),
            buildAttraction4(
                '6.Bichanakandi',
                'The area is surrounded by hills and offers boat rides through the rivers, providing visitors with a unique and immersive experience.',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCHPgBErsCwG2syrNGlw54Uys7q-l0bpaWd1ZcbWw5joLhOJXGMtgihSYYgTnMTzyEg7o&usqp=CAU'),
            buildAttraction4(
                '7.Madhabkunda',
                'Visitors to Madhabkundu are greeted by the cascading waters of the waterfall, surrounded by lush greenery and rocky terrain.',
                'https://porzoton.com/wp-content/uploads/elementor/thumbs/Madhabkunda_Waterfall02-ovn6gewcn33xuo1fz6t5bui5yzq1uxsv5f48jbxlma.jpg'),
            SizedBox(height: 20),
            Text(
              'Sylhet\'s diverse attractions make it an appealing destination for nature lovers, history enthusiasts, and those seeking a peaceful retreat amidst natural beauty.',
              style: TextStyle(fontSize: 16, fontFamily: 'Pacifico-Regular'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAttraction4(String title, String description, String imageUrl) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.lightBlue[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' $title:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 15, fontFamily: 'Dancing Script'),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class DestinationPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sunamgonj',
          style: TextStyle(fontFamily: 'Pacifico-Regular'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://ruchiexplorelimitless.com/images/blog/1592080801.jpg',
              height: 200,
              width: 480,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Sunamgonj!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Sunamganj, located in the northeastern part of Bangladesh, is a district known for its enchanting landscapes and cultural richness.  '
              'Here are some must-visit attractions:',
              style: TextStyle(fontSize: 18, fontFamily: 'Dancing Script'),
            ),
            SizedBox(height: 20),
            buildAttraction5(
                '1.Tanguar Haor',
                'Visitors can experience serene boat rides, witness diverse bird species, and appreciate the harmonious coexistence of communities around the haor.',
                'https://images.unsplash.com/photo-1695277501535-691c6a843578?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction5(
                '2.Joynal Abedin Shimul Garden',
                'Feelings of mild cold, gentle breeze, mountains on one side, magical river waves in the middle, and the call of spring on the newly sprouted green leaves, as if Fagun\'s fire had started in the Shimul garden of Sunamganj.',
                'https://www.localguidesconnect.com/t5/image/serverpage/image-id/275429i7626C60BF788D8C0/image-size/large?v=v2&px=999'),
            buildAttraction5(
                '3.Niladri Lake',
                'Niladri Lake attracts many nature-lovers who enjoy the beauty of its hilly surroundings and blue water.It’s like losing in a blue kingdom.It seems, the place filled with the heavenly beauty.',
                'https://images.unsplash.com/photo-1695277501054-4270292dda00?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmlsYWRyaXxlbnwwfHwwfHx8MA%3D%3D'),
            buildAttraction5(
                '4.Jadukata Bridge',
                'It\'s a great place to take a leisurely stroll while enjoying the scenic beauty of the Jadukata river ',
                'https://photos.wikimapia.org/p/00/02/77/96/88_big.jpg'),
            SizedBox(height: 20),
            Text(
              'Sunamganj invites travelers to experience the serene beauty and cultural heritage that make it a distinctive destination in Bangladesh.',
              style: TextStyle(fontSize: 16, fontFamily: 'Pacifico-Regular'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAttraction5(String title, String description, String imageUrl) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.lightBlue[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' $title:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 15, fontFamily: 'Dancing Script'),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
