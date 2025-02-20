
class ParkedCar {
  int? id;
  String make;
  String model;
  String color;
  String licenseNumber;
  int parkedMinutes;

  ParkedCar({
    this.id,
    required this.make,
    required this.model,
    required this.color,
    required this.licenseNumber,
    required this.parkedMinutes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'make': make,
      'model': model,
      'color': color,
      'licenseNumber': licenseNumber,
      'parkedMinutes': parkedMinutes,
    };
  }

  static ParkedCar fromMap(Map<String, dynamic> map) {
    return ParkedCar(
      id: map['id'],
      make: map['make'],
      model: map['model'],
      color: map['color'],
      licenseNumber: map['licenseNumber'],
      parkedMinutes: map['parkedMinutes'],
    );
  }

  @override
  String toString() {
    return 'Car: $make $model, Color: $color, License: $licenseNumber, Parked Minutes: $parkedMinutes';
  }
}
