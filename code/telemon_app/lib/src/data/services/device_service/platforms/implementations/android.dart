import 'dart:core';

import 'package:bitalino/bitalino.dart';
import 'package:flutter/services.dart';
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_dev.dart';
import 'package:telemon_app/src/data/services/device_service/device_exceptions.dart';

import '../platform.dart';


class AndroidOperations implements PlatformOperations {

  @override
  Future<BITalinoController> connectBluetoothClassicDevice(BluetoothDev bluetoothDev) async {
    BITalinoController bitalinoController = BITalinoController(
      bluetoothDev.macId,
      CommunicationType.BTH,
    );

    try {
      await bitalinoController.initialize();
      return bitalinoController;
    } on PlatformException catch (Exception) {
      throw new BluetoothConnectionException(Exception.message != null ? Exception.message! : "");
    }
  }

  @override
  Future<BITalinoController> connectBluetoothLEDevice(BluetoothDev bluetoothDev) async {
    BITalinoController bitalinoController = BITalinoController(
      bluetoothDev.macId,
      CommunicationType.BLE,
    );

    try {
      await bitalinoController.initialize();
      return bitalinoController;
    } on PlatformException catch (Exception) {
      throw new BluetoothConnectionException(Exception.message != null ? Exception.message! : "");
    }
  }
}