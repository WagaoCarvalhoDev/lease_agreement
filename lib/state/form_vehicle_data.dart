import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste/entity/vehicle.dart';

final formVehicleDataProvider =
    ChangeNotifierProvider((ref) => FormVehicleData());

class FormVehicleData extends ChangeNotifier {
  late String plate = '';
  late String year = '';
  late String brandModel = '';
  late String chassis = '';

  void updateData(Vehicle vehicle) {
    plate = vehicle.plate ?? '';
    year = vehicle.year ?? '';
    brandModel = vehicle.brandModel ?? '';
    chassis = vehicle.chassis ?? '';
    notifyListeners();
  }
}
