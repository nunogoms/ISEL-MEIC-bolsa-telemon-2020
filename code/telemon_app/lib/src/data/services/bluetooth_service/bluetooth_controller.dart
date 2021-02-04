import 'package:flutter_blue/flutter_blue.dart';

class BluetoothController {
  FlutterBlue _flutterBlue  = FlutterBlue.instance;

  scanDevices(int timeoutInSeconds){
    // this line will start scanning bluetooth devices
    List<ScanResult> devicesFound = List();
    _flutterBlue.scan(timeout: Duration(seconds: timeoutInSeconds)).listen((scanResult) =>
      devicesFound.add(scanResult)
    );
    return devicesFound;
  }
}