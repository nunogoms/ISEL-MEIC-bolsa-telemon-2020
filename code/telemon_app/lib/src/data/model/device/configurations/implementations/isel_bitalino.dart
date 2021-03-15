import 'package:telemon_app/src/data/model/device/configurations/device_channels.dart';
import 'package:telemon_app/src/data/model/device/configurations/idevice.dart';
import 'package:telemon_app/src/data/model/device/configurations/sensor_module.dart';
import 'package:telemon_app/src/data/model/device/sensors/implementations/acc_sensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/implementations/ecg_sensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/implementations/eda_sensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/implementations/eeg_sensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/implementations/emg_sensor.dart';
import 'package:telemon_app/src/data/model/device/sensors/sensor_name.dart';

class IselBitalino extends IDevice{
  @override
  String name = "IselBitalino";

  @override
  List<SensorModule> sensors = [
    SensorModule(
        sensor: EmgSensor(),
        deviceChannel: DeviceChannel.A1,
        name: SensorName.EMG
    ),
    SensorModule(
        sensor: EcgSensor(),
        deviceChannel: DeviceChannel.A2,
        name: SensorName.ECG
    ),
    SensorModule(
        sensor: EdaSensor(),
        deviceChannel: DeviceChannel.A3,
        name: SensorName.EDA
    ),
    SensorModule(
        sensor: EegSensor(),
        deviceChannel: DeviceChannel.A4,
        name: SensorName.EEG
    ),
    SensorModule(
      sensor: AccSensor(),
      deviceChannel: DeviceChannel.A5,
      name: SensorName.ACC
    )
  ];

}

