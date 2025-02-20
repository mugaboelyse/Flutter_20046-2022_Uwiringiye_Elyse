/*
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parking Ticket System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
*/
import 'package:flutter/material.dart';
//import 'screens/add_parked_car_screen.dart';
import 'models/ParkedCar.dart';
import 'models/ParkingMeter.dart';
//import 'models/ParkingTicket.dart';
import 'models/PoliceOfficer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking Ticket Simulator',
      home: ParkingForm(),
    );
  }
}

class ParkingForm extends StatefulWidget {
  @override
  _ParkingFormState createState() => _ParkingFormState();
}

class _ParkingFormState extends State<ParkingForm> {
  final _carMakeController = TextEditingController();
  final _carModelController = TextEditingController();
  final _licenseController = TextEditingController();
  final _minutesController = TextEditingController();
  final _meterController = TextEditingController();
  final _officerNameController = TextEditingController();
  final _badgeNumberController = TextEditingController();

  String report = '';

  void _generateReport() {
    ParkedCar car = ParkedCar(
      make: _carMakeController.text,
      model: _carModelController.text,
      licenseNumber: _licenseController.text,
      parkedMinutes: int.parse(_minutesController.text), color: '',
    );
    ParkingMeter meter = ParkingMeter(purchasedMinutes: int.parse(_meterController.text));
    PoliceOfficer officer = PoliceOfficer(name: _officerNameController.text, badgeNumber: _badgeNumberController.text);

    officer.issueTicket(car, meter);

    setState(() {
      report = 'Ticket issued for ${car.toString()} by Officer ${officer.name}.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parking Ticket System')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _carMakeController, decoration: InputDecoration(labelText: 'Car Make')),
            TextField(controller: _carModelController, decoration: InputDecoration(labelText: 'Car Model')),
            TextField(controller: _licenseController, decoration: InputDecoration(labelText: 'License Number')),
            TextField(controller: _minutesController, decoration: InputDecoration(labelText: 'Minutes Parked')),
            TextField(controller: _meterController, decoration: InputDecoration(labelText: 'Meter Minutes')),
            TextField(controller: _officerNameController, decoration: InputDecoration(labelText: 'Officer Name')),
            TextField(controller: _badgeNumberController, decoration: InputDecoration(labelText: 'Badge Number')),
            ElevatedButton(
              onPressed: _generateReport,
              child: Text('Generate Ticket'),
            ),
            SizedBox(height: 20),
            Text(report, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

