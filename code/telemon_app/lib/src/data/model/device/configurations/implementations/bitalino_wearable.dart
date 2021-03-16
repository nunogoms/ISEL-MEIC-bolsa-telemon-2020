import 'package:telemon_app/src/data/model/device/sensors/implementations/eda_sensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/implementations/lux_sensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/sensor_name.dart';

import '../device_channels.dart';
import '../idevice.dart';
import '../sensor_module.dart';

class BitalinoWearable extends IDevice {
  @override
  String name = "BitalinoWearable";

  @override
  List<SensorModule> sensors = [
    SensorModule(
        sensor: EdaSensor(),
        deviceChannel: DeviceChannel.A1,
        name: SensorName.EDA),
    SensorModule(
        sensor: LuxSensor(),
        deviceChannel: DeviceChannel.A6, //TODO ask because it should be channel A5
        name: SensorName.LUX)
  ];
}
