import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/general/consts/globals.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/ui/view/widgets/bluetooth_device_entry.dart';
import 'package:telemon_app/src/ui/viewmodels/device_viewmodel.dart';

class BluetoothSearch extends StatefulWidget {
  @override
  _BluetoothSearchState createState() => _BluetoothSearchState();
}

class _BluetoothSearchState extends State<BluetoothSearch> {
  List<ScanResult> foundDevices = List();
  SnackBar snackBar;
  DeviceViewModel deviceViewModel;

  @override
  Widget build(BuildContext context) {
    deviceViewModel = Provider.of<DeviceViewModel>(context);

    _searchDevices(deviceViewModel);

    return Scaffold(
        appBar: BackTitleAppbar(l10n(context).deviceSearch).build(context),
        body: Container(
          child: ListView(
            children: [
              ...foundDevices
                  .map((scanResult) => BluetoothDeviceEntry(
                      scanResult,
                      (BuildContext newCtx) => _onConnectListener(
                          scanResult, deviceViewModel, newCtx)))
                  .toList()
            ],
          ),
        ));
  }

  @override
  Future<void> dispose() async {
    await deviceViewModel.stopScanning();
    super.dispose();
  }

  _searchDevices(DeviceViewModel deviceViewModel) {
    if (foundDevices.isEmpty) {
      deviceViewModel.scanDevices((ScanResult scanResult) {
        setState(() => foundDevices.add(scanResult));
        /*if (scanResult.advertisementData.connectable) {
          //TODO testing
        }*/
      });
    }
  }

  //TODO change this to another place likely a viewModel, too big and error prone to be in the view
  _onConnectListener(ScanResult scanResult, DeviceViewModel deviceViewModel,
      BuildContext context) async {
    List<BluetoothService> services = List();
    BluetoothDevice device = scanResult.device;

    try {
      snackBar = SnackBar(content:Text( l10n(context).tryingConnect));
      Scaffold.of(context).showSnackBar(snackBar);

      services = await device
          .connect(timeout: Duration(seconds: 5))
          .then((_) async => await device.discoverServices())
          .catchError(
              (_) => snackBar = SnackBar(content: Text( l10n(context).connectionError)));
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
    }
  }
}