import 'dart:io';

import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/model/device/sensors_codes.dart';
import 'package:telemon_app/src/services/platforms/implementations/android.dart';
import 'package:telemon_app/src/services/platforms/platform.dart';
import 'package:telemon_app/src/services/device_exceptions.dart';

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
    else if (Platform.isIOS) throw OperatingSystemUnsupportedException(Platform.operatingSystem);
    else throw OperatingSystemUnsupportedException(Platform.operatingSystem);
  }

  Future<bool> connectToDevice(String macAdress) async {
    _bitalinoController = await _operations.connectToBluetoothDevice(macAdress);
    return await _bitalinoController.connect(
      onConnectionLost: () {
        throw ConnectionDroppedException();
      },
    );
  }

  Future<bool> startAcquisition(SensorsCodes sensor,Frequency sampleFreq,int numOfSamples, Function (BITalinoFrame) callbackFun ) async {
    return await _bitalinoController.start([sensor.index], sampleFreq, numberOfSamples: numOfSamples,
        onDataAvailable: callbackFun);
  }

  Future<bool> stopAcquisition() async {
    return await _bitalinoController.stop();
  }

  String getDeviceAddress() => _bitalinoController!=null ? _bitalinoController.address : null ;

//TODO ask se se faz disconnect tendo em conta que ñ etá disponivel em iOS
}
