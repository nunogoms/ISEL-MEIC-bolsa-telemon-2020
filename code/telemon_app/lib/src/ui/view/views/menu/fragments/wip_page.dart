import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/general/consts/globals.dart';

class WipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Center(
          child: Text(
            l10n(context).wip,
            style: new TextStyle(
              fontSize: 30.0,
            ),
          ),
        ));
  }
}
