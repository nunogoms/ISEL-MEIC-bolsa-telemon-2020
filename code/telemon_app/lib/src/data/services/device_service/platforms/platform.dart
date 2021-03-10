import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_dev.dart';

//Interface
abstract class PlatformOperations{
  Future<BITalinoController> connectBluetoothLEDevice( BluetoothDev bluetoothDev);
  Future<BITalinoController> connectBluetoothClassicDevice( BluetoothDev bluetoothDev) ;
}