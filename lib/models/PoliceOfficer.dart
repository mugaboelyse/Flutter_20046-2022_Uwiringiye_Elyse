import 'ParkingTicket.dart';
import 'ParkedCar.dart';
import 'ParkingMeter.dart';

class PoliceOfficer {
  String name;
  String badgeNumber;

  PoliceOfficer({required this.name, required this.badgeNumber});

  ParkingTicket? issueTicket(ParkedCar car, ParkingMeter meter) {
    if (car.parkedMinutes > meter.purchasedMinutes) {
      int extraMinutes = car.parkedMinutes - meter.purchasedMinutes;
      double fine = 25.0 + ((extraMinutes / 60).ceil() - 1) * 10.0;

      return ParkingTicket(
        make: car.make,
        model: car.model,
        color: car.color,
        licenseNumber: car.licenseNumber,
        fine: fine,
        officerName: name,
        badgeNumber: badgeNumber,
      );
    }
    return null;
  }

  @override
  String toString() {
    return 'Officer: $name, Badge: $badgeNumber';
  }
}
