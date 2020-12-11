import 'package:bitalino/bitalino.dart';
import 'package:flutter/services.dart';
import 'package:telemon_app/src/services/platforms/platform.dart';

class AndroidOperations implements PlatformOperations {
  @override
  static Future<BITalinoController> connectToBluetoothDevice() async {
    BITalinoController bitalinoController = BITalinoController(
      "20:15:12:22:84:72",
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