import 'package:flutter/material.dart';
import 'databaseService.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class BusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Booking',
          style: TextStyle(fontSize: 24,
              fontFamily: 'Pacifico-Regular'),
        ),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}

class BusBookingPage extends StatefulWidget {
  @override
  _BusBookingPageState createState() => _BusBookingPageState();
}

class _BusBookingPageState extends State<BusBookingPage> {
  DateTime? _selectedDateOfJourney;
  DateTime? _selectedDateOfReturn;
  String? _selectedFrom;
  String? _selectedTo;

  final List<String> destinations = ['Dhaka', 'Chattogram', 'Sylhet'];
  final List<String> destination2 = ['Cox\'s Bazar', 'Rangamati', 'Bandarban','Sylhet','Sunamganj'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bus Booking',
          style: TextStyle(fontSize: 24, fontFamily: 'Pacifico-Regular'),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              hint: Text('From',style: TextStyle(fontFamily: 'Pacifico-Regular')),
              value: _selectedFrom,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFrom = newValue;
                });
              },
              items: destinations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(fontFamily: 'Pacifico-Regular')),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              hint: Text('To',style: TextStyle(fontFamily: 'Pacifico-Regular')),
              value: _selectedTo,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTo = newValue;
                });
              },
              items: destination2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(fontFamily: 'Pacifico-Regular')),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != _selectedDateOfJourney) {
                        setState(() {
                          _selectedDateOfJourney = picked;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      textStyle: TextStyle(fontFamily: 'Pacifico-Regular'),
                    ),
                    child: Text('Date of Journey'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != _selectedDateOfReturn) {
                        setState(() {
                          _selectedDateOfReturn = picked;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      textStyle: TextStyle(fontFamily: 'Pacifico-Regular'),
                    ),
                    child: Text('Date of Return'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusSearchResultsPage(
                      from: _selectedFrom,
                      to: _selectedTo,
                      dateOfJourney: _selectedDateOfJourney,
                      dateOfReturn: _selectedDateOfReturn,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                textStyle: TextStyle(fontFamily: 'Pacifico-Regular'),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Text('Search Bus'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BusDetails {
  final String name;
  final int availableSeats;
  final double ticketPrice;

  BusDetails({
    required this.name,
    required this.availableSeats,
    required this.ticketPrice,
  });
}

class BusSearchResultsPage extends StatefulWidget {
  final String? from;
  final String? to;
  final DateTime? dateOfJourney;
  final DateTime? dateOfReturn;

  BusSearchResultsPage({
    this.from,
    this.to,
    this.dateOfJourney,
    this.dateOfReturn,
  });

  @override
  _BusSearchResultsPageState createState() => _BusSearchResultsPageState();
}
class _BusSearchResultsPageState extends State<BusSearchResultsPage> {
  List<String> selectedSeats = [];
  BusDetails? selectedBus;

  Map<String, List<String>> bookedSeatsMap = {};

  final List<BusDetails> busList = [
    BusDetails(
        name: 'Shohag Paribahan(AC)', availableSeats: 20, ticketPrice: 1600.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bus Search Results',
          style: TextStyle(fontSize: 24, fontFamily: 'Pacifico-Regular'),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('From: ${widget.from}',
                style: TextStyle(fontFamily: 'Pacifico-Regular')),
            Text('To: ${widget.to}',
                style: TextStyle(fontFamily: 'Pacifico-Regular')),
            Text('Date of Journey: ${widget.dateOfJourney?.toLocal()}',
                style: TextStyle(fontFamily: 'Pacifico-Regular')),
            Text('Date of Return: ${widget.dateOfReturn?.toLocal()}',
                style: TextStyle(fontFamily: 'Pacifico-Regular')),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: busList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(busList[index].name,
                          style: TextStyle(fontFamily: 'Pacifico-Regular')),
                      subtitle: Text(
                          'Available Seats: ${busList[index]
                              .availableSeats}, Ticket Price: \$${busList[index]
                              .ticketPrice}',
                          style: TextStyle(fontFamily: 'Pacifico-Regular')
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedBus = busList[index];
                          });

                          _showSeatSelectionDialog(context);
                        },
                        child: Text('Book Now',
                            style: TextStyle(fontFamily: 'Pacifico-Regular')),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showSeatSelectionDialog(BuildContext context) async {
    final currentContext = context;
    bool isBookingInProgress = false; // New state variable

    List<String> allSeats = List.generate(
        selectedBus?.availableSeats ?? 0, (index) => (index + 1).toString());

    List<String> bookedSeats = bookedSeatsMap[selectedBus!.name] ?? [];
    allSeats.removeWhere((seat) => bookedSeats.contains(seat));

    return showDialog<void>(
      context: currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seat Selection - ${selectedBus?.name ?? ""}',
              style: TextStyle(fontFamily: 'Pacifico-Regular')),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Available Seats: ${allSeats.length}',
                      style: TextStyle(fontFamily: 'Pacifico-Regular')),
                  SizedBox(height: 16),
                  Text('Selected Seats: ${selectedSeats.join(', ')}',
                      style: TextStyle(fontFamily: 'Pacifico-Regular')),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: allSeats.map((seat) {
                      bool isSelected = selectedSeats.contains(seat);

                      return ElevatedButton(
                        onPressed: isBookingInProgress ? null : () {
                          setState(() {
                            if (isSelected) {
                              selectedSeats.remove(seat);
                            } else {
                              selectedSeats.add(seat);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isSelected ? Colors.cyan : Colors.white38,
                        ),
                        child: Text(seat,
                            style: TextStyle(fontFamily: 'Pacifico-Regular')),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: isBookingInProgress ? null : () {
                          Navigator.of(currentContext).pop();
                        },
                        child: Text('Cancel', style: TextStyle(
                            fontFamily: 'Pacifico-Regular')),
                      ),
                      ElevatedButton(
                        onPressed: isBookingInProgress ? null : () async {
                          setState(() {
                            isBookingInProgress = true;
                          });
                          bookedSeatsMap.update(selectedBus!.name, (value) =>
                          [
                            ...value,
                            ...selectedSeats
                          ], ifAbsent: () => [...selectedSeats]);
                          await _showConfirmationDialog(currentContext);
                          setState(() {
                            isBookingInProgress = false;
                          });
                        },
                        child: isBookingInProgress
                            ? CircularProgressIndicator()
                            : Text('Book Now', style: TextStyle(
                            fontFamily: 'Pacifico-Regular')),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }


  Future<void> _showConfirmationDialog(BuildContext context) async {
    final currentContext = context;
    DatabaseService1 databaseService = DatabaseService1();

    await databaseService.addBooking(
      from: widget.from!,
      to: widget.to!,
      dateOfJourney: widget.dateOfJourney!,
      dateOfReturn: widget.dateOfReturn!,
      busName: selectedBus?.name ?? '',
      selectedSeats: selectedSeats,
      totalPrice: (selectedBus?.ticketPrice ?? 0) * selectedSeats.length,
    );

    showDialog<void>(
      context: currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bus: ${selectedBus?.name ?? ""}',
                  style: TextStyle(fontFamily: 'Pacifico-Regular')),
              Text('Selected Seats: ${selectedSeats.join(', ')}',
                  style: TextStyle(fontFamily: 'Pacifico-Regular')),
              Text('Total Price: \$${(selectedBus?.ticketPrice ?? 0) *
                  selectedSeats.length}',
                  style: TextStyle(fontFamily: 'Pacifico-Regular')),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(currentContext).pop();
                _showNotification();
              },
              child: Text(
                  'OK', style: TextStyle(fontFamily: 'Pacifico-Regular')),
            ),
          ],
        );
      },
    );
  }

  void _showNotification() async {
    try {
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        //'channel_description',
        playSound: true,
        importance: Importance.max,
        priority: Priority.high,
      );
      var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );
      await FlutterLocalNotificationsPlugin().show(
        0,
        'Booking Confirmed',
        'Your booking has been confirmed.',
        platformChannelSpecifics,
        payload: 'booking_confirmed',
      );
    } catch (e) {
      print('Error showing notification: $e');
    }
  }
}

