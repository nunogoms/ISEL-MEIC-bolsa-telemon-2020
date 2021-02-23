import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_controller.dart';
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_dev.dart';
import 'package:telemon_app/src/data/services/device_service/bitalino/bitalino_controller.dart';


class DeviceViewModel extends ChangeNotifier {
  String currDeviceMac = "";
  int timeOutInSeconds = 100;

  BitalinoController _deviceController = BitalinoController();
  BluetoothController _bluetoothController = BluetoothController();

  Future<void> connectDevice({String macAddress, String uuid}) async {
    if (currDeviceMac.isEmpty) {
      //TODO uncomment for bitalino
      await _deviceController.connectToDevice(uuid);
    }
    currDeviceMac = macAddress;
    notifyListeners();
  }

  void getCurrDeviceMac() {
    notifyListeners();
  }

  disconnectDevice() async {
    // TODO uncomment for bitalino
    _deviceController.disposeController();
    currDeviceMac= "";
    notifyListeners();
  }

  void scanDevices(Function(BluetoothDev) valueCB )  => _bluetoothController.scanDevices(timeOutInSeconds, valueCB );

  Future<void> stopScanning() async {
    await _bluetoothController.stopScanning();
  }
}
