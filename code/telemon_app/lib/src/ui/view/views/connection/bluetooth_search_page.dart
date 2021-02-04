import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/consts/globals.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/ui/viewmodels/device_viewmodel.dart';

class BluetoothSearch extends StatefulWidget{

  @override
  _BluetoothSearchState createState() => _BluetoothSearchState();
}

class _BluetoothSearchState extends State<BluetoothSearch> {
  List foundDevices = List();

  @override
  Widget build(BuildContext context) {
    final deviceViewModel = Provider.of<DeviceViewModel>(context);
    foundDevices = deviceViewModel.searchAllDevices();

    return Scaffold(
        appBar: BackTitleAppbar(l10n(context).deviceSearch).build(context),
        body: Text("a")
    );
  }
}