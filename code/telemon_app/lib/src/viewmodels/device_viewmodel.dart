import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/services/bitalino_controller.dart';

const macAddress = "20:15:12:22:84:72"; //TODO change

class DeviceViewModel extends ChangeNotifier {
  String currDeviceMac = "";

  BitalinoController _deviceController = BitalinoController();

  Future<void> connectDevice() async {
    if (currDeviceMac.isEmpty)
      await _deviceController.connectToDevice(macAddress);
    currDeviceMac = _deviceController.getDeviceAddress();
    notifyListeners();
  }

  void getCurrDeviceMac() {
    notifyListeners();
  }
}
