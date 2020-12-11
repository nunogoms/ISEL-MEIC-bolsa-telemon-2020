import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/widgets/bottom_nav_bar.dart';

class DeviceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackTitleAppbar("Dispositivo").build(context),
      bottomNavigationBar: BottomNavBar(ModalRoute.of(context).settings.name),
      backgroundColor: ThemeColors.theme.SECONDARY_GREY,
      body: new Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text("ECG")),
    );
  }
}
