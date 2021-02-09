import 'dart:io';

import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/services/device_service/bitalino/bitalino_object.dart';
import 'package:telemon_app/src/data/services/device_service/contracts/idevice_controller.dart';
import 'package:telemon_app/src/data/services/device_service/device_exceptions.dart';
import 'package:telemon_app/src/data/services/device_service/platforms/implementations/android.dart';
import 'package:telemon_app/src/data/services/device_service/platforms/implementations/ios.dart';
import 'package:telemon_app/src/data/services/device_service/platforms/platform.dart';

class BitalinoController extends IDeviceController<BitalinoObject> {
  final PlatformOperations _operations = _getOperationAccordingToPlatform();
  static BITalinoController _bitalinoController;

  static final IDeviceController _instance =
      BitalinoController._privateConstructor();

  BitalinoController._privateConstructor();

  factory BitalinoController() {
    return _instance;
  }

  static PlatformOperations _getOperationAccordingToPlatform() {
    if (Platform.isAndroid)
      return AndroidOperations();
    else if (Platform.isIOS)
      throw IosOperations();
    else {
      throw OperatingSystemUnsupportedException(Platform.operatingSystem);
    }
  }

  Future<bool> connectToDevice(String uuid) async {
    _bitalinoController = await _operations.connectToBluetoothDevice(uuid);
    return await _bitalinoController.connect(
      onConnectionLost: () {
        throw ConnectionDroppedException();
      },
    );
  }

  Future<bool> startAcquisition(BitalinoObject bitalinoObject) async {
    return await _bitalinoController.start(
        [bitalinoObject.sensor.index], bitalinoObject.sampleFreq,
        onDataAvailable: bitalinoObject.callbackFun);
  }

  Future<bool> stopAcquisition() async {
    return await _bitalinoController.stop();
  }

  //String getDeviceAddress() => _bitalinoController!=null ? _bitalinoController.address : null ;

  Future<bool> disposeController() async {
    await _bitalinoController.disconnect();
    return await _bitalinoController.dispose();
  }
}
