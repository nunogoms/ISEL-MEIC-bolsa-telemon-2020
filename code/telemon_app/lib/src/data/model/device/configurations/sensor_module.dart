import 'package:telemon_app/src/data/model/device/configurations/device_channels.dart';
import 'package:telemon_app/src/data/model/device/sensors/isensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/sensor_name.dart';

/// A module represents the join between the connection and the electrodes, meaning
/// it needs to contain both the sensor and all the information relative to it.
class SensorModule {
  /// The sensor that powers this module
  final ISensor sensor;

  //TODO check se tem de ser lista
  ///The channels through which this module receives data, right now, it only
  ///allows for single channel capture.
  final DeviceChannel deviceChannel;
  /// The name for the module, since some cases might take more than one value, the
  /// names might be different.
  final SensorName name;

  SensorModule(
      {required this.sensor, required this.deviceChannel, required this.name});

//todo check if this makes sense
//double measure(int frequency);
}
