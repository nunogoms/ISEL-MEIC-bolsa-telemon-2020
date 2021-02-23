import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_dev.dart';

class BluetoothController {
  FlutterBlue _flutterBlue  = FlutterBlue.instance;
  FlutterBluetoothSerial _flutterBluetoothClassic = FlutterBluetoothSerial.instance;

  void scanDevices(int timeoutInSeconds,  Function(BluetoothDev) valueCB){
    // this line will start scanning bluetooth devices
    //_flutterBlue.scan(timeout: Duration(seconds: timeoutInSeconds)).listen((scanResult) => valueCB(scanResult));
    _flutterBluetoothClassic.startDiscovery().listen( (BluetoothDiscoveryResult bdResult) => {
      valueCB(BluetoothDev(bdResult.device.name!=null?bdResult.device.name:"",bdResult.device.address))
    });
  }

  //Future<void> stopScanning() async => await _flutterBlue.stopScan();
  Future<void> stopScanning() async {
    await _flutterBluetoothClassic.cancelDiscovery().then((_) =>  _flutterBlue.stopScan());
  }

}