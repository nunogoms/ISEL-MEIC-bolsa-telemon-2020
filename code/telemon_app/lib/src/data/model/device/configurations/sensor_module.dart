import 'package:telemon_app/src/data/model/device/configurations/device_channels.dart';
import 'package:telemon_app/src/data/model/device/sensors/isensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/sensor_name.dart';

class SensorModule {
  final ISensor sensor;

  //TODO check se tem de ser lista
  final DeviceChannel deviceChannel;
  final SensorName name;

  SensorModule(
      {required this.sensor, required this.deviceChannel, required this.name});

//todo check if this makes sense
//double measure(int frequency);
}
