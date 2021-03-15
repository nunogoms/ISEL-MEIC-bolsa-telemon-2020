import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/general/consts/globals.dart';
import 'package:telemon_app/src/general/theme/colors.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/ui/view/widgets/bottom_nav_bar.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

import 'fragments/device_page.dart';
import '../measurements/measurements_list/measurements_page.dart';
import 'fragments/settings_page.dart';
import 'fragments/wip_page.dart';

class MenuObject {
  Widget widget;
  String title;

  MenuObject(this.widget, this.title);
}

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int currentMenuIndex = 0;
  List historic = [];

  void _handleTap(int newIndex) {
    setState(() {
      historic.add(currentMenuIndex);
      currentMenuIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MenuObject> menuWidgetOptions = [
      new MenuObject(WipPage(), l10n(context).summary),
      new MenuObject(MeasurementsPage(), l10n(context).measurements),
      new MenuObject(DevicePage(), l10n(context).device),
      new MenuObject(SettingsPage(), l10n(context).settings),
    ];

    return WillPopScope(
        onWillPop: () {
          setState(() {
            //Setting up a manual historic to travel between accessed pages
            if (historic.length > 0) currentMenuIndex = historic.last;
            if (historic.length > 1) historic.removeLast();
          });
          return Future.value(true);
        },

        child: Scaffold(
            appBar: BackTitleAppbar(menuWidgetOptions.elementAt(currentMenuIndex).title),
            bottomNavigationBar:
                BottomNavBar(index: currentMenuIndex, handleIndex: _handleTap, key: Key(this.hashCode.toString())),
            body: new Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: ThemeColors.theme.PRIMARY_WHITE,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: menuWidgetOptions.elementAt(currentMenuIndex).widget,
            )));
  }
}
