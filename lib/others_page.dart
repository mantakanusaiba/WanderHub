import 'package:flutter/material.dart';

class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Others',
          style: TextStyle(fontSize: 24, fontFamily: 'Pacifico-Regular'),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Why WanderHub?',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico-Regular'
              ),
            ),
            SizedBox(height: 16),
            Text(
              'User-Friendly Interface: WanderHub offers a user-friendly and intuitive interface that makes it easy for users of all tech-skill levels to search for and book flights. Whether you\'re a seasoned traveller or a first-time flyer, the platform ensures a smooth booking experience.\n\n'
                  'Extensive Ticket & Hotel Options: WanderHub provides access to an extensive ticket options database and over 1 hundred hotel options. This wide selection allows users to compare various prices to find the most suitable vehicle for their needs and the idle hotel stay.\n\n'
                  'Customer Support: WanderHub understands the importance of customer support. They have a dedicated customer service team ready to assist users with any queries or issues they may encounter during the booking process or their travel journey.\n\n'
                  'Travel Packages: WanderHub provides users with the option to book not only tickets but also complete travel packages. This can include accommodation, transportation, and activities, making it a one-stop shop for travel planning.\n\n'
                  'Local Expertise: Being a Bangladeshi travel tech company, WanderHub possesses local expertise and insights that can be invaluable for travellers exploring Bangladesh. They can provide tips and recommendations for unique experiences and hidden gems in the country.\n\n'
                  'In summary, WanderHub stands out as Bangladesh\'s top travel tech company due to its user-friendly platform, extensive flight options, competitive pricing, security measures, and dedication to customer support. Travelers can rely on WanderHub for a hassle-free and enjoyable booking experience.',
              style: TextStyle(fontSize: 16,
                  fontFamily: 'Dancing Script'),
            ),
          ],
        ),
      ),
    );
  }
}
