import 'dart:io';

import 'package:bitalino/bitalino.dart';
import 'device_exceptions.dart';
import 'file:///C:/Users/nunom/Documents/ISEL/Bolsa-Telemonitorization/CODE-ISEL-MEIC-bolsa-telemon-2020/code/telemon_app/lib/src/data/services/platforms/implementations/android.dart';
import 'file:///C:/Users/nunom/Documents/ISEL/Bolsa-Telemonitorization/CODE-ISEL-MEIC-bolsa-telemon-2020/code/telemon_app/lib/src/data/services/platforms/platform.dart';
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

  Future<bool> startAcquisition(SensorsCodes sensor,Frequency sampleFreq, Function (BITalinoFrame) callbackFun ) async {
    return await _bitalinoController.start([sensor.index], sampleFreq,
        onDataAvailable: callbackFun);
  }

  Future<bool> stopAcquisition() async {
    return await _bitalinoController.stop();
  }

  String getDeviceAddress() => _bitalinoController!=null ? _bitalinoController.address : null ;

//TODO ask se se faz disconnect tendo em conta que ñ etá disponivel em iOS
}
