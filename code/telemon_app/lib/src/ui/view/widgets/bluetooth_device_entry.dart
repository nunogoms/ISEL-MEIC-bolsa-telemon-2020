import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:telemon_app/src/general/consts/globals.dart';
import 'package:telemon_app/src/general/extension_methods/string_extension.dart';
import 'package:telemon_app/src/general/theme/fonts.dart';

class BluetoothDeviceEntry extends StatelessWidget {
  final ScanResult element;
  final Function onConnectFunction;

  BluetoothDeviceEntry(this.element, this.onConnectFunction);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: SizedBox(
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n(context).name.toString().addTwoDots +
                                  (element.device.name.isEmpty
                                      ? l10n(context).unknownName
                                      : element.device.name),
                              style:
                                  TextStyle(fontSize: CustomFont.H3.fontSize),
                            ),
                            Text(l10n(context).mac.toString().addTwoDots +
                                element.device.id.toString())
                          ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(0),
                              child: FloatingActionButton.extended(
                                heroTag: element.device.id.toString()+"heroId",
                                onPressed: () => onConnectFunction(context),
                                label: Text(l10n(context).connect),
                              ))
                        ],
                      )
                    ]))));
  }
}
