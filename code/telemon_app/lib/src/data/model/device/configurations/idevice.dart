import 'package:telemon_app/src/data/model/device/configurations/implementations/isel_bitalino.dart';
import 'package:telemon_app/src/data/model/device/configurations/sensor_module.dart';

import 'implementations/bitalino_wearable.dart';

///Used to represent all the configurations allowed in the devices.
abstract class IDevice {
  /// The name given to this configuration
  abstract String name ;
  /// The full list of sensors that this configuration has attached to it,
  /// it must contain the full information about the sensors as how they work,
  /// the channels and the units
  abstract List<SensorModule> sensors;
}

///Used to map the name to the devices themselves
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