import 'package:bitalino/bitalino.dart';
import 'package:flutter/services.dart';
import 'package:telemon_app/src/services/platforms/platform.dart';

class AndroidOperations implements PlatformOperations {
  @override
  static Future<BITalinoController> connectToBluetoothDevice(String macAddress) async {
    BITalinoController bitalinoController = BITalinoController(
      macAddress,
      CommunicationType.BTH,
    );

    try {
      await bitalinoController.initialize();
      return bitalinoController;
    } on PlatformException catch (Exception) {
      print("Initialization failed: ${Exception.message}");
    }
  }

}