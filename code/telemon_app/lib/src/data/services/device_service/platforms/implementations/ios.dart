import 'package:bitalino/bitalino.dart';
import 'package:flutter/services.dart';
import 'package:telemon_app/src/data/services/device_service/device_exceptions.dart';

import '../platform.dart';

class IosOperations implements PlatformOperations {
  @override
  Future<BITalinoController> connectToBluetoothDevice(String uuid) async {
    BITalinoController bitalinoController = BITalinoController(
      uuid,
      CommunicationType.BLE,
    );

    try {
      await bitalinoController.initialize();
    } on PlatformException catch (Exception) {
      throw new BluetoothConnectionException(Exception.message);
    }
  }
}
