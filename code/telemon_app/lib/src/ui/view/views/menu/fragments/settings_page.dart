import 'package:bitalino/bitalino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/general/consts/globals.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';
import 'package:telemon_app/src/general/extension_methods/string_extension.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  _SettingsPageState();

  @override
  Widget build(BuildContext context) {
    SettingsViewModel settingsViewModel =
        Provider.of<SettingsViewModel>(context);

    return Container(
        child: Column(children: <Widget>[
      Row(
        children: [
          Text(l10n(context).frequency.toString().addTwoDots),
          DropdownButton<String>(
            value: settingsViewModel.examSettings.sampleFrequency.toString(),
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
            //iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              settingsViewModel.setSampleFrequency(newValue);
            },
            items: settingsViewModel
                .getPossibleFrequencies()
                .map<DropdownMenuItem<String>>((Frequency value) {
              return DropdownMenuItem<String>(
                value: value.toString(),
                child: Text(value.toString()),
              );
            }).toList(),
          )
        ],
      ),
      Row(
        children: [
          Text(l10n(context).measurementDuration.toString().addSecondsAndTwoDots),
          DropdownButton<String>(
            value: settingsViewModel.examSettings.duration.toString(),
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
            //iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              settingsViewModel.setDuration(newValue);
            },
            items: settingsViewModel
                .getPossibleDurations()
                .map<DropdownMenuItem<String>>((int value) {
              return DropdownMenuItem<String>(
                value: value.toString(),
                child: Text(value.toString()),
              );
            }).toList(),
          )
        ],
      ),
      Row(
        children: [
          Text(l10n(context).graphDuration.toString().addSecondsAndTwoDots),
          DropdownButton<String>(
            value: settingsViewModel.examSettings.secondsToShow.toString(),
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
            //iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              settingsViewModel.setSecondsToShow(newValue);
            },
            items: settingsViewModel
                .getPossibleTimesToShow()
                .map<DropdownMenuItem<String>>((int value) {
              return DropdownMenuItem<String>(
                value: value.toString(),
                child: Text(value.toString()),
              );
            }).toList(),
          )
        ],
      )
    ]));
  }
}
