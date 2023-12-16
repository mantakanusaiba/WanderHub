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
        title: Text('Rangamati',
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
              'Rangamati is a picturesque district located in the Chittagong Hill Tracts of Bangladesh. '
                  'It is known for its stunning landscapes, serene lakes, and vibrant indigenous cultures. Here are some places you might want to visit in Rangamati:',
              style: TextStyle(fontSize: 18,fontFamily:'DancingScript-Regular'),
            ),
            SizedBox(height: 20),
            buildAttraction2('1.Kaptai Lake',
                'This is the largest man-made lake in Bangladesh which offers breathtaking views of the surrounding hills and is a popular spot for boat rides.',
                'https://images.unsplash.com/photo-1576419326170-74f6f9451993?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction2('2.Shuvolong Waterfall',
                'Located near Kaptai Lake, Shuvolong is a beautiful waterfall surrounded by lush greenery.',
                'https://images.unsplash.com/photo-1525824236856-8c0a31dfe3be?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction2('3.Jhulonto Bridge',
                'It\'s a great place to take a leisurely stroll while enjoying the scenic beauty of the Karnaphuli river and the hills.',
                'https://upload.wikimedia.org/wikipedia/commons/7/73/Hanging_bridge_of_Rangamati%2C_Bangladesh._.jpg'),
            SizedBox(height: 20),
            Text(
              'Moreover, explore Rangamati\'s history at Rajbari museum, tranquility at Rajbon Bihar, and scenic views from Peda Ting Ting hill. Discover indigenous cultures at the Tribal Museum. Stay uniquely at Borkol Eco Cottage or Tuk Tuk Eco Village for a compact yet diverse Rangamati experience.',
              style: TextStyle(fontSize: 16,fontFamily: 'Pacifico-Regular'),
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Pacifico-Regular'),
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
            style: TextStyle(fontSize: 15,fontFamily:'DancingScript-Regular'),
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
        title: Text('Bandarban',
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'),
            ),
            Text(
                  'Enjoy a captivating destination known for its scenic landscapes, indigenous cultures, and natural attractions:',
              style: TextStyle(fontSize: 18,fontFamily:'DancingScript-Regular'),
            ),
            SizedBox(height: 20),
            buildAttraction3('1.Nilgiri Hills',
                'Welcome to Nilgiri, where the clouds dance with the mountains. Enjoy panoramic views and cool breezes from one of the highest peaks in Bangladesh.',
                'https://images.unsplash.com/photo-1624485871361-65454b13edfa?q=80&w=2058&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction3('2.Meghla Tourist Complex',
                'Discover the Meghla Tourist Complex, offering a variety of attractions such as a zoo, boat rides, and a hanging bridge. ',
                'https://images.unsplash.com/photo-1651923675044-a25776b5a25f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWVnaGxhJTIwYmFuZGFyYmFufGVufDB8fDB8fHww'),
            buildAttraction3('3.Nafakhum Waterfall',
                'Embrace the serenity of Nafakhum, the largest waterfall in Bangladesh.',
                'https://images.unsplash.com/photo-1558673810-9b0b6316d4f4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            buildAttraction3('4.Sangu River',
                'A significant waterway surrounded by hills covered with dense forests.',
                'https://images.unsplash.com/photo-1586948298331-a07cd866d3bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bWVnaGxhJTIwYmFuZGFyYmFufGVufDB8fDB8fHww'),
            buildAttraction3('5.Chimbuk Hill',
                'Revel in the breathtaking views of the surrounding hills and landscapes.',
                'https://upload.wikimedia.org/wikipedia/commons/1/1b/Chimbuk_Hill_-_panoramio.jpg'),
            buildAttraction3('6.Nilachol',
                'A mesmerizing hill station known for its panoramic views, mist-covered peaks, and lush green landscapes.',
                'https://images.unsplash.com/photo-1578599133584-d632fdcaa733?q=80&w=2038&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            SizedBox(height: 20),
            Text(
              'As you embark on your journey through Bandarban, may each destination leave you with lasting memories of natural beauty and cultural diversity!',
              style: TextStyle(fontSize: 16,fontFamily: 'Pacifico-Regular'),
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Pacifico-Regular'),
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
            style: TextStyle(fontSize: 15,fontFamily:'DancingScript-Regular'),
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
