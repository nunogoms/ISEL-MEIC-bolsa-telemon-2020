import 'package:bitalino/bitalino.dart';

class BluetoothDev {
  final String name;
  //final String uuid;
  final String macId;
  final CommunicationType blType;

  BluetoothDev({this.name="", required this.macId,required this.blType});
}