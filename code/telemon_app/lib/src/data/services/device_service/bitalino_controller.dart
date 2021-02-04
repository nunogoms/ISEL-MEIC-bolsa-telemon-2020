import 'dart:io';

import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/data/services/device_service/platforms/implementations/android.dart';
import 'package:telemon_app/src/data/services/device_service/platforms/implementations/ios.dart';
import 'package:telemon_app/src/data/services/device_service/platforms/platform.dart';
import 'device_exceptions.dart';

import 'package:telemon_app/src/data/model/device/sensors_codes.dart';

class BitalinoController {
  final PlatformOperations _operations = _getOperationAccordingToPlatform();
  static BITalinoController _bitalinoController;

  static final BitalinoController _instance = BitalinoController._privateConstructor();

  BitalinoController._privateConstructor();

  factory BitalinoController(){
    return _instance;
  }

  static PlatformOperations _getOperationAccordingToPlatform() {
    if(Platform.isAndroid) return AndroidOperations();
    else if (Platform.isIOS) throw IosOperations();
    else throw OperatingSystemUnsupportedException(Platform.operatingSystem);
  }

  Future<bool> connectToDevice(String uuid) async {

    //TODO this now works via UUID, so add the search functionality :)))
    _bitalinoController = await _operations.connectToBluetoothDevice(uuid);
    return await _bitalinoController.connect(
      onConnectionLost: () {
        throw ConnectionDroppedException();
      },
    );
  }

  Future<bool> startAcquisition(SensorsCodes sensor,Frequency sampleFreq, Function (BITalinoFrame) callbackFun ) async {
    return await _bitalinoController.start([sensor.index], sampleFreq,
        onDataAvailable: callbackFun);
  }

  Future<bool> stopAcquisition() async {
    return await _bitalinoController.stop();
  }

  String getDeviceAddress() => _bitalinoController!=null ? _bitalinoController.address : null ;

  Future<bool> disposeController() async {
    return await _bitalinoController.dispose();
  }
}
