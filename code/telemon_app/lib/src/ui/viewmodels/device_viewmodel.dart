import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_controller.dart';
import 'package:telemon_app/src/data/services/device_service/bitalino_controller.dart';

const macAddress = "20:15:12:22:84:72"; //TODO change

class DeviceViewModel extends ChangeNotifier {
  String currDeviceMac = "";
  int timeOutInSeconds = 10;

  BitalinoController _deviceController = BitalinoController();
  BluetoothController _bluetoothController = BluetoothController();

  Future<void> connectDevice() async {
    if (currDeviceMac.isEmpty)
      await _deviceController.connectToDevice(macAddress);
    currDeviceMac = _deviceController.getDeviceAddress();
    notifyListeners();
  }

  void getCurrDeviceMac() {
    notifyListeners();
  }

  disconnectDevice() async {

  }

  searchAllDevices() async {
    _bluetoothController.scanDevices(timeOutInSeconds);
  }


}
