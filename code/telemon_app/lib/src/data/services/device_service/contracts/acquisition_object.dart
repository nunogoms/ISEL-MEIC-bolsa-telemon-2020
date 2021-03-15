import 'package:telemon_app/src/data/model/device/sensors/sensor_name.dart';

abstract class AcquisitionObject {
  SensorName sensor;

  AcquisitionObject(this.sensor);
}
