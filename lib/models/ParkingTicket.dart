class ParkingTicket {
  int? id;
  String make;
  String model;
  String color;
  String licenseNumber;
  double fine;
  String officerName;
  String badgeNumber;

  ParkingTicket({
    this.id,
    required this.make,
    required this.model,
    required this.color,
    required this.licenseNumber,
    required this.fine,
    required this.officerName,
    required this.badgeNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'make': make,
      'model': model,
      'color': color,
      'licenseNumber': licenseNumber,
      'fine': fine,
      'officerName': officerName,
      'badgeNumber': badgeNumber,
    };
  }

  static ParkingTicket fromMap(Map<String, dynamic> map) {
    return ParkingTicket(
      id: map['id'],
      make: map['make'],
      model: map['model'],
      color: map['color'],
      licenseNumber: map['licenseNumber'],
      fine: map['fine'],
      officerName: map['officerName'],
      badgeNumber: map['badgeNumber'],
    );
  }

  @override
  String toString() {
    return 'Ticket: $make $model, Color: $color, License: $licenseNumber, Fine: \$$fine, Issued by: $officerName ($badgeNumber)';
  }
}
