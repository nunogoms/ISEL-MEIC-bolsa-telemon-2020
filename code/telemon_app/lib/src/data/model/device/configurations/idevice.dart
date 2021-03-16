import 'package:telemon_app/src/data/model/device/configurations/implementations/isel_bitalino.dart';
import 'package:telemon_app/src/data/model/device/configurations/sensor_module.dart';

import 'implementations/bitalino_wearable.dart';

abstract class IDevice {
  abstract String name ;
  abstract List<SensorModule> sensors;
}

enum DeviceImplementations { ISEL_BITALINO, BITALINO_WEARABLE }

extension instance on DeviceImplementations {
  IDevice get value {
    switch (this) {
      case DeviceImplementations.ISEL_BITALINO:
        return IselBitalino();
      case DeviceImplementations.BITALINO_WEARABLE:
        return BitalinoWearable();
    }
    throw new Exception(
        "The value $this is not a valid sensor"); //TODO exception management and string
  }
}