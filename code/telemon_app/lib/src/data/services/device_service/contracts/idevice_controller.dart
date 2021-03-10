
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_dev.dart';
import 'package:telemon_app/src/data/services/device_service/contracts/acquisition_object.dart';

abstract class IDeviceController <T extends AcquisitionObject>  {

  Future<bool> connectToDevice(BluetoothDev bluetoothDev);

  Future<bool> startAcquisition(T acquisitionObject ) ;

  Future<bool> stopAcquisition();

  Future<bool> disposeController() ;
}