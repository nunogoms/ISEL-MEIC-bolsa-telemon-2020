import 'dart:io';

import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_dev.dart';
import 'package:telemon_app/src/data/services/device_service/bitalino/bitalino_object.dart';
import 'package:telemon_app/src/data/services/device_service/contracts/idevice_controller.dart';
import 'package:telemon_app/src/data/services/device_service/device_exceptions.dart';
import 'package:telemon_app/src/data/services/device_service/platforms/implementations/android.dart';
import 'package:telemon_app/src/data/services/device_service/platforms/platform.dart';

class BitalinoController extends IDeviceController<BitalinoObject> {
  static final PlatformOperations _operations = _getOperationAccordingToPlatform();

  static late BITalinoController _bitalinoController;

  static late final BitalinoController _instance= BitalinoController._internal();
  BitalinoController._internal();

  factory BitalinoController() {
    return _instance;
  }

  static PlatformOperations _getOperationAccordingToPlatform() {
    if (Platform.isAndroid)
      return AndroidOperations();
    else {
      throw OperatingSystemUnsupportedException(Platform.operatingSystem);
    }
  }

  Future<bool> connectToDevice(BluetoothDev bluetoothDev) async {
    switch (bluetoothDev.blType) {
      case CommunicationType.BTH:
        {
          _bitalinoController =
              await _operations.connectBluetoothClassicDevice(bluetoothDev);
          break;
        }
      case CommunicationType.BLE:
        {
          _bitalinoController =
              await _operations.connectBluetoothLEDevice(bluetoothDev);
        }
    }

    return await _bitalinoController.connect(
      onConnectionLost: () {
        throw ConnectionDroppedException();
      },
    );
  }

  Future<bool> startAcquisition(BitalinoObject bitalinoObject) async {
    if(_bitalinoController==null)return false;
    return await _bitalinoController.start(
        [bitalinoObject.sensor.index], bitalinoObject.sampleFreq,
        onDataAvailable: bitalinoObject.callbackFun);
  }

  Future<bool> stopAcquisition() async {
    if(_bitalinoController==null)return false;
    return await _bitalinoController.stop();
  }

  Future<bool> disposeController() async {
    await _bitalinoController.disconnect();
    return await _bitalinoController.dispose();
  }
}
