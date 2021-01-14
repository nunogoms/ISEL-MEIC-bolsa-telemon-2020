import 'dart:core';

import 'package:bitalino/bitalino.dart';
import 'package:flutter/services.dart';
import 'file:///C:/Users/nunom/Documents/ISEL/Bolsa-Telemonitorization/CODE-ISEL-MEIC-bolsa-telemon-2020/code/telemon_app/lib/src/data/services/platforms/platform.dart';

import '../../device_service/device_exceptions.dart';

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