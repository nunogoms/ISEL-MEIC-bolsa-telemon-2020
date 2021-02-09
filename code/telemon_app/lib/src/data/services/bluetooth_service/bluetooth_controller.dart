import 'package:flutter_blue/flutter_blue.dart';

class BluetoothController {
  FlutterBlue _flutterBlue  = FlutterBlue.instance;

  List<ScanResult> scanDevices(int timeoutInSeconds,  Function valueCB){
    // this line will start scanning bluetooth devices
    _flutterBlue.scan(timeout: Duration(seconds: timeoutInSeconds)).listen((scanResult) => valueCB(scanResult));
  }

  Future<void> stopScanning() async => await _flutterBlue.stopScan();
}