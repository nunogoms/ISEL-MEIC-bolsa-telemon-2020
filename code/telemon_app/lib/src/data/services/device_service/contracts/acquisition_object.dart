import 'package:telemon_app/src/data/model/device/sensors_codes.dart';

abstract class AcquisitionObject{
  SensorsCodes sensor;

  AcquisitionObject(this.sensor);
}