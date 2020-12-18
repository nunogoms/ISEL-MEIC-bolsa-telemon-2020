import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemon_app/src/theme/definitions/colors.dart';
import 'package:telemon_app/src/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/widgets/bottom_nav_bar.dart';
import 'package:telemon_app/src/widgets/pages/menu/device_page.dart';
import 'package:telemon_app/src/widgets/pages/menu/ecg_page.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  String currentTitle = "";
  int currentMenuIndex = 0;

  static List<Widget> menuWidgetOptions = <Widget>[
    DevicePage(),
    EcgPage(),
    DevicePage(),
    DevicePage(),
  ];//TODO alterar esta lista para ter titulos, e icons num objecto

  void _handleTap(int newIndex) {
    setState(() {
      currentMenuIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: BackTitleAppbar("Dispositivo").build(context),
        bottomNavigationBar:
            BottomNavBar(index: currentMenuIndex, handleIndex: _handleTap),
        body: new Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: ThemeColors.theme.PRIMARY_WHITE,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: menuWidgetOptions.elementAt(currentMenuIndex),
        ));
  }
}

/*
BottomNavBar( Widget highlightsWidget, Widget measurementsWidget,Widget deviceWidget,Widget settingsWidget):
      this.widgetOptions = List<Widget>.of([highlightsWidget,measurementsWidget,deviceWidget,settingsWidget])
 */
