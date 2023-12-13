import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  Widget buildContainer(BuildContext context, String imageUrl, String title, Widget destinationPage) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WanderHub', style: TextStyle(fontSize: 30.0, color: Colors.black.withOpacity(0.8),
            fontFamily: 'Pacifico-Regular',
        ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1498522437123-3a7624402acb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                height: 250,
                width: 500,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Text(
                  'Welcome to WanderHub - Your Ultimate Travel Companion',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Pacifico-Regular',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Explore Bangladesh',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildContainer(context, 'https://www.shutterstock.com/image-photo/beauty-saint-martin-island-coxs-600nw-2308207335.jpg', 'Cox Bazar', DestinationPage1()),
                buildContainer(context, 'https://www.shutterstock.com/image-photo/rangamati-located-chittagong-division-bordered-600nw-2271327159.jpg', 'Rangamati', DestinationPage2()),
                buildContainer(context, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/06/e2/71/sangu-river.jpg?w=500&h=400&s=1', 'Bandarban', DestinationPage3()),
                buildContainer(context, 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Jaflong_Sylhet.jpg', 'Sylhet', DestinationPage4()),
                buildContainer(context, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Sajek_Valley_Rangamati_2.jpg/150px-Sajek_Valley_Rangamati_2.jpg', 'Sajek', DestinationPage5()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cox Bazar',
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Cox Bazar is a beautiful place with pristine beaches and crystal-clear waters. '
                  'Enjoy your time on this tropical paradise, known for its breathtaking landscapes and vibrant culture. Here are some must-visit attractions:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            buildAttraction('1.Cox\'s Bazar Beach',
                'Embark on an unforgettable seaside experience along one of the world\'s longest sandy stretches.',
                'https://res.cloudinary.com/dnvftrlhk/image/upload/f_webp/c_fill,h_360,w_573/v1694241741/tour_image/coxs-bazar-saint-martins-island-package/coxs-bazar-saint-martins-island-package.73.jpg'),
            buildAttraction('2.Himchari National Park',
                'Immerse yourself in nature with hiking trails and glimpses of diverse wildlife.',
                'https://images.hive.blog/0x0/https://files.peakd.com/file/peakd-hive/sid-rahman/246G4diJfHrXcsxFWwm2QpAhNQqJxwpQtp6c3ZnVb2RhxyGFazjtwoatwxBUJ2DqWg2tW.jpg'),
            buildAttraction('3.Inani Beach',
                'Escape the crowds and enjoy the serene beauty of this less-explored coastal gem.',
                'https://media.licdn.com/dms/image/C5612AQECwV0Mz-lmSw/article-cover_image-shrink_600_2000/0/1520123385570?e=2147483647&v=beta&t=0gbOwlLEa07fzvsBlMTGraq9FfnU5-26Bb-_J-li7E0'),
            buildAttraction('4.Laboni Point and Sea Beach',
                'Witness breathtaking sunsets and soak in the lively local atmosphere.',
                'https://3.bp.blogspot.com/-ePoJKzSaRfU/VWsLv9xeEJI/AAAAAAAAAP8/0neU0qDw0IQ/s640/%253B.jpg'),
            buildAttraction('5.Burmese Market',
                'It is a highly attractive place in Cox’s Bazar. A group of tribe people from Burma mainly settled their business here.',
                'https://www.shutterstock.com/image-photo/traditional-burmese-umbrellas-colorful-street-600nw-637765711.jpg'),
            buildAttraction('5.Marine Drive',
                'Take a scenic drive or leisurely stroll along the picturesque beachside road.',
                'https://images.squarespace-cdn.com/content/v1/6102abeba9fd55174a180768/10a1784d-d574-4aa3-84fa-672feaf6ed70/Marine+drive+road.jpg'),
            SizedBox(height: 20),
            Text(
              'Indulge in the vibrant local markets and savor traditional Bangladeshi cuisine to complete your memorable stay!',
              style: TextStyle(fontSize: 16),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            SizedBox(height:8),
            Text(
              description,
              style: TextStyle(fontSize: 15),
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
        title: Text('Rangamati'),
      ),
      body: Center(
        child: Text('Details about Rangamati'),
      ),
    );
  }
}

class DestinationPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandarban'),
      ),
      body: Center(
        child: Text('Details about Bandarban'),
      ),
    );
  }
}

class DestinationPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sylhet'),
      ),
      body: Center(
        child: Text('Details about Sylhet'),
      ),
    );
  }
}

class DestinationPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sajek'),
      ),
      body: Center(
        child: Text('Details about Sajek'),
      ),
    );
  }
}