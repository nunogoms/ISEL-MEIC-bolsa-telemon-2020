import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/widgets/appbars/back_title_appbar.dart';

class MeasurementsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackTitleAppbar("Medições").build(context),
      body:  Center(
        child: Text('Hello, world!'),
      ),
    );
  }

}