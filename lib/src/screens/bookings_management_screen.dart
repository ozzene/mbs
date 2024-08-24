import 'package:flutter/material.dart';

class BookingRequestScreen extends StatelessWidget {
  final List<Map<String, String>> bookingRequests = [
    {
      'salonName': 'ABC Hair Salon',
      'Client': 'John Doe',
      'date': '24/08/2024',
      'time': '10:00 AM',
    },
    {
      'salonName': 'XYZ Beauty Spa',
      'Client': 'Jane Smith',
      'date': '25/08/2024',
      'time': '2:00 PM',
    },
    {
      'salonName': 'Elegance Salon',
      'Client': 'Emily Clark',
      'date': '26/08/2024',
      'time': '11:00 AM',
    },
  ];

  BookingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Requests'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: bookingRequests.length,
        itemBuilder: (context, index) {
          final booking = bookingRequests[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking['salonName']!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Client: ${booking['hairdresserName']}'),
                  Text('Date: ${booking['date']}'),
                  Text('Time: ${booking['time']}'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle accepting the booking
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Accepted booking for ${booking['salonName']}'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                        ),
                        child: const Text('Accept'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle declining the booking
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Declined booking for ${booking['salonName']}'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                        ),
                        child: const Text('Decline'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

