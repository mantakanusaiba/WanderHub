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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildHotelCard(context, {
                  'name': 'Deluxe Room',
                  'price': 5200,
                  'image':
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/10/b4/05/the-cox-today-limited.jpg?w=300&h=200&s=1',
                  'facilities': [
                    {'icon': Icons.hotel, 'name': 'Extra Bed'},
                    {'icon': Icons.iron, 'name': 'Iron Facilities'},
                    {'icon': Icons.local_drink, 'name': 'Bottled Water'},
                    {'icon': Icons.wifi, 'name': 'Wi-Fi'},
                    {'icon': Icons.bathtub, 'name': 'Shower'},
                    {'icon': Icons.tv, 'name': 'TV'},
                    {'icon': Icons.free_breakfast, 'name': 'Tea'},
                    {'icon': Icons.local_cafe, 'name': 'Coffee Maker'},
                    {'icon': Icons.ac_unit, 'name': 'Air Conditioning'},
                    {'icon': Icons.kitchen, 'name': 'Fridge'},
                    {'icon': Icons.bathroom, 'name': 'Personal Bathroom'},
                  ],
                }),
                buildHotelCard(context, {
                  'name': 'Deluxe Twin Room',
                  'price': 4460,
                  'image':
                  'https://www.momondo.com/himg/3c/7c/4b/expediav2-713372-d206e5-950457.jpg',
                  'facilities': [
                    {'icon': Icons.wifi, 'name': 'Wi-Fi'},
                    {'icon': Icons.iron, 'name': 'Iron Facilities'},
                    {'icon': Icons.bathtub, 'name': 'Shower'},
                    {'icon': Icons.tv, 'name': 'TV'},
                    {'icon': Icons.free_breakfast, 'name': 'Tea'},
                    {'icon': Icons.ac_unit, 'name': 'Air Conditioning'},
                    {'icon': Icons.kitchen, 'name': 'Fridge'},
                    {'icon': Icons.bathroom, 'name': 'Personal Bathroom'},
                  ],
                }),

                buildHotelCard(context, {
                  'name': 'Superior Double Room',
                  'price': 4100,
                  'image':
                  'https://q-xx.bstatic.com/xdata/images/hotel/max500/243701987.jpg?k=c7c1fe6c4010c987a3564aab5496e60437e107bbd4c20d04345d4651f1c7276c&o=',
                  'facilities': [

                    {'icon': Icons.ac_unit, 'name': 'Air Conditioning'},

                    {'icon': Icons.wifi, 'name': 'Wi-Fi'},
                    {'icon': Icons.bathtub, 'name': 'Shower'},
                    {'icon': Icons.tv, 'name': 'TV'},
                    {'icon': Icons.free_breakfast, 'name': 'Tea'},
                    {'icon': Icons.local_cafe, 'name': 'Coffee Maker'},

                    {'icon': Icons.kitchen, 'name': 'Fridge'},

                  ],
                }),


                buildHotelCard(context, {
                  'name': 'Family Room',
                  'price': 5300,
                  'image':
                  'https://www.momondo.com/himg/3c/7c/4b/expediav2-713372-d206e5-950457.jpg',
                  'facilities': [
                    {'icon': Icons.hotel, 'name': 'Extra Bed'},
                    {'icon': Icons.iron, 'name': 'Iron Facilities'},

                    {'icon': Icons.wifi, 'name': 'Wi-Fi'},
                    {'icon': Icons.bathtub, 'name': 'Shower'},
                    {'icon': Icons.tv, 'name': 'TV'},
                    {'icon': Icons.free_breakfast, 'name': 'Tea'},

                    {'icon': Icons.ac_unit, 'name': 'Air Conditioning'},
                    {'icon': Icons.kitchen, 'name': 'Fridge'},


                  ],
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHotelCard(BuildContext context, Map<String, dynamic> hotelData) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  hotelData['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
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
                    SizedBox(height: 16),
                    FacilityRow(
                      hotelData['facilities']
                          .take(3)
                          .map<Widget>((facility) => FacilityIconButton(
                          facility['icon'], facility['name']))
                          .toList(),
                    ),
                    SizedBox(height: 8),
                    FacilityRow(
                      hotelData['facilities']
                          .skip(3)
                          .take(3)
                          .map<Widget>((facility) => FacilityIconButton(
                          facility['icon'], facility['name']))
                          .toList(),
                    ),
                    SizedBox(height: 8),
                    FacilityRow(
                      hotelData['facilities']
                          .skip(6)
                          .take(3)
                          .map<Widget>((facility) => FacilityIconButton(
                          facility['icon'], facility['name']))
                          .toList(),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the payment page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(hotelData),
                            ),
                          );
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
    List<Widget> displayedChildren = children.take(3).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: displayedChildren,
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
      onPressed: () {},
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


class PaymentPage extends StatefulWidget {
  final Map<String, dynamic> hotelData;

  PaymentPage(this.hotelData);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedPaymentMethod = 'Debit Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Payment for ${widget.hotelData['name']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Total Price: \$${widget.hotelData['price']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Radio(
                  value: 'Debit Card',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value.toString();
                    });
                  },
                ),
                Text('Debit Card'),
                Radio(
                  value: 'BKash',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value.toString();
                    });
                  },
                ),
                Text('BKash'),
                Radio(
                  value: 'Nagad',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value.toString();
                    });
                  },
                ),
                Text('Nagad'),
              ],
            ),
            if (selectedPaymentMethod == 'Debit Card')
              SizedBox(height: 16),
            if (selectedPaymentMethod == 'Debit Card')
              TextFormField(
                controller: cardNumberController,
                decoration: InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
              ),
            if (selectedPaymentMethod == 'Debit Card')
              SizedBox(height: 12),
            if (selectedPaymentMethod == 'Debit Card')
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: expirationDateController,
                      decoration: InputDecoration(labelText: 'Expiration Date'),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: cvvController,
                      decoration: InputDecoration(labelText: 'CVV'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            if (selectedPaymentMethod == 'BKash' || selectedPaymentMethod == 'Nagad')
              SizedBox(height: 16),
            if (selectedPaymentMethod == 'BKash' || selectedPaymentMethod == 'Nagad')
              TextFormField(
                controller: mobileNumberController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
              ),
            if (selectedPaymentMethod == 'BKash' || selectedPaymentMethod == 'Nagad')
              SizedBox(height: 12),
            if (selectedPaymentMethod == 'BKash' || selectedPaymentMethod == 'Nagad')
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {

                handlePayment();
              },
              child: Text('Complete Payment'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                padding: EdgeInsets.symmetric(horizontal: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handlePayment() {

    if (selectedPaymentMethod == 'Debit Card') {

    } else if (selectedPaymentMethod == 'BKash') {

      String mobileNumber = mobileNumberController.text;
      String password = passwordController.text;

    } else if (selectedPaymentMethod == 'Nagad') {

      String mobileNumber = mobileNumberController.text;
      String password = passwordController.text;

    }


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Thank you for your payment!'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate back to the room selection page
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
