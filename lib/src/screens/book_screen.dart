import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _salonController = TextEditingController();
  final TextEditingController _hairdresserController = TextEditingController();

  @override
  void dispose() {
    _salonController.dispose();
    _hairdresserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Your Appointment'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TableCalendar(
                focusedDay: _selectedDate,
                firstDay: DateTime.utc(2020, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _salonController,
                decoration: const InputDecoration(
                  labelText: 'Salon Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.store),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _hairdresserController,
                decoration: const InputDecoration(
                  labelText: 'Hairdresser Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the booking logic here
                  final salonName = _salonController.text;
                  final hairdresserName = _hairdresserController.text;
                  final bookingDate = _selectedDate;
      
                  if (salonName.isNotEmpty && hairdresserName.isNotEmpty) {
                    // Example of what you could do with the input
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Booking Confirmed'),
                        content: Text(
                          'Salon: $salonName\nHairdresser: $hairdresserName\nDate: ${bookingDate.toLocal().toShortString()}',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill all fields'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Center(
                  child: Text('Book Appointment', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  String toShortString() {
    return "$day/$month/$year";
  }
}
