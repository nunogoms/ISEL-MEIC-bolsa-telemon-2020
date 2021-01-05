import 'dart:core';

import 'package:bitalino/bitalino.dart';
import 'package:flutter/services.dart';
import 'package:telemon_app/src/services/platforms/platform.dart';

import '../../device_exceptions.dart';

class AndroidOperations implements PlatformOperations {
  @override
  Future<BITalinoController> connectToBluetoothDevice( String macAddress) async {
    BITalinoController bitalinoController = BITalinoController(
      macAddress,
      CommunicationType.BTH,
    );

    try {
      await bitalinoController.initialize();
      return bitalinoController;
    } on PlatformException catch (Exception) {
      throw new BluetoothConnectionException(Exception.message);
    }
  }

}