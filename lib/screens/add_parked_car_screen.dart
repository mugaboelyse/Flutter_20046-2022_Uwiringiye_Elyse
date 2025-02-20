import 'package:flutter/material.dart';
import '../models/ParkedCar.dart';
//import '../database/databaseHelper.dart';
import '../services/DatabaseHelper.dart';

class AddParkedCarScreen extends StatefulWidget {
  @override
  _AddParkedCarScreenState createState() => _AddParkedCarScreenState();
}

class _AddParkedCarScreenState extends State<AddParkedCarScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _makeController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _minutesController = TextEditingController();

  Future<void> _saveCar() async {
    if (_formKey.currentState!.validate()) {
      ParkedCar car = ParkedCar(
        make: _makeController.text,
        model: _modelController.text,
        color: _colorController.text,
        licenseNumber: _licenseController.text,
        parkedMinutes: int.parse(_minutesController.text),
      );
      await DatabaseHelper.instance.insert('parked_cars', car.toMap());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Parked Car')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _makeController,
                decoration: InputDecoration(labelText: 'Make'),
                validator: (value) => value!.isEmpty ? 'Enter car make' : null,
              ),
              TextFormField(
                controller: _modelController,
                decoration: InputDecoration(labelText: 'Model'),
                validator: (value) => value!.isEmpty ? 'Enter car model' : null,
              ),
              TextFormField(
                controller: _colorController,
                decoration: InputDecoration(labelText: 'Color'),
                validator: (value) => value!.isEmpty ? 'Enter car color' : null,
              ),
              TextFormField(
                controller: _licenseController,
                decoration: InputDecoration(labelText: 'License Number'),
                validator: (value) => value!.isEmpty ? 'Enter license number' : null,
              ),
              TextFormField(
                controller: _minutesController,
                decoration: InputDecoration(labelText: 'Minutes Parked'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter parked minutes' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveCar,
                child: Text('Save Car'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
