class ParkingMeter {
  int? id;
  int purchasedMinutes;

  ParkingMeter({this.id, required this.purchasedMinutes});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'purchasedMinutes': purchasedMinutes,
    };
  }

  static ParkingMeter fromMap(Map<String, dynamic> map) {
    return ParkingMeter(
      id: map['id'],
      purchasedMinutes: map['purchasedMinutes'],
    );
  }

  @override
  String toString() {
    return 'Parking Meter: Purchased Minutes: $purchasedMinutes';
  }
}
