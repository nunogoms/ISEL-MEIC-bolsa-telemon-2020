import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/consts/theme/colors.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/ui/view/widgets/bottom_nav_bar.dart';
import 'package:telemon_app/src/ui/view/widgets/pages/menu/device_page.dart';
import 'package:telemon_app/src/ui/view/widgets/pages/menu/measurements_page.dart';
import 'package:telemon_app/src/ui/view/widgets/pages/menu/settings_page.dart';
import 'package:telemon_app/src/ui/view/widgets/pages/menu/wip_page.dart';
import 'package:telemon_app/src/ui/viewmodels/device_viewmodel.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  String currentTitle = ""; //TODO add dynamic title
  int currentMenuIndex = 0;

  static List<Widget> menuWidgetOptions = <Widget>[
    WipPage(),
    MeasurementsPage(),
    DevicePage(),
    SettingsPage(),
  ]; //TODO alterar esta lista para ter titulos, e icons num objecto

  void _handleTap(int newIndex) {
    setState(() {
      currentMenuIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackTitleAppbar("Dispositivo").build(context),
        //TODO change this title
        bottomNavigationBar:
            BottomNavBar(index: currentMenuIndex, handleIndex: _handleTap),
        body: ChangeNotifierProvider(
            create: (context) => DeviceViewModel(),
            child: new Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: ThemeColors.theme.PRIMARY_WHITE,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: menuWidgetOptions.elementAt(currentMenuIndex),
            )));
  }
}

/*
BottomNavBar( Widget highlightsWidget, Widget measurementsWidget,Widget deviceWidget,Widget settingsWidget):
      this.widgetOptions = List<Widget>.of([highlightsWidget,measurementsWidget,deviceWidget,settingsWidget])
 */
