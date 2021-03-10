import 'package:bitalino/bitalino.dart';
import 'package:bluez/bluez.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_dev.dart';

class BluetoothController {
  final FlutterBlue _flutterBlue = FlutterBlue.instance;
  final FlutterBluetoothSerial _flutterBluetoothClassic =
      FlutterBluetoothSerial.instance;
  final BlueZClient _blueZClient = BlueZClient(DBusClient.system()); //TODO try again and work or scrap

  Future<void> scanDevices(
      int timeoutInSeconds, Function(BluetoothDev) valueCB) async {
    // this line will scan bluetooth CLASSIC devices
    _flutterBluetoothClassic.startDiscovery().listen(
      // to only show defined devices such as bitalino
        (BluetoothDiscoveryResult scanResult) => scanResult.device.name != null && scanResult.device.name.isNotEmpty ? valueCB(BluetoothDev(
            macId: scanResult.device.address,
            name: scanResult.device.name,
            blType: CommunicationType.BTH)):"");
    // this line will scan bluetooth LOW ENERGY devices
    _flutterBlue
        .scan(timeout: Duration(seconds: timeoutInSeconds))
    // to only show defined devices such as bitalino
        .listen((scanResult) => scanResult.device.name != null && scanResult.device.name.isNotEmpty ? valueCB(BluetoothDev(
            macId: scanResult.device.id.id,
            name: scanResult.device.name != null ? scanResult.device.name : "",
            blType: CommunicationType.BLE)):"");
  }

  Future<void> stopScanning() async {
    await _flutterBluetoothClassic
        .cancelDiscovery()
        .then((_) => _flutterBlue.stopScan());
  }
}
