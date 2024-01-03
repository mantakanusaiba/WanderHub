import 'package:flutter/material.dart';

class BusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Booking',
          style: TextStyle(fontSize: 24,
              fontFamily: 'Pacifico-Regular'),
        ),
          backgroundColor: Colors.lightBlueAccent,
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
  final List<String> destination2 = ['Cox\s Bazar', 'Rangamati', 'Bandarban','Sylhet','Sunamganj'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bus Booking',
          style: TextStyle(fontSize: 24, fontFamily: 'Pacifico-Regular'),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              hint: Text('From'),
              value: _selectedFrom,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFrom = newValue;
                });
              },
              items: destinations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              hint: Text('To'),
              value: _selectedTo,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTo = newValue;
                });
              },
              items: destination2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
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

  final List<BusDetails> busList = [
    BusDetails(name: 'Shohag Paribahan(AC)', availableSeats: 20, ticketPrice: 1600.0),
    BusDetails(name: 'Shohag Paribahan(Non AC)', availableSeats: 15, ticketPrice: 800.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bus Search Results',
          style: TextStyle(fontSize: 24, fontFamily: 'Pacifico-Regular'),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('From: ${widget.from}'),
            Text('To: ${widget.to}'),
            Text('Date of Journey: ${widget.dateOfJourney?.toLocal()}'),
            Text('Date of Return: ${widget.dateOfReturn?.toLocal()}'),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: busList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(busList[index].name),
                      subtitle: Text(
                        'Available Seats: ${busList[index].availableSeats}, Ticket Price: \$${busList[index].ticketPrice}',
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedBus = busList[index];
                          });

                          _showSeatSelectionDialog(context);
                        },
                        child: Text('Book Now'),
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
    List<String> allSeats = List.generate(selectedBus?.availableSeats ?? 0, (index) => (index + 1).toString());

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seat Selection - ${selectedBus?.name ?? ""}'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Available Seats: ${selectedBus?.availableSeats ?? 0}'),
                  SizedBox(height: 16),
                  Text('Selected Seats: ${selectedSeats.join(', ')}'),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: allSeats.map((seat) {
                      bool isSelected = selectedSeats.contains(seat);

                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (isSelected) {
                              selectedSeats.remove(seat);
                            } else {
                              selectedSeats.add(seat);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: isSelected ? Colors.blueAccent : Colors.white38,
                        ),
                        child: Text(seat),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _showConfirmationDialog(context);
                        },
                        child: Text('Book Now'),
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
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bus: ${selectedBus?.name ?? ""}'),
              Text('Selected Seats: ${selectedSeats.join(', ')}'),
              Text('Total Price: \$${(selectedBus?.ticketPrice ?? 0) * selectedSeats.length}'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  IconWithText({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
          ),
          SizedBox(height: 8),
          Text(text),
        ],
      ),
    );
  }
}
     
