import 'dart:core';

import 'package:bitalino/bitalino.dart';
import 'package:flutter/services.dart';
import 'package:telemon_app/src/data/services/device_service/device_exceptions.dart';

import '../platform.dart';


class AndroidOperations implements PlatformOperations {
  @override
  Future<BITalinoController> connectToBluetoothDevice(String macAddress) async {
    BITalinoController bitalinoController = BITalinoController(
      macAddress,
      CommunicationType.BLE,
    );

    try {
      await bitalinoController.initialize();
      return bitalinoController;
    } on PlatformException catch (Exception) {
      throw new BluetoothConnectionException(Exception.message);
    }
  }
}