import 'package:flutter/material.dart';
import 'databaseService.dart';

class FlightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Booking',
          style: TextStyle(fontSize: 24,
              fontFamily: 'Pacifico-Regular'),
        ),
         backgroundColor: Colors.cyan,
      ),
    );
  }
}

class FlightBookingPage extends StatefulWidget {
  @override
  _FlightBookingPageState createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage> {
  DateTime? _selectedDateOfDeparture;
  DateTime? _selectedDateOfReturn;
  String? _selectedFrom;
  String? _selectedTo;

  final List<String> destinations = ['Dhaka', 'Chittagong', 'Sylhet'];
  final List<String> destination2 = ['Cox\'s Bazar', 'Sylhet'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flight Booking',
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
                  child: Text(value, style: TextStyle(fontFamily: 'Pacifico-Regular')),
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
                  child: Text(value, style: TextStyle(fontFamily: 'Pacifico-Regular')),
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
                      if (picked != null && picked != _selectedDateOfDeparture) {
                        setState(() {
                          _selectedDateOfDeparture = picked;
                        });
                      }
                    },
                    child: Text('Date of Departure', style: TextStyle(fontFamily: 'Pacifico-Regular')),
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
                    child: Text('Date of Return', style: TextStyle(fontFamily: 'Pacifico-Regular')),
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
                    builder: (context) => FlightSearchResultsPage(
                      from: _selectedFrom,
                      to: _selectedTo,
                      dateOfDeparture: _selectedDateOfDeparture,
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
                  Text('Search Flight', style: TextStyle(fontFamily: 'Pacifico-Regular')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightDetails {
  final String name;
  final int availableSeats;
  final double ticketPrice;

  FlightDetails({
    required this.name,
    required this.availableSeats,
    required this.ticketPrice,
  });
}

class FlightSearchResultsPage extends StatefulWidget {
  final String? from;
  final String? to;
  final DateTime? dateOfDeparture;
  final DateTime? dateOfReturn;

  FlightSearchResultsPage({
    this.from,
    this.to,
    this.dateOfDeparture,
    this.dateOfReturn,
  });

  @override
  _FlightSearchResultsPageState createState() => _FlightSearchResultsPageState();
}

class _FlightSearchResultsPageState extends State<FlightSearchResultsPage> {
  List<String> selectedSeats = [];
  FlightDetails? selectedFlight;

  final List<FlightDetails> flightList = [
    FlightDetails(name: 'Bangladesh Airlines', availableSeats: 50, ticketPrice: 2500.0),
    FlightDetails(name: 'Novoair', availableSeats: 30, ticketPrice: 3000.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flight Search Results',
          style: TextStyle(fontFamily: 'Pacifico-Regular'),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('From: ${widget.from}', style: TextStyle(fontFamily: 'Pacifico-Regular')),
            Text('To: ${widget.to}', style: TextStyle(fontFamily: 'Pacifico-Regular')),
            Text('Date of Departure: ${widget.dateOfDeparture?.toLocal()}',
                style: TextStyle(fontFamily: 'Pacifico-Regular')),
            Text('Date of Return: ${widget.dateOfReturn?.toLocal()}',
                style: TextStyle(fontFamily: 'Pacifico-Regular')),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: flightList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(flightList[index].name,style: TextStyle(fontFamily: 'Pacifico-Regular')),
                      subtitle: Text(
                          'Available Seats: ${flightList[index].availableSeats}, Ticket Price: \$${flightList[index].ticketPrice}',
                          style: TextStyle(fontFamily: 'Pacifico-Regular')),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedFlight = flightList[index];
                          });

                          _showSeatSelectionDialog(context);
                        },
                        child: Text('Book Now', style: TextStyle(fontFamily: 'Pacifico-Regular')),
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
    List<String> allSeats = List.generate(selectedFlight?.availableSeats ?? 0, (index) => (index + 1).toString());

    return showDialog<void>(
      context: currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seat Selection - ${selectedFlight?.name ?? ""}', style: TextStyle(fontFamily: 'Pacifico-Regular')),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Available Seats: ${selectedFlight?.availableSeats ?? 0}',
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
                        child: Text(seat, style: TextStyle(fontFamily: 'Pacifico-Regular')),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(currentContext).pop();
                        },
                        child: Text('Cancel', style: TextStyle(fontFamily: 'Pacifico-Regular')),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.of(currentContext).pop();
                          await _showConfirmationDialog(currentContext);
                        },
                        child: Text('Book Now', style: TextStyle(fontFamily: 'Pacifico-Regular')),
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
    DatabaseService2 databaseService = DatabaseService2();

    await databaseService.addBooking(
      from: widget.from!,
      to: widget.to!,
      dateOfDeparture: widget.dateOfDeparture!,
      dateOfReturn: widget.dateOfReturn!,
      flightName: selectedFlight?.name ?? '',
      selectedSeats: selectedSeats,
      totalPrice: (selectedFlight?.ticketPrice ?? 0) * selectedSeats.length,
    );

    showDialog<void>(
      context: currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Flight: ${selectedFlight?.name ?? ""}', style: TextStyle(fontFamily: 'Pacifico-Regular')),
              Text('Selected Seats: ${selectedSeats.join(', ')}',
                  style: TextStyle(fontFamily: 'Pacifico-Regular')),
              Text('Total Price: \$${(selectedFlight?.ticketPrice ?? 0) * selectedSeats.length}',
                  style: TextStyle(fontFamily: 'Pacifico-Regular')),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(currentContext).pop();
              },
              child: Text('OK', style: TextStyle(fontFamily: 'Pacifico-Regular')),
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
          Text(text, style: TextStyle(fontFamily: 'Pacifico-Regular')),
        ],
      ),
    );
  }
}
