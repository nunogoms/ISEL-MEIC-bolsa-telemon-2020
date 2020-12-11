import 'package:bitalino/bitalino.dart';

//Interface
abstract class PlatformOperations{
  static Future<BITalinoController> connectToBluetoothDevice() async {}
}