import 'package:flutter/material.dart';
import '../models/ParkingMeter.dart';
//import '../database/database_helper.dart';
import '../services/DatabaseHelper.dart';

class AddParkingMeterScreen extends StatefulWidget {
  @override
  _AddParkingMeterScreenState createState() => _AddParkingMeterScreenState();
}

class _AddParkingMeterScreenState extends State<AddParkingMeterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _minutesController = TextEditingController();

  Future<void> _saveMeter() async {
    if (_formKey.currentState!.validate()) {
      ParkingMeter meter = ParkingMeter(
        purchasedMinutes: int.parse(_minutesController.text),
      );
      await DatabaseHelper.instance.insert('parking_meters', meter.toMap());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Parking Meter')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _minutesController,
                decoration: InputDecoration(labelText: 'Minutes Purchased'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter purchased minutes' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMeter,
                child: Text('Save Meter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
