import 'package:flutter/material.dart';
import '../models/ParkingTicket.dart';
//import '../database/database_helper.dart';
import '../services/DatabaseHelper.dart';

class TicketReportScreen extends StatefulWidget {
  @override
  _TicketReportScreenState createState() => _TicketReportScreenState();
}

class _TicketReportScreenState extends State<TicketReportScreen> {
  late Future<List<ParkingTicket>> _ticketList;

  @override
  void initState() {
    super.initState();
    _ticketList = _fetchTickets();
  }

  Future<List<ParkingTicket>> _fetchTickets() async {
    final List<Map<String, dynamic>> tickets =
        await DatabaseHelper.instance.queryAll('parking_tickets');
    return tickets.map((ticket) => ParkingTicket.fromMap(ticket)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parking Ticket Reports')),
      body: FutureBuilder<List<ParkingTicket>>(
        future: _ticketList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching tickets'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tickets available'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              ParkingTicket ticket = snapshot.data![index];
              return Card(
                child: ListTile(
                  title: Text('${ticket.make} ${ticket.model}'),
                  subtitle: Text(
                      'License: ${ticket.licenseNumber}\nFine: \$${ticket.fine}\nOfficer: ${ticket.officerName} (${ticket.badgeNumber})'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
