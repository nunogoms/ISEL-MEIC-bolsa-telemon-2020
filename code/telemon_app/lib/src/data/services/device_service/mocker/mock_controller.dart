import 'package:telemon_app/src/data/services/device_service/contracts/idevice_controller.dart';
import 'package:telemon_app/src/data/services/device_service/mocker/mock_device.dart';

import 'mock_object.dart';

class MockController extends IDeviceController<MockObject> {
  final MockDevice _mockDevice = MockDevice();
  String currHash;

  static final IDeviceController _instance =
      MockController._privateConstructor();

  MockController._privateConstructor() {
    _mockDevice.setup();
  }

  factory MockController() {
    return _instance;
  }

  Future<bool> connectToDevice(String uuid) async {
    return Future.value(true);
  }

  Future<bool> startAcquisition(MockObject bitalinoObject) async {
    currHash =
        bitalinoObject.sampleFreq.toString() + bitalinoObject.sensor.toString();
    return await _mockDevice.addListener(currHash, bitalinoObject.callbackFun);
  }

  Future<bool> stopAcquisition() async {
    bool ans = await _mockDevice.removeListener(currHash);
    currHash = null;
    return ans;
  }

  Future<bool> disposeController() async {
    return true;
  }
}
