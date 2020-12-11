import 'package:bitalino/bitalino.dart';
import 'package:telemon_app/src/services/platforms/implementations/android.dart';

class BluetoothService {
  static Future<BITalinoController> connectToDevice() async {
    var controller = await AndroidOperations.connectToBluetoothDevice();
    await controller.connect(
      //TODO lidar com isto
      onConnectionLost: () {
        print("Connection lost");
      },
    );
    return controller;
  }

  static Future<void> startAcquisition(
      BITalinoController bitalinoController) async {
    //TODO add frequencyes p ficheiro config
    //TODO map the sensors to enum [emg,ecg ,etc]
    //TODO show this
    bool success = await bitalinoController.start([0], Frequency.HZ1,
        onDataAvailable: (BITalinoFrame frame) {
      print(frame.sequence); // [int]
      print(frame.analog); // [List<int>]
      print(frame.digital); // [List<int>]
    });
  }

  static Future<bool> stopAcquisition(
      BITalinoController bitalinoController) async {
    return await bitalinoController.stop();
  }

//TODO ask se se faz disconnect tendo em conta que ñ etá disponivel em iOS
}
