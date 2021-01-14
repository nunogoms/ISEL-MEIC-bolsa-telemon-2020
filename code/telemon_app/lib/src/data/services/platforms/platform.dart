import 'package:bitalino/bitalino.dart';

//Interface
abstract class PlatformOperations{
  Future<BITalinoController> connectToBluetoothDevice( String macAddress) ;
}