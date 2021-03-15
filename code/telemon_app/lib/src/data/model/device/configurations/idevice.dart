import 'package:telemon_app/src/data/model/device/configurations/implementations/isel_bitalino.dart';
import 'package:telemon_app/src/data/model/device/configurations/sensor_module.dart';

abstract class IDevice {
  abstract String name ;
  abstract List<SensorModule> sensors;
}

enum DeviceImplementations { ISEL_BITALINO }

extension instance on DeviceImplementations {
  IDevice get value {
    switch (this) {
      case DeviceImplementations.ISEL_BITALINO:
        return IselBitalino();
    }
    throw new Exception(
        "The value $this is not a valid sensor"); //TODO exception management and string
  }
}