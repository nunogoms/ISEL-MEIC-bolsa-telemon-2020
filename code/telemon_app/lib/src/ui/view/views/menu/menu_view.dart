import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/consts/globals.dart';
import 'package:telemon_app/src/consts/theme/colors.dart';
import 'package:telemon_app/src/ui/view/widgets/appbars/back_title_appbar.dart';
import 'package:telemon_app/src/ui/view/widgets/bottom_nav_bar.dart';
import 'file:///C:/Users/nunom/Documents/ISEL/Bolsa-Telemonitorization/CODE-ISEL-MEIC-bolsa-telemon-2020/code/telemon_app/lib/src/ui/view/views/menu/fragments/device_page.dart';
import 'file:///C:/Users/nunom/Documents/ISEL/Bolsa-Telemonitorization/CODE-ISEL-MEIC-bolsa-telemon-2020/code/telemon_app/lib/src/ui/view/views/menu/fragments/measurements_page.dart';
import 'file:///C:/Users/nunom/Documents/ISEL/Bolsa-Telemonitorization/CODE-ISEL-MEIC-bolsa-telemon-2020/code/telemon_app/lib/src/ui/view/views/menu/fragments/settings_page.dart';
import 'file:///C:/Users/nunom/Documents/ISEL/Bolsa-Telemonitorization/CODE-ISEL-MEIC-bolsa-telemon-2020/code/telemon_app/lib/src/ui/view/views/menu/fragments/wip_page.dart';
import 'package:telemon_app/src/ui/viewmodels/device_viewmodel.dart';

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
  List historic = List();

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
            currentMenuIndex = historic.last;
            if (historic.length > 1) historic.removeLast();
          });
          return Future.value(true);
        },
        child: Scaffold(
            appBar: BackTitleAppbar(
                    menuWidgetOptions.elementAt(currentMenuIndex).title)
                .build(context),
            bottomNavigationBar:
                BottomNavBar(index: currentMenuIndex, handleIndex: _handleTap),
            body: ChangeNotifierProvider(
                create: (context) => DeviceViewModel(),
                child: new Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: ThemeColors.theme.PRIMARY_WHITE,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: menuWidgetOptions.elementAt(currentMenuIndex).widget,
                ))));
  }
}
