import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/model/device/sensors/sensor_name.dart';
import 'package:telemon_app/src/data/services/device_service/contracts/acquisition_object.dart';

class BitalinoObject extends AcquisitionObject {
  Frequency sampleFreq;
  Function(BITalinoFrame) callbackFun;

  BitalinoObject(SensorName sensor, this.sampleFreq, this.callbackFun)
      : super(sensor);
}
