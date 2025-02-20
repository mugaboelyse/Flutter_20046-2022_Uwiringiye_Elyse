import 'package:flutter/material.dart';
import 'add_parked_car_screen.dart';
import 'add_parking_meter_screen.dart';
import 'ticket_report_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parking Ticket System')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddParkedCarScreen()),
                );
              },
              child: Text('Add Parked Car'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddParkingMeterScreen()),
                );
              },
              child: Text('Add Parking Meter'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketReportScreen()),
                );
              },
              child: Text('View Tickets Report'),
            ),
          ],
        ),
      ),
    );
  }
}
