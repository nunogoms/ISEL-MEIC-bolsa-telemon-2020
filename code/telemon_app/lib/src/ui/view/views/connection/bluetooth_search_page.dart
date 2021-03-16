import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/data/services/bluetooth_service/bluetooth_dev.dart';
import 'package:telemon_app/src/general/consts/globals.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'file:///C:/Users/nunom/Documents/ISEL/Bolsa-Telemonitorization/work/CODE-ISEL-MEIC-bolsa-telemon-2020/code/telemon_app/lib/src/ui/view/views/connection/bluetooth_device_entry.dart';
import 'package:telemon_app/src/ui/viewmodels/device_viewmodel.dart';

class BluetoothSearch extends StatefulWidget {
  @override
  _BluetoothSearchState createState() => _BluetoothSearchState();
}

class _BluetoothSearchState extends State<BluetoothSearch> {
  final List<BluetoothDev> foundDevices = [];
  late final SnackBar snackBar;
  DeviceViewModel? deviceViewModel;

  @override
  Widget build(BuildContext context) {
    if(deviceViewModel == null) deviceViewModel = Provider.of<DeviceViewModel>(context);

    _searchDevices(deviceViewModel!);

    return Scaffold(
        appBar: BackTitleAppbar(l10n(context).deviceSearch),
        body: Container(
          child: ListView(
            children: [
              ...foundDevices
                  .map((scanResult) => BluetoothDeviceEntry(
                      scanResult,
                      (BuildContext newCtx) => _onConnectListener(
                          scanResult, deviceViewModel!, newCtx)))
                  .toList()
            ],
          ),
        ));
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await deviceViewModel!.stopScanning();
  }

  _searchDevices(DeviceViewModel deviceViewModel) {
    if (foundDevices.isEmpty) {
      deviceViewModel.scanDevices((BluetoothDev scanResult) {
        setState(() => foundDevices.add(scanResult));
      });
    }
  }

  //TODO change this to bluetooth controller and vm
  //TODO arranjar o uuid noutro lado maybe ? IDK vou aqui chegar com Mac though
  _onConnectListener(BluetoothDev scanResult, DeviceViewModel deviceViewModel,
      BuildContext context) async {

    try {
      snackBar = SnackBar(content: Text(l10n(context).tryingConnect));
      Scaffold.of(context).showSnackBar(snackBar);

      await deviceViewModel.connectDevice(scanResult);
      Navigator.pop(context);
    } on Exception catch (e) {
      snackBar = SnackBar(content: Text(l10n(context).connectionError));
      print('Reason : ' + e.toString());
    } catch (error) {
      snackBar = SnackBar(content: Text(l10n(context).connectionError));
    } finally {
      Scaffold.of(context).showSnackBar(snackBar);
    }

    //TODO add search for uuid in the case of being BLE conection, also passar a
    // logica disso para o controller

    /*try {
      snackBar = SnackBar(content: Text(l10n(context).tryingConnect));
      Scaffold.of(context).showSnackBar(snackBar);

      services = await device
          .connect(timeout: Duration(seconds: 5))
          .then((_) async => await device.discoverServices())
          .catchError((_) => snackBar =
              SnackBar(content: Text(l10n(context).connectionError)));
      await deviceViewModel.connectDevice(
          macAddress: device.id.toString(), uuid: services[0].uuid.toString());
      Navigator.pop(context);
    } on Exception catch (e) {
      snackBar = SnackBar(content: Text(l10n(context).connectionError));
      print('Reason : ' + e.toString());
    } catch (error) {
      snackBar = SnackBar(content: Text(l10n(context).connectionError));
    } finally {
      Scaffold.of(context).showSnackBar(snackBar);
    }*/
  }
}
