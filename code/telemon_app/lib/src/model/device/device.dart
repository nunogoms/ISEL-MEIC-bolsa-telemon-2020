import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/services/bluetooth_service.dart';

class DeviceController extends ChangeNotifier{
  //TODO change to singleton
  static BITalinoController bitalinoController;
  static const String macID = "20:15:12:22:84:72";

  Future<void> connect() async {
    if(bitalinoController==null){
      bitalinoController = await BluetoothService.connectToDevice(macID);
      notifyListeners();
    }
  }

  String getAddress() {
    return bitalinoController.address;
}

  BITalinoController getController() {
    return bitalinoController;
  }

//TODO guarantee a connection is closed if the app crashes



}